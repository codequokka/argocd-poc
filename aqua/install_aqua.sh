#!/bin/bash

aqua_version='v2.42.2'
aqua_installer_url='https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.0.1/aqua-installer'
aqua_path="${HOME}/.local/share/aquaproj-aqua/bin/aqua"

if [[ ! -f $aqua_path ]]; then
  echo 'Installing aqua...'
  curl -sSfL $aqua_installer_url | bash -s -- -v $aqua_version
fi

echo 'Installing required commands...'
$aqua_path install
