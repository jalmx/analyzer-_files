#! /bin/bash

FOLDER_RELEASE="release"
dart compile exe bin/main.dart

rm -rf $FOLDER_RELEASE

mkdir -p $FOLDER_RELEASE 

mv bin/main.exe $FOLDER_RELEASE/

mv $FOLDER_RELEASE/main.exe $FOLDER_RELEASE/analyze

VERSION=$RANDOM

mv $FOLDER_RELEASE/analyze $FOLDER_RELEASE/analyzer_$VERSION
cp $FOLDER_RELEASE/analyzer_$VERSION $FOLDER_RELEASE/analyzer_lastest

git add $FOLDER_RELEASE/* && git commit -m "realese: v0.0.2=> $VERSION"   

sudo chmod +x $FOLDER_RELEASE/*
