# Appends the microarchitecture level flags to the Rust and compiler
# flag variables, backing up the previous values for deactivation.
$Env:CONDA_MICROARCH_BACKUP_RUSTFLAGS = $Env:RUSTFLAGS
if ($Env:RUSTFLAGS) { $Env:RUSTFLAGS = "${Env:RUSTFLAGS} @RUSTFLAGS@" } else { $Env:RUSTFLAGS = "@RUSTFLAGS@" }
@CFLAGS_SECTION@
# The C/C++ flags use MSVC syntax; only apply them when CC is cl or
# clang-cl.
$MicroarchCC = if ($Env:CC) { [IO.Path]::GetFileName($Env:CC) } else { "" }
if ($MicroarchCC -in "cl", "cl.exe", "clang-cl", "clang-cl.exe") {
    $Env:CONDA_MICROARCH_APPLIED = "1"
    $Env:CONDA_MICROARCH_BACKUP_CFLAGS = $Env:CFLAGS
    $Env:CONDA_MICROARCH_BACKUP_CXXFLAGS = $Env:CXXFLAGS
    $Env:CONDA_MICROARCH_BACKUP_CPPFLAGS = $Env:CPPFLAGS
    if ($Env:CFLAGS) { $Env:CFLAGS = "${Env:CFLAGS} @CFLAGS@" } else { $Env:CFLAGS = "@CFLAGS@" }
    if ($Env:CXXFLAGS) { $Env:CXXFLAGS = "${Env:CXXFLAGS} @CXXFLAGS@" } else { $Env:CXXFLAGS = "@CXXFLAGS@" }
    if ($Env:CPPFLAGS) { $Env:CPPFLAGS = "${Env:CPPFLAGS} @CPPFLAGS@" } else { $Env:CPPFLAGS = "@CPPFLAGS@" }
}
Remove-Variable MicroarchCC -ErrorAction SilentlyContinue
