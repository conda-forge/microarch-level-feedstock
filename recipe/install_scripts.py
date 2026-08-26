"""Cross-platform port of install_scripts.sh: installs the (de)activation
scripts that set the compiler and Rust flags for the selected level."""
import os
from pathlib import Path

family = os.environ["MICROARCH_FAMILY"]
level = os.environ["MICROARCH_LEVEL"]
prefix = Path(os.environ["PREFIX"])
recipe_dir = Path(os.environ["RECIPE_DIR"])

if family == "x86_64":
    target_cpu = "x86-64" if level == "1" else f"x86-64-v{level}"
    unix_c_flag = f"-march={target_cpu}"
    # MSVC has no /arch flag below AVX (levels 1 and 2), and each /arch
    # option subsumes the lower ones, so one flag per level suffices.
    win_c_flag = {"1": "", "2": "", "3": "/arch:AVX2", "4": "/arch:AVX512"}[level]
    # rustc is LLVM-based everywhere, so RUSTFLAGS covers all levels.
    rust_flag = f"-Ctarget-cpu={target_cpu}"
elif family == "ppc64le":
    unix_c_flag = f"-mcpu=power{level}"
    win_c_flag = None  # no Windows on ppc64le
    rust_flag = f"-Ctarget-cpu=pwr{level}"
else:
    raise ValueError(f"unknown family: {family}")

sh_template = (recipe_dir / "actdeact_template.sh").read_text()

for nature in ("activate", "deactivate"):
    dest_dir = prefix / "etc" / "conda" / f"{nature}.d"
    dest_dir.mkdir(parents=True, exist_ok=True)

    content = (
        sh_template
        .replace("@CFLAGS@", unix_c_flag)
        .replace("@CXXFLAGS@", unix_c_flag)
        .replace("@CPPFLAGS@", unix_c_flag)
        .replace("@RUSTFLAGS@", rust_flag)
        .replace("@actdeact@", nature)
    )
    dest = dest_dir / f"~{nature}-{family}-level.sh"
    dest.write_text(content, newline="\n")
    print(f"installed {dest}")

    if win_c_flag is None:
        continue

    # cmd.exe only runs .bat activation scripts and PowerShell only .ps1;
    # .bat files require CRLF line endings.
    for suffix, newline in ((".bat", "\r\n"), (".ps1", "\n")):
        template = (recipe_dir / f"{nature}_template{suffix}").read_text()
        # The part below the marker handles the C/C++ flags; drop it for
        # levels MSVC cannot target.
        head, _, tail = template.partition("@CFLAGS_SECTION@\n")
        content = (
            (head + tail if win_c_flag else head)
            .replace("@CFLAGS@", win_c_flag)
            .replace("@CXXFLAGS@", win_c_flag)
            .replace("@CPPFLAGS@", win_c_flag)
            .replace("@RUSTFLAGS@", rust_flag)
        )
        dest = dest_dir / f"~{nature}-{family}-level{suffix}"
        dest.write_text(content, newline=newline)
        print(f"installed {dest}")
