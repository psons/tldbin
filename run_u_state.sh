app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)
cd ${app_home}/testuser/


${app_home}/tldbin/make_deploy_test_u.sh
${app_home}/tldbin/reset_testjournal.sh $1
${app_home}/pyvenvs/pyvenv_3.9.5/bin/python -m tlog