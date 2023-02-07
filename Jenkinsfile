pipeline {
    agent any
    tools {
	    maven "MAVEN3"
	}
    stages{
        stage('Fetch code') {
          steps{
              git branch: 'master', url:'https://github.com/naveen-e-devops/VProfile'
          }  
        }

        stage('Build') {
            steps {
                sh 'mvn -Dmaven.test.skip=true package'
            }
            post {
                success {
                    echo "Now Archiving."
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('Tst') {
            steps{
                sh 'mvn test'
            }
        }
        stage('uploadartficat'){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'vprofile-id', classifier: '', file: 'target/vprofile-v1.war', type: 'war']], credentialsId: '27adc3cf-87da-42ac-a392-59469769144e', groupId: 'QA', nexusUrl: '35.154.27.245:8081/nexus', nexusVersion: 'nexus2', protocol: 'http', repository: 'vprofile', version: '$BUILD_ID'
           }
        }
        stage('deploy') {
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcat-creds', path: '', url: 'http://172.31.44.32:8080/')], contextPath: 'feb6', war: 'target/vprofile-v1.war'
            }
        }
    }
}