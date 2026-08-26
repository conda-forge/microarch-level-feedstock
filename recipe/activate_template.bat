:: Appends the microarchitecture level flags to the Rust and compiler
:: flag variables, backing up the previous values for deactivation.
@set "CONDA_MICROARCH_BACKUP_RUSTFLAGS=%RUSTFLAGS%"
@if defined RUSTFLAGS (set "RUSTFLAGS=%RUSTFLAGS% @RUSTFLAGS@") else (set "RUSTFLAGS=@RUSTFLAGS@")
@CFLAGS_SECTION@
:: The C/C++ flags use MSVC syntax; only apply them when CC is cl or
:: clang-cl.
@set "_microarch_cc="
@if defined CC for %%i in ("%CC%") do @set "_microarch_cc=%%~nxi"
@set "CONDA_MICROARCH_APPLIED="
@if /I "%_microarch_cc%"=="cl.exe" set "CONDA_MICROARCH_APPLIED=1"
@if /I "%_microarch_cc%"=="cl" set "CONDA_MICROARCH_APPLIED=1"
@if /I "%_microarch_cc%"=="clang-cl.exe" set "CONDA_MICROARCH_APPLIED=1"
@if /I "%_microarch_cc%"=="clang-cl" set "CONDA_MICROARCH_APPLIED=1"
@set "_microarch_cc="
@if not defined CONDA_MICROARCH_APPLIED goto :microarch_end
@set "CONDA_MICROARCH_BACKUP_CFLAGS=%CFLAGS%"
@set "CONDA_MICROARCH_BACKUP_CXXFLAGS=%CXXFLAGS%"
@set "CONDA_MICROARCH_BACKUP_CPPFLAGS=%CPPFLAGS%"
@if defined CFLAGS (set "CFLAGS=%CFLAGS% @CFLAGS@") else (set "CFLAGS=@CFLAGS@")
@if defined CXXFLAGS (set "CXXFLAGS=%CXXFLAGS% @CXXFLAGS@") else (set "CXXFLAGS=@CXXFLAGS@")
@if defined CPPFLAGS (set "CPPFLAGS=%CPPFLAGS% @CPPFLAGS@") else (set "CPPFLAGS=@CPPFLAGS@")
:microarch_end
