#!/bin/bash

PROJECT=getting-started

echo "Building..."
pushd ../${PROJECT}
./mvnw compile quarkus:dev
popd
