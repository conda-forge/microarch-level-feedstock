"""Cross-platform port of install_scripts.sh: installs the (de)activation
scripts that set -march/-mcpu compiler flags for the selected level."""
import os
from pathlib import Path

family = os.environ["MICROARCH_FAMILY"]
level = os.environ["MICROARCH_LEVEL"]
prefix = Path(os.environ["PREFIX"])
recipe_dir = Path(os.environ["RECIPE_DIR"])

if family == "x86_64":
    flag = "-march=x86-64" if level == "1" else f"-march=x86-64-v{level}"
elif family == "ppc64le":
    flag = f"-mcpu=power{level}"
else:
    raise ValueError(f"unknown family: {family}")

template = (recipe_dir / "actdeact_template.sh").read_text()

for nature in ("activate", "deactivate"):
    content = (
        template
        .replace("@CFLAGS@", flag)
        .replace("@CXXFLAGS@", flag)
        .replace("@CPPFLAGS@", flag)
        .replace("@actdeact@", nature)
    )
    dest_dir = prefix / "etc" / "conda" / f"{nature}.d"
    dest_dir.mkdir(parents=True, exist_ok=True)
    dest = dest_dir / f"~{nature}-{family}-level.sh"
    dest.write_text(content, newline="\n")
    print(f"installed {dest}")
