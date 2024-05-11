#!/bin/bash

# COPY the new jar to the build location
cp -f java-app/target/*.jar jenkins/build

echo "************************"
echo "BUILD DOCKER IMAGE"
echo "************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache




