#!/bin/bash

NAME="TapadooUserFlows.sketchplugin"
VERSION=`date +%Y-%m-%d`

# remove the archive if it exists
if [ -z $VERSION-$NAME.tgz ]; then
    rm $VERSION-$NAME.tgz
fi

# copy the plugin to a directory with a new name
cp -r UserFlows.sketchplugin $NAME

# do token replacement
sed -i 's|^  "identifier".*|  "identifier": "com.abynim.sketchplugins.userflows-tapadoo",|' $NAME/Contents/Sketch/manifest.json
sed -i 's|^  "name".*|  "name": "User Flows Tapadoo",|' $NAME/Contents/Sketch/manifest.json
sed -i "s|^  \"version\".*|  \"version\": \"$VERSION\",|" $NAME/Contents/Sketch/manifest.json

# create the new archive
tar czf $VERSION-$NAME.tgz $NAME

# delete the temporary directory
if [ -d $NAME ]; then
    echo "rm -r $NAME"
    rm -r $NAME
fi
