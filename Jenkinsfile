pipeline {
  agent none

  options {
    buildDiscarder(logRotator(numToKeepStr:'15'))
    disableConcurrentBuilds()
    timeout(time: 360, unit: 'MINUTES')
    timestamps()
  }

  stages {
    stage('JDK 8: Integrationtests') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=8'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
          #xvfb-run $WORKSPACE/scripts/integrationtests-wizard.sh
          xvfb-run $WORKSPACE/scripts/integrationtests-xtend-examples.sh
          xvfb-run $WORKSPACE/scripts/integrationtests-xtext-examples.sh
        """
      }
    }

    stage('JDK 8: greetings-gradle') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=8'
          label 'external'
        }
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.12.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.14.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.15.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.16.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17.M1.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20.sh
        """
      }
    }

    stage('JDK 8: greetings-maven') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=8'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Xmx2G -Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.12.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.13.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.14.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.15.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.16.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.17.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.18.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.19.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.20.sh
        """
      }
    }

    stage('JDK 8: greetings-tycho') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=8'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
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
        """
      }
    }

    stage('JDK 8: domainmodel') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=8'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/domainmodel-2.15.sh
          xvfb-run $WORKSPACE/scripts/domainmodel-2.16.sh
          xvfb-run $WORKSPACE/scripts/domainmodel-2.17.sh
          xvfb-run $WORKSPACE/scripts/domainmodel-2.18.sh
          xvfb-run $WORKSPACE/scripts/domainmodel-2.19.sh
          xvfb-run $WORKSPACE/scripts/domainmodel-2.20.sh
        """
      }
    }

    stage('JDK 11: greetings-gradle') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=11'
          label 'external'
        }
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.16.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.17-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.18-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.19-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20.sh
          xvfb-run $WORKSPACE/scripts/greetings-gradle-2.20-J11.sh
        """
      }
    }

    stage('JDK 11: greetings-maven') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=11'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.16.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.17-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.18.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.18-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.19.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.19-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.20.sh
          xvfb-run $WORKSPACE/scripts/greetings-maven-2.20-J11.sh
        """
      }
    }

    stage('JDK 11: greetings-tycho') {
      agent {
        dockerfile {
          additionalBuildArgs  '--build-arg JDKVERSION=11'
          label 'external'
        }
      }
      environment {
        MAVEN_OPTS="-Dmaven.repo.local=$WORKSPACE/.m2/repository"
      }
      steps {
        sh """
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.16.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.17-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.18.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.18-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.19.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.19-J11.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.20.sh
          xvfb-run $WORKSPACE/scripts/greetings-tycho-2.20-J11.sh
        """
      }
    }
  }

  post {
    cleanup {
      script {
        def curResult = currentBuild.currentResult
        def lastResult = 'NEW'
        if (currentBuild.previousBuild != null) {
          lastResult = currentBuild.previousBuild.result
        }

        if (curResult != 'SUCCESS' || lastResult != 'SUCCESS') {
          def color = ''
          switch (curResult) {
            case 'SUCCESS':
              color = '#00FF00'
              break
            case 'UNSTABLE':
              color = '#FFFF00'
              break
            case 'FAILURE':
              color = '#FF0000'
              break
            default: // e.g. ABORTED
              color = '#666666'
          }

          slackSend (
            message: "${lastResult} => ${curResult}: <${env.BUILD_URL}|${env.JOB_NAME}#${env.BUILD_NUMBER}>",
            botUser: true,
            channel: 'xtext-builds',
            color: "${color}"
          )
        }
      }
    }
  }
}
