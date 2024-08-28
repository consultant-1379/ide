#!/bin/sh

# export environment variables
export PY_3PPS=/usr/local
export PYTHON_HOME=/usr/bin/python
export PYTHONPATH="${PY_3PPS}/usr/lib/python2.7/site-packages:${PY_3PPS}/usr/lib/python2.7/dist-packages"
export PATH="${PATH}:${PYTHON_HOME}/bin:${PY_3PPS}/usr/bin"
