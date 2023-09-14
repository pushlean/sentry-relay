#!/bin/env bash

version="$1"
if [ -z "$version" ]; then
	echo "Version argument required" >&2
	exit 1
fi

bin_name="relay-Linux-x86_64"
download_url="https://github.com/getsentry/relay/releases/download/${version}/${bin_name}"
wget "$download_url"

chmod 555 $bin_name
tar -czvf "relay_${version}.tar.gz" "$bin_name"
/bin/rm $bin_name 
git add .
git commit -m "Mirror version ${version}"
git push
