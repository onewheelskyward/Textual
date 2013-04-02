#!/bin/sh

pushd "$(dirname "$0")/en.lproj" &>/dev/null
for XIB in *.xib; do
	ibtool --generate-strings-file "${XIB%.xib}.strings" "${XIB}"
done
popd &>/dev/null
