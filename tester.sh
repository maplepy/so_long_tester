#! /bin/bash

BLUE='\033[1;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[3;33m'
NOCOLOR='\033[0m'

DIR_PATH=".."
DIR_PROG="${DIR_PATH}/so_long"

print_msg() {
  echo -e "${BLUE}\n\n\n##### $1 #####\n\n\n\n${NOCOLOR}"
}

print_msg "TEST MAPS"
i=1
printf "${YELLOW}Test nº$i :	no arguments\n./so_long\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG; sleep 1

printf "${BLUE}\n\n\n#####		TEST Extensions		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i : 	no extension\n./so_long map\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map.; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.b\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map.b; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.be\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map.be; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	too long\n./so_long map.berr\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map.berr; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	too short\n./so_long .ber\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG .ber; sleep 1
printf "${YELLOW}\n\nTest nº$i : 	with folder\n./so_long /.ber\n\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG /.ber; sleep 1

printf "${BLUE}\n\n\n#####		TEST Map		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i :	no such file\n./so_long map.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG map.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	non square\n./so_long maps/non_square.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/non_square.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	map non closed\n./so_long maps/non_closed.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/non_closed.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	need 1 start\n./so_long maps/no_start.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/no_start.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	need 1 exit\n./so_long maps/no_exit.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/no_exit.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	need at least 1 collectibles\n./so_long maps/no_collectibles.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/no_collectibles.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	no more than 1 start\n./so_long maps/two_start.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/two_start.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	no more than 1 exit\n./so_long maps/two_exit.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/two_exit.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	only 0, 1, C, E, P characters\n./so_long maps/extra_letter.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/extra_letter.ber; sleep 1

printf "${BLUE}\n\n\n#####		TEST Finishable		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i :	player stuck\n./so_long maps/unfinishable_basic_1.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/unfinishable_basic_1.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	exit blocked\n./so_long maps/unfinishable_basic_2.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/unfinishable_basic_2.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	collectible blocked\n./so_long maps/unfinishable_basic_3.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/unfinishable_basic_3.ber; sleep 1
printf "${YELLOW}\n\nTest nº$i :	wall split map in two\n./so_long maps/unfinishable_basic_4.ber\n${NOCOLOR}"; ((i=i+1)); $DIR_PROG maps/unfinishable_basic_4.ber; sleep 1

printf "${BLUE}\n\n\n#####		TEST LEAKS		#####\n\n${NOCOLOR}"
i=1
printf "Test leaks nº$i :	no arguments\n./so_long\n${NOCOLOR}"; ((i=i+1)); leaks -atExit -- $DIR_PROG | grep "leaks for"

printf "${BLUE}\n\n\n#####		TEST Extensions		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i : 	no extension\n./so_long map\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map. | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.b\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map.b | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	uncomplete\n./so_long map.be\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map.be | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	too long\n./so_long map.berr\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map.berr | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	too short\n./so_long .ber\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG .ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i : 	with folder\n./so_long /.ber\n\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG /.ber | grep "leaks for"

printf "${BLUE}\n\n\n#####		TEST Map		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i :	no such file\n./so_long map.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG map.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	non square\n./so_long maps/non_square.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/non_square.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	map non closed\n./so_long maps/non_closed.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/non_closed.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	need 1 start\n./so_long maps/no_start.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/no_start.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	need 1 exit\n./so_long maps/no_exit.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/no_exit.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	need at least 1 collectibles\n./so_long maps/no_collectibles.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/no_collectibles.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	no more than 1 start\n./so_long maps/two_start.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/two_start.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	no more than 1 exit\n./so_long maps/two_exit.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/two_exit.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	only 0, 1, C, E, P characters\n./so_long maps/extra_letter.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/extra_letter.ber | grep "leaks for"

printf "${BLUE}\n\n\n#####		TEST Finishable		#####${NOCOLOR}"
i=1
printf "${YELLOW}\n\nTest nº$i :	player stuck\n./so_long maps/unfinishable_basic_1.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/unfinishable_basic_1.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	exit blocked\n./so_long maps/unfinishable_basic_2.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/unfinishable_basic_2.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	collectible blocked\n./so_long maps/unfinishable_basic_3.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/unfinishable_basic_3.ber | grep "leaks for"
printf "${YELLOW}\n\nTest nº$i :	wall split map in two\n./so_long maps/unfinishable_basic_4.ber\n${NOCOLOR}"; ((i=i+1)); leaks --atExit -- $DIR_PROG maps/unfinishable_basic_4.ber | grep "leaks for"

#Cleaning after tests
make fclean -C $DIR_PATH > /dev/null
