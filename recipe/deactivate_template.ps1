# Restores the flag variables from the backups made at activation;
# assigning "" removes an Env: variable. The C/C++ variables are only
# restored if activation applied any flags to them.
if ($Env:CONDA_MICROARCH_BACKUP_RUSTFLAGS) { $Env:RUSTFLAGS = $Env:CONDA_MICROARCH_BACKUP_RUSTFLAGS } else { $Env:RUSTFLAGS = "" }
$Env:CONDA_MICROARCH_BACKUP_RUSTFLAGS = ""
@CFLAGS_SECTION@
if ($Env:CONDA_MICROARCH_APPLIED) {
    if ($Env:CONDA_MICROARCH_BACKUP_CFLAGS) { $Env:CFLAGS = $Env:CONDA_MICROARCH_BACKUP_CFLAGS } else { $Env:CFLAGS = "" }
    if ($Env:CONDA_MICROARCH_BACKUP_CXXFLAGS) { $Env:CXXFLAGS = $Env:CONDA_MICROARCH_BACKUP_CXXFLAGS } else { $Env:CXXFLAGS = "" }
    if ($Env:CONDA_MICROARCH_BACKUP_CPPFLAGS) { $Env:CPPFLAGS = $Env:CONDA_MICROARCH_BACKUP_CPPFLAGS } else { $Env:CPPFLAGS = "" }
    $Env:CONDA_MICROARCH_APPLIED = ""
    $Env:CONDA_MICROARCH_BACKUP_CFLAGS = ""
    $Env:CONDA_MICROARCH_BACKUP_CXXFLAGS = ""
    $Env:CONDA_MICROARCH_BACKUP_CPPFLAGS = ""
}
