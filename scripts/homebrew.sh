#!/bin/bash

brew update && brew upgrade

echo "Install openjdk 11"
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk11

echo "Add JAVA_HOME"
java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' 
export JAVA_HOME=$(/usr/libexec/java_home)
java -version

echo "Install maven"
pushd /usr/local/opt
ln -s ../Caskroom/adoptopenjdk11/* openjdk
brew install --ignore-dependencies maven
popd

mvn -v
