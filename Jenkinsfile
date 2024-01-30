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
  stage("Quality Gate"){
    timeout(time: 2, unit: 'MINUTES') 
    {
      waitForQualityGate abortPipeline: true, credentialsId: 'sonarQube1'
      // def qg= waitForQualityGate()
      // if (qg.status!= 'OK'){
      //   error "Pipeline aborted due to quality gate failure: ${qg.status}"
      // }
    }         
    echo 'Quality Gate Passed' 
  }
  // stage('Wait For report'){
  //   waitForQualityGate abortPipeline: false, credentialsId: 'sonarQube1'
  // }
  stage('Deploy') {
    sh 'docker-compose build'
    sh 'docker-compose up'
  }
}
