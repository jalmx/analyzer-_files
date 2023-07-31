#! /bin/bash

VERSION=$(cat VERSION)
NUMBER=$RANDOM

echo "const String VERSION = '$VERSION => $RANDOM';" > lib/version.dart

FOLDER_RELEASE="release"
dart compile exe bin/main.dart

rm -rf $FOLDER_RELEASE

mkdir -p $FOLDER_RELEASE 

mv bin/main.exe $FOLDER_RELEASE/

mv $FOLDER_RELEASE/main.exe $FOLDER_RELEASE/analyzer

mv $FOLDER_RELEASE/analyzer $FOLDER_RELEASE/analyzer_$NUMBER
cp $FOLDER_RELEASE/analyzer_$NUMBER $FOLDER_RELEASE/analyzer_lastest

git add $FOLDER_RELEASE/* && git commit -m "realese: $VERSION=> $NUMBER"   

echo "copy file $FOLDER_RELEASE/analyzer_lastest to $HOME/.local/bin/analyzer"
echo "and make executable => sudo chmod +x $HOME/.local/bin/analyzer"
