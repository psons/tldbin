# if this doesn't work, tyy activating the virtalenv.
app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)
cd ${app_home}/tlog/test
python -m unittest testtl.py testDocument.py test_journaldir.py testTlog.py
