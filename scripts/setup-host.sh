#!/bin/bash

tlshost=
debug=False

die_usage() {
    cat >&2 <<EOH
Setup TLS credentials on a specific host.  You will need sudo access...

Usage: ${0##*/} [options]
  -H    host to connect to and configure, required
  -D    print debug info
  -h    this help text

EOH
exit 1
}

while getopts ":DH:h" opt; do
  case $opt in
    D) debug=True ;;
    H) tlshost="$OPTARG" ;;
    h) die_usage ;;
    *) echo "ERR: that flag is not implemented..." && die_usage ;;
  esac
done

# Verify that the required values are present...
[ -z "${tlshost}" ] && echo "ERR: the target hostname is not specified." && die_usage

source .venv/bin/activate
ansible-playbook -K -e target="${tlshost}" -e debug="${debug}" playbooks/setup-host.yml