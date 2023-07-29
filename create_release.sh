#! /bin/bash

dart compile exe bin/main.dart

mkdir -p release 

mv bin/main.exe release/

mv release/main.exe release/analyze

VERSION=$RANDOM

mv release/analyze release/analyze_$VERSION
cp release/analyze_$VERSION release/analyze_lastest

sudo chmod +x release/*
