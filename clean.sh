#!/bin/sh
export EC2_INI_PATH=inventory/ec2_priv.ini

# read input parameters
vflag=""
while [ $# -gt 0 ]
do
  case "$1" in
    -v) vflag="-vvvv";;
    -e) env="$2"; shift;;
    -h)
        echo >&2 "usage: $0 -e environment [-v]"
        exit 1;;
     *) break;; # terminate while loop
  esac
  shift
done

ansible-playbook --extra-vars "environ=$env" clean.yaml $vflag
