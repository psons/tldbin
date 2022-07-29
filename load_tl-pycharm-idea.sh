set -x
base_dev_dir=$(cd $(dirname $0)/..; pwd)
cd "${base_dev_dir}" && git clone "http://github.com/psons/tl-pycharm-idea.git" && mv tl-pycharm-idea .idea
