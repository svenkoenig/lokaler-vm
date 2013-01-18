if [[ -z "$1" ]]; then echo "ERROR: name of instance needed!"; exit 1; fi 

PATH_HERE="`dirname \"$0\"`"
. $PATH_HERE/settings.sh

instance=$1
remote_dir="/home/lokaler/production/$instance/media/"

remote_dir_exists=`ssh $LOGIN "sh -c \"if [ -d ${remote_dir} ]; then echo 1; else echo 0; fi\""`
if [ $remote_dir_exists -eq 0 ]; then echo "ERROR: remote dir \"${remote_dir}\" doesn't exist!"; exit 1; fi

local_dir=$HOME/production/${instance}/media/

mkdir -p $local_dir
rsync -avz -e ssh $LOGIN:${remote_dir}/* ${local_dir}/