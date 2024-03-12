#!/bin/bash

echo
echo "           ___            _ _     _        _____   ___           "
echo "          / _ \          (_) |   | |      /  __ \ / _ \          "
echo "         / /_\ \_ __  ___ _| |__ | | ___  | /  \// /_\ \         "
echo "         |  _  | '_ \/ __| | '_ \| |/ _ \ | |    |  _  |         "
echo "         | | | | | | \__ \ | |_) | |  __/ | \__/\| | | |         "
echo "         \_| |_/_| |_|___/_|_.__/|_|\___|  \____/\_| |_/         "
echo
echo

die() {
    echo "$@"
    exit 1
}

ca="${CA:-Ansible CA}"

which python3 >/dev/null || die "Missing python3"

echo "Setting up \"${ca}\"..."

python3 -m venv --prompt "${ca}" .venv
source .venv/bin/activate
pip install -U pip
pip install -r scripts/requirements.txt
