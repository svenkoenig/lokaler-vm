if [[ -z "$1" ]]; then echo "ERROR: name of instance needed!"; exit 1; fi 

instance=$1
remote_dir="/home/lokaler/production/$instance/media/"

remote_dir_exists=`ssh sven@89.238.64.39 "sh -c \"if [ -d ${remote_dir} ]; then echo 1; else echo 0; fi\""`
if [ $remote_dir_exists -eq 0 ]; then echo "ERROR: remote dir \"${remote_dir}\" doesn't exist!"; exit 1; fi

local_dir=$HOME/production/${instance}/media/

mkdir -p $local_dir
rsync -avz -e ssh sven@89.238.64.39:${remote_dir}/* ${local_dir}/