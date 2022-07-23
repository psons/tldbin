# info
This is a repository  of scripts to build and use a developmet environment for 
tlog, which is a python goal planning, task manager, and journal keeping script.

# Main features

1. building the environment
2. managing test data
3. running tests.
4. creating a tar to distribute tlog, which is not yet availale as a public module.

For now, these scripts only rin in a unix style shell.

# to build the environment

First make sure git and python 3.9.5 are installed

1. create a parent directory named tldev.
2. cd into tldev
3. execute the following to clone this repo and build the environment:
	curl https://raw.githubusercontent.com/psons/tldbin/master/clonebuild_tld.sh | bash
	
