#!/bin/bash

PROJECT=getting-started

echo "Packaging..."
pushd ../${PROJECT}
./mvnw package
popd