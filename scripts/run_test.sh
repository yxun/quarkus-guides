#!/bin/bash

PROJECT=getting-started

echo "Testing..."
pushd ../${PROJECT}
./mvnw test
popd
