#!/bin/sh

pushd "$(dirname "$0")/English.lproj" &>/dev/null
for XIB in *.xib; do
	ibtool --generate-strings-file "${XIB%.xib}.strings" "${XIB}"
done


pushd .. &>/dev/null
../Plugins/Smiley\ Converter/Localization/GenerateXibStrings.sh
../Plugins/System\ Profiler/Localization/GenerateXibStrings.sh
../Plugins/Wikipedia\ Links/Localization/GenerateXibStrings.sh
popd &>/dev/null

tx push -s
popd &>/dev/null

