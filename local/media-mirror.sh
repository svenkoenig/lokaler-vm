if [[ -z "$1" ]]; then echo "ERROR: name of instance needed!"; exit 1; fi 

PATH_HERE="`dirname \"$0\"`"
. $PATH_HERE/settings.sh

instance=$1

REMOTE_MEDIA_DIR=${REMOTE_INSTANCES_DIR}${instance}/media
LOCAL_MEDIA_DIR=${LOCAL_INSTANCES_DIR}${instance}/media

REMOTE_MEDIA_DIR_exists=`ssh $LOGIN "sh -c \"if [ -d ${REMOTE_MEDIA_DIR} ]; then echo 1; else echo 0; fi\""`
if [ $REMOTE_MEDIA_DIR_exists -eq 0 ]; then echo "ERROR: remote dir \"${REMOTE_MEDIA_DIR}\" doesn't exist!"; exit 1; fi

mkdir -p $LOCAL_MEDIA_DIR
rsync -avz -e ssh $LOGIN:${REMOTE_MEDIA_DIR}/* ${LOCAL_MEDIA_DIR}/