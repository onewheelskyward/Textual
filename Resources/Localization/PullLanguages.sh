#!/bin/sh

set -e

pushd "$(dirname "$0")" &>/dev/null

tx pull -a

for lang in ??.lproj; do
	for XIB in English.lproj/*.xib; do
		XIB="$(basename "$XIB")"
		ibtool 	--import-strings-file "${lang}/${XIB%.xib}.strings" \
			--write "${lang}/${XIB}" \
			"English.lproj/${XIB}"
	done
done

"../Plugins/Smiley Converter/Localization/PullLanguages.sh"
"../Plugins/System Profiler/Localization/PullLanguages.sh"
"../Plugins/Wikipedia Links/Localization/PullLanguages.sh"
popd &>/dev/null
