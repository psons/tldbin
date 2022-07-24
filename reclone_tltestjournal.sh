
echo In: $(basename $0)

dev_home=$(cd $(dirname $0)/..; pwd)
cd "${dev_home}"

test_user_dir=testuser
mkdir -p "${test_user_dir}"
cd "${test_user_dir}" || bail -2 "could not cd into ${test_user_dir}"

pwd
test_data_dir_name="tltestjournal"
echo "removing ${test_data_dir_name}/"
rm -rf ${test_data_dir_name} || bail -3 "Something is wrong. Don't see ${test_data_dir_name} to remove"


git clone http://github.com/psons/tltestjournal.git 

capture_testjournal.sh tltestjournal_gitclone