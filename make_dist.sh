app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)
cd ${app_home}/tlog/tlog
pwd
set -x

# tar cvf ../../art/tl2_dist.tar journaldir.py tlog.env.sample tlog.py tldocument.py docsec.py
artifact_dir="${app_home}/art"
mkdir -p "${artifact_dir}" 
tar cvf "${artifact_dir}"/tl_dist.tar tlog.env.sample *.py
