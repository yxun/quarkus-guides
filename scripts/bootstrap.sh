#!/bin/bash

function prerequisites() {
    java --version  || exit 1
    echo $JAVA_HOME || exit 1
    mvn --version   || exit 1
}

function bootstrap() {
    pushd ../
    VERSION=1.12.2.Final
    ARTIFACT=getting-started
    CLASS="org.acme.getting.started.GreetingResource"
    # Do not use PATH variable. It conflicts with existing PATH.
    DPATH="/hello"

    mvn io.quarkus:quarkus-maven-plugin:${VERSION}:create \
        -DprojectGroupId=org.acme \
        -DprojectArtifactId=${ARTIFACT} \
        -DclassName=${CLASS} \
        -Dpath=${DPATH}

    popd
}

function main() {
    prerequisites
    bootstrap
}

main