#!/bin/sh
# SUMMARY: Namespace stress with a single short TCP/IPv6 connection over a veth pair in reverse order
# LABELS:
# REPEAT:

set -e

# Source libraries. Uncomment if needed/defined
#. "${RT_LIB}"
. "${RT_PROJECT_ROOT}/_lib/lib.sh"

NAME=test-ns

clean_up() {
    rm -rf ${NAME}-*
}
trap clean_up EXIT

linuxkit build -docker -format kernel+initrd -name ${NAME} ../../common.yml test.yml
RESULT="$(linuxkit run -cpus 2 ${NAME})"
echo "${RESULT}" | grep -q "suite PASSED"

exit 0
