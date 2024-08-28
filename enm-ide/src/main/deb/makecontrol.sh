#!/bin/bash

OUTPUT_DIR=$1

[[ ! -d ${OUTPUT_DIR} ]] && mkdir -p ${OUTPUT_DIR}
cat control.head >${OUTPUT_DIR}/control
echo -n "Depends: " >>${OUTPUT_DIR}/control
grep -v '^$' control.deps | paste -s -d, >>${OUTPUT_DIR}/control


