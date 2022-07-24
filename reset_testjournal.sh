#!/bin/ksh
app_home=$(cd $(dirname $0)/..;pwd)
app_bin="${app_home}/tldbin"
artifact_dir_path="${app_home}/art"

echo In: $(basename $0)

tarFileName=tltestjournal_gitclone.tar
[[ "$1" ]] && tarFileName="${1}.tar"

bail ()  {
	exit_code=$1
	shift 
	print "$@"
	exit $exit_code
}

${app_bin}/capture_testjournal.sh tmp_reset_tltestjournal  || bail -1 "Could not capture a backout tar"
echo
echo Back In: $(basename $0)

cd "${app_home}/testuser" || bail -2 "could not cd into ${app_home}/testuser"

pwd
test_data_dir_name="tltestjournal"
echo "removing ${test_data_dir_name}/"
rm -rf ${test_data_dir_name} || bail -3 "Something is wrong. Don't see ${test_data_dir_name} to remove"

echo extracting ${tarFileName} into testuser 
tar xf "${artifact_dir_path}/${tarFileName}" 