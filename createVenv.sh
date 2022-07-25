#!/bin/sh
# Establish the python virtual env needed to develop and run tlog.
# this is a portion of what will eventually become a CICD pipeline
# loosely based on https://realpython.com/python-continuous-integration/
# This script could be rewritten in Python to eliminate need 
# for a unix shjll. 

bail ()  {
	exit_code=$1
	shift 
	echo "$@" 1>&2
	exit $exit_code
}

prog=$(basename $0)
usage="
        usage: $prog venv_parent_dir
"
#echo in $prog
[ -n "$1" ] || bail 1 "No venv_parent_dir
${usage}"
venv_parent_dir="${1}"

base_dev_dir=$(cd $(dirname $0)/..; pwd)
pip_requirements_path="${base_dev_dir}/tlog/docs/requirements.txt"


venv_dir_name=$(python3 --version | sed -e 's/ /_/g' | sed -e 's/Python/pyvenv/') || bail 2 "verify that python3 is installed and in the PATH"

mkdir -p "$venv_parent_dir" || bail 2 "can not mkdir venv_parent_dir (${venv_parent_dir})"
cd "$venv_parent_dir" || bail 3 "can not cd to venv_parent_dir  (${venv_parent_dir})"
echo "venv will be created below ${venv_parent_dir} :" $(pwd) 


python3 -m venv "${venv_dir_name}" || bail 4 "venv cration failed for ${venv_parent_dir}"

. "${venv_dir_name}/bin/activate"

set -x


# pip install GitPython
# pip install PyMongo
# pip freeze | tee "${pip_requirements_path}"

[ -f "${pip_requirements_path}" ] || bail 6 "
        the tlog source is not present including ${pip_requirements_path}
        so python dependencies are not loaded.

        Please correct and run:
            pip install -r "${pip_requirements_path}"
        "
        
pip install -r "${pip_requirements_path}"

# future enhancement to manage setup.py and setup.cfg according to:
# https://towardsdatascience.com/requirements-vs-setuptools-python-ae3ee66e28af

