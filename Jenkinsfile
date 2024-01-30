node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonarScanner';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
  stage('Wait For report'){
    waitForQualityGate abortPipeline: false, credentialsId: 'sonarQube1'
  }
  stage('Deploy') {
    sh 'docker-compose build'
    sh 'docker-compose up'
  }
}
