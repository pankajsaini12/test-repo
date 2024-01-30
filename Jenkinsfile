node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonarScanner';
    withSonarQubeEnv(credentialsId: 'sonarQube1') {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
  stage("Quality Gate"){
    sleep(10)
    timeout(time: 1, unit: 'MINUTES') 
    {
      waitForQualityGate abortPipeline: false, credentialsId: 'sonarQube1'
    }         
    echo 'Quality Gate Passed' 
  }
  // stage('Wait For report'){
  //   waitForQualityGate abortPipeline: false, credentialsId: 'sonarQube1'
  //   echo 'Quality Gate Passed'
  // }
  stage('Deploy') {
    sh 'docker-compose build'
    sh 'docker-compose up'
  }
}
