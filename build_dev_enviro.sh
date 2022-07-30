#!/bin/sh
# Assuming this script exists in a bin dir, assume 
# the parent of this bin dir is the parent for the 
# other parts of a dev enviroonment.

doc='Build te following dirs:
.idea 
    - Pycharm ide data (optional separate script)
art 
    - archives for distribution and data to use in the testuser directory.
    - will be built by some of the installed scripts in tldbin/
tldbin 
    - scripts for dev tasks.
pyenvs 
    - a place to install Python virtual environments for dev and testing 
testuser 
    - a fake user home dir for destructive testing 
    - includes tes data pulled from a git repo.
tl2.code-workspace 
    - vscode ide data.
    - not supported yet
tlog 
    - the tlog module developmet git repo, including tests
'

#   assume bin has been cloned to run this script.
dev_home=$(cd $(dirname $0)/..; pwd)
cd "${dev_home}"

git clone http://github.com/psons/tlog.git 

# uses pip requiremets from tlog, so tlog clone is done above.
tldbin/createVenv.sh pyvenvs

test_user_dir=testuser
mkdir "${test_user_dir}"
cd "${test_user_dir}"
git clone http://github.com/psons/tltestjournal.git 

# capture the test data in a .tar to support local reset for test runs.
${dev_home}/tldbin/capture_testjournal.sh tltestjournal_gitclone.tar

mkdir "${dev_home}/unit-test-tmp-dir"
cd "${dev_home}"
${dev_home}/tldbin/run_tests.sh 

echo To load configuration forPycharm, run:
echo
echo "			 ${dev_home}/tldbin/load_tl-pycharm-idea.sh"
echo 
