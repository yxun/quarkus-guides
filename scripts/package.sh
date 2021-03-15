#!/bin/bash

PROJECT=getting-started

function package() {
    echo "Packaging..."
    pushd ../${PROJECT}
    ./mvnw package
    popd
}

function package_native() {
    echo "Packaging..."
    pushd ../${PROJECT}
    ./mvnw package -Pnative
    # ./target/${PROJECT}-1.0.0-SNAPSHOT-runner
    ./mvnw verify -Pnative
    popd
}

function package_container() {
    echo "Packaging..."
    pushd ../${PROJECT}
    ./mvnw package -Pnative \
    -Dquarkus.native.container-build=true \
    -Dquarkus.container-image.build=true
    # application.properties
    # Dquarkus.native.container-runtime=docker or podman
    popd

    # manually build docker image
    # edit .dockerignore and remove or comment its content
    # docker build -f src/main/docker/Dockerfile.native -t quarkus-quickstart/getting-started .
    # docker run -i --rm -p 8080:8080 quarkus-quickstart/getting-started

}
