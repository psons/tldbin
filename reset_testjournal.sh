#!/bin/ksh
app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)

tarFileName=tltestjournal1.tar
[[ "$1" ]] && tarFileName="${1}.tar"

bail ()  {
	exit_code=$1
	shift 
	print "$@"
	exit $exit_code
}

capture_testjournal.sh tmp_reset_tltestjournal  || bail -1 "Could not capture a backout tar"

cd ${app_home}/testuser || bail -2 "could not cd into ${app_home}/testuser"

pwd
test_data_dir_name="tltestjournal"
echo "removing ${test_data_dir_name}/"
rm -rf ${test_data_dir_name} || bail -3 "Something is wrong. Don't see ${test_data_dir_name} to remove"

echo extracting ${tarFileName} into testuser 
tar xf "../art/${tarFileName}" 