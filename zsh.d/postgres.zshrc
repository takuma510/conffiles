## POSTGRES
#

# set postgres_cluster path
export POSTGRES_CLUSTER=/usr/local/var/postgres

# utils
function pg_start(){
  pg_ctl -D ${POSTGRES_CLUSTER} -l ${POSTGRES_CLUSTER}/server.log start
  echo "start pg cluster ${POSTGRES_CLUSTER}"
}

function pg_stop(){
  pg_ctl -D ${POSTGRES_CLUSTER} stop -s -m fast
  echo "stop pg cluster ${POSTGRES_CLUSTER}"
}
