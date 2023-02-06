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
        stage('uploadartficat'){
            steps{
                nexusArtifactUploader {
                nexusVersion("nexus2")
                protocol("http")
                nexusUrl("13.126.87.95:8081/nexus")
                groupId("QA")
                version("$BUILD_ID")
                repository("vprofile")
                credentialsId("27adc3cf-87da-42ac-a392-59469769144e")
                artifact {
                   artifactId("vprofile-id")
                   type("war")
                    file("**/*.war")
                  }
               }
           }
        }
    }
}