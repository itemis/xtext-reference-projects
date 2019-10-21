pipeline {
  agent none

  options {
    buildDiscarder(logRotator(numToKeepStr:'15'))
    disableConcurrentBuilds()
    timeout(time: 360, unit: 'MINUTES')
  }

  stages {
    stage('Xtext Reference Projects') {
      parallel {
        stage('JDK 8') {
          agent {
            kubernetes {
              label 'xtext-ref-jdk-8-' + env.BRANCH_NAME + '-' + env.BUILD_NUMBER
              defaultContainer 'xtext-maven-jdk-8'
              yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: 'eclipsecbi/jenkins-jnlp-agent'
    args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
    resources:
      limits:
        memory: "0.4Gi"
        cpu: "0.2"
      requests:
        memory: "0.4Gi"
        cpu: "0.2"
    volumeMounts:
    - mountPath: /home/jenkins/.ssh
      name: volume-known-hosts
  - name: xtext-maven-jdk-8
    image: docker.io/smoht/xtext-buildenv:0.7
    tty: true
    resources:
      limits:
        memory: "3.6Gi"
        cpu: "1.0"
      requests:
        memory: "3.6Gi"
        cpu: "1.0"
    volumeMounts:
    - name: settings-xml
      mountPath: /home/jenkins/.m2/settings.xml
      subPath: settings.xml
      readOnly: true
    - name: m2-repo
      mountPath: /home/jenkins/.m2/repository
    - name: volume-known-hosts
      mountPath: /home/jenkins/.ssh
  volumes:
  - name: volume-known-hosts
    configMap:
      name: known-hosts
  - name: settings-xml
    secret:
      secretName: m2-secret-dir
      items:
      - key: settings.xml
        path: settings.xml
  - name: m2-repo
    emptyDir: {}
        '''
            }
          }
          stages{
            stage('Integrationtests') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
              }
              steps {
                sh """
                  #xvfb-run $WORKSPACE/scripts/integrationtests-wizard.sh
                  xvfb-run $WORKSPACE/scripts/integrationtests-xtend-examples.sh
                  xvfb-run $WORKSPACE/scripts/integrationtests-xtext-examples.sh
                """
              }
            }

            stage('greetings-gradle') {
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

            stage('greetings-maven') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
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

            stage('greetings-tycho') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
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

            stage('domainmodel') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
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
          }
        }

        stage('JDK 11') {
          agent {
            kubernetes {
              label 'xtext-ref-jdk-11-' + env.BRANCH_NAME + '-' + env.BUILD_NUMBER
              defaultContainer 'xtext-maven-jdk-11'
              yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: 'eclipsecbi/jenkins-jnlp-agent'
    args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
    resources:
      limits:
        memory: "0.4Gi"
        cpu: "0.2"
      requests:
        memory: "0.4Gi"
        cpu: "0.2"
    volumeMounts:
    - mountPath: /home/jenkins/.ssh
      name: volume-known-hosts
  - name: xtext-maven-jdk-11
    image: docker.io/smoht/xtext-buildenv:0.7
    tty: true
    resources:
      limits:
        memory: "3.6Gi"
        cpu: "1.0"
      requests:
        memory: "3.6Gi"
        cpu: "1.0"
    volumeMounts:
    - name: settings-xml
      mountPath: /home/jenkins/.m2/settings.xml
      subPath: settings.xml
      readOnly: true
    - name: m2-repo
      mountPath: /home/jenkins/.m2/repository
    - name: volume-known-hosts
      mountPath: /home/jenkins/.ssh
  volumes:
  - name: volume-known-hosts
    configMap:
      name: known-hosts
  - name: settings-xml
    secret:
      secretName: m2-secret-dir
      items:
      - key: settings.xml
        path: settings.xml
  - name: m2-repo
    emptyDir: {}
        '''
            }
          }
          stages {
            stage('greetings-gradle') {
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

            stage('greetings-maven') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
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

            stage('greetings-tycho') {
              environment {
                MAVEN_OPTS="-Xmx3500M -Dmaven.repo.local=$WORKSPACE/.m2/repository"
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
        }
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
