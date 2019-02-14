#!/bin/bash
PROJECT_PATH="/Users/rahulkumar/Documents/AndroidStudioProj/Test2"
cd $PROJECT_PATH
./gradlew clean --daemon
./gradlew build --daemon
