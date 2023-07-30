#! /bin/bash

VERSION=$(cat VERSION)

echo "const String VERSION = '$VERSION';" > lib/version.dart

FOLDER_RELEASE="release"
dart compile exe bin/main.dart

rm -rf $FOLDER_RELEASE

mkdir -p $FOLDER_RELEASE 

mv bin/main.exe $FOLDER_RELEASE/

mv $FOLDER_RELEASE/main.exe $FOLDER_RELEASE/analyze

NUMBER=$RANDOM

mv $FOLDER_RELEASE/analyze $FOLDER_RELEASE/analyzer_$NUMBER
cp $FOLDER_RELEASE/analyzer_$NUMBER $FOLDER_RELEASE/analyzer_lastest

git add $FOLDER_RELEASE/* && git commit -m "realese: $VERSION=> $NUMBER"   

sudo chmod +x $FOLDER_RELEASE/*
