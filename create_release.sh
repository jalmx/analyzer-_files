#! /bin/bash

dart compile exe bin/main.dart

mkdir -p release 

mv bin/main.exe release/

mv release/main.exe release/analyze

VERSION=$RANDOM

mv release/analyze release/analyzer_$VERSION
cp release/analyzer_$VERSION release/analyzer_lastest

sudo chmod +x release/*
