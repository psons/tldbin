#!/bin/ksh 
app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)

tarFileName=tmp_tltestjournal.tar
[[ "$1" ]] && tarFileName="${1}.tar"

bail ()  {
	exit_code=$1
	shift 
	print "$@"
	exit $exit_code
}

cd ${app_home}/testuser || bail -2 "could not cd into ${app_home}/testuser"

pwd
echo capturing ${tarFileName}
tar cf "../art/${tarFileName}" tltestjournal