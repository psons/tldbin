# if this doesn't work, tyy activating the virtalenv.
set -x

app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)
cd ${app_home}/tlog/test

export PYTHONPATH="${app_home}/tlog/tlog"

mkdir -p ../unit-test-tmp-dir
python -m unittest test*.py
