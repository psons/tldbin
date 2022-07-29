
app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)

"${app_home}/tldbin/make_dist.sh"
"${app_home}/tldbin/deploy_to_testuser.sh"

