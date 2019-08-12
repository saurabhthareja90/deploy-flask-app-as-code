pipeline {
  agent {
    docker {
      image 'jenkinsci/blueocean'
    }

  }
  stages {
    stage('checkout') {
      steps {
        echo 'git checkout'
      }
    }
    stage('finish') {
      steps {
        node(label: 'slave') {
          echo 'running on slave'
        }

      }
    }
  }
}