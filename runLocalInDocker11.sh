#!/bin/bash

export HOME=/workspace/xtext
export WORKSPACE=/workspace/xtext
export MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"

xvfb-run $WORKSPACE/scripts/greetings-gradle-2.16.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20-J11.sh

xvfb-run $WORKSPACE/scripts/greetings-maven-2.16.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.17-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.18-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.19-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.20.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.20-J11.sh

xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.17-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.18-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.19-J11.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.20.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.20-J11.sh