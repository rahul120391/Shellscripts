#!/bin/bash
APP_PATH="/Users/rahulkumar/Documents/AndroidStudioProj/Test2"
MODEL_MODULE_PATH="/Users/rahulkumar/Documents/AndroidStudioProj/Models"
NETWORK_MODULE_PATH="/Users/rahulkumar/Documents/AndroidStudioProj/Network"
APP_LIB_PATH="/app/libs/"
RELEASE_FILE_NAME="model-release.aar"
MODEL_JAR_FILE="model.jar"
NETWORK_JAR_FILE="network.jar"
OUTPUT_PATH="/app/build/outputs/aar/app-release.aar"
JAR_PATH="/app/build/intermediates/packaged-classes/release/classes.jar"
AAR_FILE_PATH="/app/build/outputs/aar/model-release.aar"
MODEL_JAR_FILE_NAME="/app/build/intermediates/packaged-classes/release/model.jar"
NETWORK_JAR_FILE_NAME="/app/build/intermediates/packaged-classes/release/network.jar"


rm $APP_PATH$APP_LIB_PATH$MODEL_JAR_FILE
rm $APP_PATH$APP_LIB_PATH$NETWORK_JAR_FILE

echo "start executing"
cd $MODEL_MODULE_PATH
./gradlew clean --daemon
./gradlew aR --daemon
rm $MODEL_MODULE_PATH$OUTPUT_PATH
cp $MODEL_MODULE_PATH$JAR_PATH $MODEL_MODULE_PATH$MODEL_JAR_FILE_NAME
rm $MODEL_MODULE_PATH$JAR_PATH


cd $NETWORK_MODULE_PATH
./gradlew clean --daemon
./gradlew aR --daemon
rm $NETWORK_MODULE_PATH$OUTPUT_PATH
cp $NETWORK_MODULE_PATH$JAR_PATH $NETWORK_MODULE_PATH$NETWORK_JAR_FILE_NAME
rm $NETWORK_MODULE_PATH$JAR_PATH
cp $MODEL_MODULE_PATH$MODEL_JAR_FILE_NAME $NETWORK_MODULE_PATH$APP_LIB_PATH
cp $NETWORK_MODULE_PATH$NETWORK_JAR_FILE_NAME $APP_PATH$APP_LIB_PATH
cp $MODEL_MODULE_PATH$MODEL_JAR_FILE_NAME $APP_PATH$APP_LIB_PATH
cd $APP_PATH
./gradlew clean --daemon
./gradlew build --daemon