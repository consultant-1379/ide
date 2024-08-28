install_dir=/usr/local/versant

export USER_INSTALL_DIR=${install_dir}
export CREATE_OSCDBID_FILE=TRUE
export DBID_PATH=${install_dir}/databases
export DBID_NODE=localhost
export DB_PATH=${install_dir}/databases
export DBSA_GROUP=versant
export DBSA_LOGIN=versant

export PATH="${PATH}:${USER_INSTALL_DIR}/bin:${DB_PATH}"
