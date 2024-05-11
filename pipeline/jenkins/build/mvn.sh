#!/bin/bash

echo "*****************************"
echo "BUILD"
echo "*****************************"

docker run --rm -ti -v $PWD/java-app:/app -v $PWD/data:/root/.m2/ -w /app maven "$@"

