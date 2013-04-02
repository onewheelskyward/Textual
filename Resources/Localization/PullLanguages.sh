#!/bin/sh

set -ex

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

popd &>/dev/null
