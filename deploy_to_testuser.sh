app_home=$(cd $(dirname $0)/..;pwd)
echo In: $(basename $0)

testuser_bin="${app_home}/testuser/bin"
artifact_dir="${app_home}/art"

mkdir -p "${testuser_bin}" && cd "${testuser_bin}" && pwd && tar xvf "${artifact_dir}/tl_dist.tar"
