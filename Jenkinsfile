pipeline {
  agent any
  stages {
    stage('Stage 1') {
      parallel {
        stage('Stage 1a') {
          steps {
            bat(script: 'set', encoding: 'UTF-8', label: 'set', returnStatus: true, returnStdout: true)
          }
        }
        stage('Stage 1b') {
          steps {
            bat(script: 'cd', encoding: 'UTF-8', label: 'cd', returnStatus: true, returnStdout: true)
          }
        }
      }
    }
    stage('Stage 2') {
      steps {
        bat(script: 'bootstrap_cmake.bat', encoding: 'UTF-8', label: 'bootstrap_cmake', returnStatus: true, returnStdout: true)
      }
    }
  }
}