#!/bin/bash
cd "$(dirname "$(realpath "$0")")"
sudo bash -c 'cat apt-packages.txt | xargs apt install -y'
