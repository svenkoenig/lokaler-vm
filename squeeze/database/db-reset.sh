pushd $PATH_LOKALER_VM/database > /dev/null
. ./db_settings.sh

dropdb -U postgres lokaler 2> /dev/null
createdb -U postgres lokaler -T template_postgis
$MANAGE syncdb --noinput
$MANAGE create_or_reset_admin
$MANAGE migrate

popd > /dev/null