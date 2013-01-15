escape() { echo "\033[$1m"; }
CB_BLUE=`escape 44`
CB_GREEN=`escape 42`
CB=$CB_BLUE
C_RESET=`escape 0`
echo_blue() { printf "$CB - - - %s - - - $C_RESET\n" $1; }

