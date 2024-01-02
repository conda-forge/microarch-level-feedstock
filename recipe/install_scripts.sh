mkdir -p "${PREFIX}"/etc/conda/{de,}activate.d/

#  MSVC does not support targeting specific microarchitectures, but does
#  support enabling some of the vector instructions. Thus, we can enable
#  vector instructions by manually setting the compiler flags for some of the
#  instruction in each of the x86 microarch levels.
#
#  https://learn.microsoft.com/en-us/cpp/preprocessor/predefined-macros
#  https://learn.microsoft.com/en-us/cpp/build/reference/arch-x64
#  https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels

msvc_flags=""

if [[ "${family}" == "x86_64" ]]; then
  if [[ "${level}" == "1" ]]; then
    flag="-march=x86-64"
  else
    flag="-march=x86-64-v${level}"
  fi
  if [[ "${level}" -ge "3" ]]; then
    msvc_flags="${msvc_flags} /arch:AVX /arch:AVX2"
  fi
  if [[ "${level}" -ge "4" ]]; then
    msvc_flags="${msvc_flags} /arch:AVX512"
  fi
elif [[ "${family}" == "ppc64le" ]]; then
  flag="-mcpu=power${level}"
fi

cat << EOF > "${PREFIX}/etc/conda/activate.d/~activate-${family}-level.sh"
export CXXFLAGS="\${CXXFLAGS} ${flag}"
export CFLAGS="\${CFLAGS} ${flag}"
export CPPFLAGS="\${CPPFLAGS} ${flag}"
EOF

cat << EOF > "${PREFIX}/etc/conda/activate.d/~activate-${family}-level.bat"
set CXXFLAGS="%CXXFLAGS% ${msvc_flags}"
set CFLAGS="%CFLAGS% ${msvc_flags}"
set CPPFLAGS="%CPPFLAGS% ${msvc_flags}"
EOF
