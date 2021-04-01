peline {
    agent any
    tools {
        maven "maven"
    }
    stages{
        stage("scm"){
          steps{
              // clone source code from git
              git 'https://github.com/naveen-e-devops/VProfile.git'
          }  
        }
        
        stage("BUILD"){
            steps{
                // compine the source code
                
                sh label: '', script: 'mvn package'
            }
        }
        
        
       stage('sonarqube') {
         environment 
              {
              def scannerHome = tool 'sonarqube'
              }
       steps {
        withSonarQubeEnv('sonarqube') {
              sh "${scannerHome}/bin/sonar-scanner"
             }
       //timeout(time: 10, unit: 'MINUTES') {
       //waitForQualityGate abortPipeline: true
	  
      //}
       }
       }
       
       stage("nexus uploader"){
           steps{
               //uploading artifact into nexus repo
               nexusArtifactUploader artifacts: [[artifactId: 'vprofile', classifier: '', file: 'target/vprofile-v1.war', type: 'war']], credentialsId: 'nexuslogin', groupId: 'DEV', nexusUrl: '3.97.142.138:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'test-repo', version: '$BUILD_ID'
               
           }
           
       }
            
        
    }
}

