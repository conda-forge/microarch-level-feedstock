:: Restores the flag variables from the backups made at activation;
:: `set "VAR="` unsets empty variables. The C/C++ variables are only
:: restored if activation applied any flags to them.
@if defined CONDA_MICROARCH_BACKUP_RUSTFLAGS (set "RUSTFLAGS=%CONDA_MICROARCH_BACKUP_RUSTFLAGS%") else (set "RUSTFLAGS=")
@set "CONDA_MICROARCH_BACKUP_RUSTFLAGS="
@CFLAGS_SECTION@
@if not defined CONDA_MICROARCH_APPLIED goto :microarch_end
@set "CONDA_MICROARCH_APPLIED="
@if defined CONDA_MICROARCH_BACKUP_CFLAGS (set "CFLAGS=%CONDA_MICROARCH_BACKUP_CFLAGS%") else (set "CFLAGS=")
@if defined CONDA_MICROARCH_BACKUP_CXXFLAGS (set "CXXFLAGS=%CONDA_MICROARCH_BACKUP_CXXFLAGS%") else (set "CXXFLAGS=")
@if defined CONDA_MICROARCH_BACKUP_CPPFLAGS (set "CPPFLAGS=%CONDA_MICROARCH_BACKUP_CPPFLAGS%") else (set "CPPFLAGS=")
@set "CONDA_MICROARCH_BACKUP_CFLAGS="
@set "CONDA_MICROARCH_BACKUP_CXXFLAGS="
@set "CONDA_MICROARCH_BACKUP_CPPFLAGS="
:microarch_end
