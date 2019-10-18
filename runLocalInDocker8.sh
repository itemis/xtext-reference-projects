#!/bin/bash

export HOME=/workspace/xtext
export WORKSPACE=/workspace/xtext
export MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"

#xvfb-run $WORKSPACE/scripts/integrationtests-wizard.sh
xvfb-run $WORKSPACE/scripts/integrationtests-xtend-examples.sh
xvfb-run $WORKSPACE/scripts/integrationtests-xtext-examples.sh

xvfb-run $WORKSPACE/scripts/greetings-gradle-2.12.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.14.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.15.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.16.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17.M1.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20.sh

xvfb-run $WORKSPACE/scripts/greetings-maven-2.12.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.13.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.14.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.15.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.16.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.17.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-maven-2.20.sh

xvfb-run $WORKSPACE/scripts/greetings-tycho-2.14.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.15.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
TP=luna-linux xvfb-run $WORKSPACE/scripts/greetings-tycho-2.14.sh
TP=mars-linux xvfb-run $WORKSPACE/scripts/greetings-tycho-2.14.sh
TP=oxygen xvfb-run $WORKSPACE/scripts/greetings-tycho-2.14.sh
TP=oxygen xvfb-run $WORKSPACE/scripts/greetings-tycho-2.15.sh
TP=oxygen xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
TP=photon xvfb-run $WORKSPACE/scripts/greetings-tycho-2.14.sh
TP=photon xvfb-run $WORKSPACE/scripts/greetings-tycho-2.15.sh
TP=photon xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
TP=latest xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
TP=latest xvfb-run $WORKSPACE/scripts/greetings-tycho-2.17.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.18.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.19.sh
xvfb-run $WORKSPACE/scripts/greetings-tycho-2.20.sh

xvfb-run $WORKSPACE/scripts/domainmodel-2.15.sh
xvfb-run $WORKSPACE/scripts/domainmodel-2.16.sh
xvfb-run $WORKSPACE/scripts/domainmodel-2.17.sh
xvfb-run $WORKSPACE/scripts/domainmodel-2.18.sh
xvfb-run $WORKSPACE/scripts/domainmodel-2.19.sh
xvfb-run $WORKSPACE/scripts/domainmodel-2.20.sh
