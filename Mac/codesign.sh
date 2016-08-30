#!/bin/bash

set -e

if [ $# -ne 2 ]; then
	echo Usage: $0 /path/to/Swenglish.dmg \"Name of Cert\"
	exit 1
fi

SIGNED=$(echo $1 | sed 's/Swenglish.dmg/SwenglishSigned.dmg/')
SHADOW=$1.shadow

if [ -f $SIGNED ]; then
	echo Output file SwenglishSigned.dmg already exists!
	exit 2
fi

hdiutil attach -owners on $1 -shadow
codesign -s "$2" /Volumes/Swenglish/Swenglish.bundle
hdiutil detach /Volumes/Swenglish
hdiutil convert $1 -format UDZO -o $SIGNED -shadow

if [ -f $SHADOW ]; then
	rm $SHADOW
fi

echo Done!
