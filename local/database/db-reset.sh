db_name=lokaler_berlin

pushd $PATH_LOKALER_VM/database > /dev/null
. ./db_settings.sh

dropdb -U postgres $db_name 2> /dev/null
createdb -U postgres $db_name -T template_postgis
$MANAGE syncdb --noinput
$MANAGE create_or_reset_admin
$MANAGE migrate

popd > /dev/null