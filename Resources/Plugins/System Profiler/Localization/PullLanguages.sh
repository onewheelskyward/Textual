#!/bin/sh

set -e

pushd "$(dirname "$0")" &>/dev/null

for lang in ??.lproj; do
	test $lang == "en.lproj" && continue
	for XIB in en.lproj/*.xib; do
		XIB="$(basename "$XIB")"
		ibtool 	--import-strings-file "${lang}/${XIB%.xib}.strings" \
			--write "${lang}/${XIB}" \
			"en.lproj/${XIB}"
	done
done

popd &>/dev/null
