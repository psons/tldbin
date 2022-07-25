# if this doesn't work, tyy activating the virtalenv.
app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)
cd ${app_home}/tlog/test
mkdir -p ../unit-test-tmp-dir
python -m unittest test*.py
