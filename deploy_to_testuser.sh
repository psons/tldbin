app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)

cd ${app_home}/testuser/bin
pwd
tar xvf ../../art/tl2_dist.tar
