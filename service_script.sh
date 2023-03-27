#!/bin/bash

APP_NAME=${PWD##*/}
APP_DIR=$2

if [ "$1" == "deploy" ]
then
    echo "Deploying $APP_NAME to $APP_DIR"
    echo "Application deployed to $APP_DIR"
    cd "$APP_DIR"
    dotnet run &
    echo "Application started"
elif [ "$1" == "undeploy" ]
then
    echo "Stopping $APP_NAME"
    pkill -f "dotnet run"
    echo "Application stopped"
else
    echo "Unknown command: $1"
    exit 1
fi

