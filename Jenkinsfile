pipeline {
  agent none

  options {
    buildDiscarder(logRotator(numToKeepStr:'15'))
    disableConcurrentBuilds()
    timeout(time: 360, unit: 'MINUTES')
    timestamps()
  }

  environment {
    SCRIPTS="$WORKSPACE/scripts"
  }

  stages {
    stage('JDK 8: Integrationtests') {
      agent {
        docker {
          image 'openjdk:8'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/integrations.sh
        """
      }
    }

    stage('JDK 8: greetings-gradle') {
      agent {
        docker {
          image 'openjdk:8'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-gradle-2.12.sh
          $SCRIPTS/greetings-gradle-2.14.sh
          $SCRIPTS/greetings-gradle-2.15.sh
          $SCRIPTS/greetings-gradle-2.16.sh
          $SCRIPTS/greetings-gradle-2.17.M1.sh
          $SCRIPTS/greetings-gradle-2.17.sh
          $SCRIPTS/greetings-gradle-2.18.sh
          $SCRIPTS/greetings-gradle-2.19.sh
          $SCRIPTS/greetings-gradle-2.20.sh
        """
      }
    }

    stage('JDK 8: greetings-maven') {
      agent {
        docker {
          image 'openjdk:8'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-maven-2.12.sh
          $SCRIPTS/greetings-maven-2.13.sh
          $SCRIPTS/greetings-maven-2.14.sh
          $SCRIPTS/greetings-maven-2.15.sh
          $SCRIPTS/greetings-maven-2.16.sh
          $SCRIPTS/greetings-maven-2.17.sh
          $SCRIPTS/greetings-maven-2.18.sh
          $SCRIPTS/greetings-maven-2.19.sh
          $SCRIPTS/greetings-maven-2.20.sh
        """
      }
    }

    stage('JDK 8: greetings-tycho') {
      agent {
        docker {
          image 'openjdk:8'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-tycho-2.14.sh
          $SCRIPTS/greetings-tycho-2.15.sh
          $SCRIPTS/greetings-tycho-2.16.sh
          TP=luna-linux $SCRIPTS/greetings-tycho-2.14.sh
          TP=mars-linux $SCRIPTS/greetings-tycho-2.14.sh
          TP=oxygen $SCRIPTS/greetings-tycho-2.14.sh
          TP=oxygen $SCRIPTS/greetings-tycho-2.15.sh
          TP=oxygen $SCRIPTS/greetings-tycho-2.16.sh
          TP=photon $SCRIPTS/greetings-tycho-2.14.sh
          TP=photon $SCRIPTS/greetings-tycho-2.15.sh
          TP=photon $SCRIPTS/greetings-tycho-2.16.sh
          TP=latest $SCRIPTS/greetings-tycho-2.16.sh
          TP=latest $SCRIPTS/greetings-tycho-2.17.sh
          $SCRIPTS/greetings-tycho-2.18.sh
          $SCRIPTS/greetings-tycho-2.19.sh
          $SCRIPTS/greetings-tycho-2.20.sh
        """
      }
    }

    stage('JDK 8: domainmodel') {
      agent {
        docker {
          image 'openjdk:8'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/domainmodel-2.15.sh
          $SCRIPTS/domainmodel-2.16.sh
          $SCRIPTS/domainmodel-2.17.sh
          $SCRIPTS/domainmodel-2.18.sh
          $SCRIPTS/domainmodel-2.19.sh
          $SCRIPTS/domainmodel-2.20.sh
        """
      }
    }

    stage('JDK 11: greetings-gradle') {
      agent {
        docker {
          image 'openjdk:11'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-gradle-2.16.sh
          $SCRIPTS/greetings-gradle-2.17-J11.sh
          $SCRIPTS/greetings-gradle-2.18.sh
          $SCRIPTS/greetings-gradle-2.18-J11.sh
          $SCRIPTS/greetings-gradle-2.19.sh
          $SCRIPTS/greetings-gradle-2.19-J11.sh
          $SCRIPTS/greetings-gradle-2.20.sh
          $SCRIPTS/greetings-gradle-2.20-J11.sh
        """
      }
    }

    stage('JDK 11: greetings-maven') {
      agent {
        docker {
          image 'openjdk:11'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-maven-2.16.sh
          $SCRIPTS/greetings-maven-2.17-J11.sh
          $SCRIPTS/greetings-maven-2.18.sh
          $SCRIPTS/greetings-maven-2.18-J11.sh
          $SCRIPTS/greetings-maven-2.19.sh
          $SCRIPTS/greetings-maven-2.19-J11.sh
          $SCRIPTS/greetings-maven-2.20.sh
          $SCRIPTS/greetings-maven-2.20-J11.sh
        """
      }
    }

    stage('JDK 11: greetings-tycho') {
      agent {
        docker {
          image 'openjdk:11'
          label 'external'
        }
      }
      steps {
        sh """
          $SCRIPTS/greetings-tycho-2.16.sh
          $SCRIPTS/greetings-tycho-2.17-J11.sh
          $SCRIPTS/greetings-tycho-2.18.sh
          $SCRIPTS/greetings-tycho-2.18-J11.sh
          $SCRIPTS/greetings-tycho-2.19.sh
          $SCRIPTS/greetings-tycho-2.19-J11.sh
          $SCRIPTS/greetings-tycho-2.20.sh
          $SCRIPTS/greetings-tycho-2.20-J11.sh
        """
      }
    }
  }

//   post {
//     always {
//       junit testResults: '**/build/test-results/test/*.xml'
//     }
//     success {
//       archiveArtifacts artifacts: 'build/**'
//       script {
//         if (params.TRIGGER_DOWNSTREAM_BUILD==true) {
//           DOWNSTREAM_JOBS.split(',').each {
//             def downstreamUrl = new URL("${env.JENKINS_URL}/job/$it/job/${env.BRANCH_NAME}")
//             def boolean downstreamJobExists = sh(script: "curl -L -s -o /dev/null -I -w '%{http_code}' ${downstreamUrl}", returnStdout: true) == "200"
//             if (downstreamJobExists) {
//               build job: "$it/${env.BRANCH_NAME}", wait: false, parameters: [booleanParam(name: 'TRIGGER_DOWNSTREAM_BUILD', value: "${params.TRIGGER_DOWNSTREAM_BUILD}")]
//             }
//           }
//         }
//       }
//     }
//     cleanup {
//       script {
//         def curResult = currentBuild.currentResult
//         def lastResult = 'NEW'
//         if (currentBuild.previousBuild != null) {
//           lastResult = currentBuild.previousBuild.result
//         }

//         if (curResult != 'SUCCESS' || lastResult != 'SUCCESS') {
//           def color = ''
//           switch (curResult) {
//             case 'SUCCESS':
//               color = '#00FF00'
//               break
//             case 'UNSTABLE':
//               color = '#FFFF00'
//               break
//             case 'FAILURE':
//               color = '#FF0000'
//               break
//             default: // e.g. ABORTED
//               color = '#666666'
//           }

//           slackSend (
//             message: "${lastResult} => ${curResult}: <${env.BUILD_URL}|${env.JOB_NAME}#${env.BUILD_NUMBER}>",
//             botUser: true,
//             channel: 'xtext-builds',
//             color: "${color}"
//           )
//         }
//       }
//     }
//   }
}
