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

function bootstrap_reactive() {
    pushd ../
    VERSION=1.12.2.Final
    ARTIFACT=getting-started-reactive
    CLASS="org.acme.getting.started.ReactiveGreetingResource"
    DPATH="/hello"
    EXTENSION="resteasy-reactive"

    mvn io.quarkus:quarkus-maven-plugin:${VERSION}:create \
        -DprojectGroupId=org.acme \
        -DprojectArtifactId=${ARTIFACT} \
        -DclassName=${CLASS} \
        -Dpath=${DPATH} \
        -Dextensions=${EXTENSION}
    
    popd

}

function bootstrap_reactive_crud() {
    pushd ../
    VERSION=1.12.2.Final
    ARTIFACT=getting-started-reactive-crud
    CLASS="org.acme.reactive.crud.FruitResource"
    DPATH="/fruits"
    EXTENSION="resteasy-reactive,resteasy-reactive-jackson,reactive-pg-client"

    mvn io.quarkus:quarkus-maven-plugin:${VERSION}:create \
        -DprojectGroupId=org.acme \
        -DprojectArtifactId=${ARTIFACT} \
        -DclassName=${CLASS} \
        -Dpath=${DPATH} \
        -Dextensions=${EXTENSION}
    
    popd
}

function main() {
    prerequisites
    bootstrap
}

main