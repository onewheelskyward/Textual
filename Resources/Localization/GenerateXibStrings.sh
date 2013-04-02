#!/bin/sh

pushd "$(dirname "$0")/English.lproj" &>/dev/null
for XIB in *.xib; do
	ibtool --generate-strings-file "${XIB%.xib}.strings" "${XIB}"
done
popd &>/dev/null

"../Plugins/Smiley Converter/Localization/GenerateXibStrings.sh"
