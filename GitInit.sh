#!/bin/bash
URL="https://github.com/rahul1291/GitTest.git"
PROJECT_PATH="/Users/rahulkumar/Documents/AndroidStudioProj/Test2"
cd $PROJECT_PATH
git init
git remote add origin $URL
git add .
git commit -m "first commit"
git push origin master
