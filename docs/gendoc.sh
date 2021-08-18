#!/bin/bash

DOCS="$(dirname $(readlink -f $0))"
ROOT="$(dirname ${DOCS})"
CONFIG="${DOCS}/config.ld"

cd "${ROOT}"

vinfo="v$(grep "^version = " "${ROOT}/mod.conf" | head -1 | sed -e 's/version = //')"

# Clean old files
rm -rf "${DOCS}/api.html" "${DOCS}/scripts" "${DOCS}/modules" "${DOCS}/source"
# Create new files
ldoc -c "${CONFIG}" -d "${DOCS}" -o "api" "${ROOT}"
retval=$?

# check exit status
if test ${retval} -ne 0; then
	echo -e "\nan error occurred (ldoc return code: ${retval})"
	exit ${retval}
fi

# show version info
echo -e "\nfinding ${vinfo}..."
for html in $(find "${DOCS}" -type f -name "*.html"); do
	sed -i -e "s|^<h1>pbmarks</h1>$|<h1>pbmarks <span style=\"font-size:12pt;\">(${vinfo})</span></h1>|" "${html}"
done
