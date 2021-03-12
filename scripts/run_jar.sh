#!/bin/bash

PROJECT=getting-started

echo "Run Application..."
pushd ../${PROJECT}
java -jar target/quarkus-app/quarkus-run.jar
