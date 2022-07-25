#!/bin/sh
# Assuming this script exists in a bin dir, assume 
# the parent of this bin dir is the parent for the 
# other parts of a dev enviroonment.

doc='$ ls -1a
.idea - Pycharm ide data.
art - archives for distribution and data to use in the testuser directory.
bin - scripts for decv tasks.
pyenvs - a place to install Python virtual environments for devf and testing 
testuser - a fake user home dir for destructive testing 
tl2.code-workspace - vscode ider data.
tlbacklog - should be elsewhere for real tracking of stories and tasks with tlog.
tlog - the tlog module git repo.
'

# process:
#   assume bin has been cloned to run this script.
#   install python, or assume it is there and in a path
#   git clone tlog
#   run 
#   pull down rn configs / ide stuff for pycharem  (.idea)
#   run unit tests from run_tests.sh
#   make the test user directory using tar files, archives and scripts in bin.

#   assume bin has been cloned to run this script.
#set -x
dev_home=$(cd $(dirname $0)/..; pwd)
cd "${dev_home}"

git clone http://github.com/psons/tlog.git 

# uses pip requiremets from tlog
tldbin/createVenv.sh pyvenvs

test_user_dir=testuser
mkdir "${test_user_dir}"
cd "${test_user_dir}"
git clone http://github.com/psons/tltestjournal.git 

mkdir "${dev_home}/unit-test-tmp-dir"
cd "${dev_home}"
${dev_home}/tldbin/run_tests.sh 
