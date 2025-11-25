mkdir -p "${PREFIX}"/etc/conda/{de,}activate.d/

if [[ "${family}" == "x86_64" ]]; then
  if [[ "${level}" == "1" ]]; then
    flag="-march=x86-64"
  else
    flag="-march=x86-64-v${level}"
  fi
elif [[ "${family}" == "ppc64le" ]]; then
  flag="-mcpu=power${level}"
fi

cp ${RECIPE_DIR}/actdeact_template.sh "${SRC_DIR}/activate-${family}-level.sh"
cp ${RECIPE_DIR}/actdeact_template.sh "${SRC_DIR}/deactivate-${family}-level.sh"

sed -i.bak "s|@CFLAGS@|${flag}|g" "${SRC_DIR}/activate-${family}-level.sh"
sed -i.bak "s|@CXXFLAGS@|${flag}|g" "${SRC_DIR}/activate-${family}-level.sh"
sed -i.bak "s|@CPPFLAGS@|${flag}|g" "${SRC_DIR}/activate-${family}-level.sh"
sed -i.bak "s|@actdeact@|activate|g" "${SRC_DIR}/activate-${family}-level.sh"

sed -i.bak "s|@CFLAGS@|${flag}|g" "${SRC_DIR}/deactivate-${family}-level.sh"
sed -i.bak "s|@CXXFLAGS@|${flag}|g" "${SRC_DIR}/deactivate-${family}-level.sh"
sed -i.bak "s|@CPPFLAGS@|${flag}|g" "${SRC_DIR}/deactivate-${family}-level.sh"
sed -i.bak "s|@actdeact@|deactivate|g" "${SRC_DIR}/deactivate-${family}-level.sh"

cp "${SRC_DIR}"/activate-${family}-level.sh "${PREFIX}/etc/conda/activate.d/~activate-${family}-level.sh"
cp "${SRC_DIR}"/deactivate-${family}-level.sh "${PREFIX}/etc/conda/deactivate.d/~deactivate-${family}-level.sh"
