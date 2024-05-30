pipeline {
    agent any 
        tools {
        maven "maven-3"
        jdk "java8"
    }

    stages{
        stage('Build'){
            steps{
                // this stage is to build the code 
                echo "compile the source code"
                sh 'mvn package'
            }
        }
        stage('artifact uploader'){
            steps{
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: '172.31.40.179:8081',
                groupId: 'visualpath',
                version: 'v1',
                repository: 'vprofile-repo',
                credentialsId: 'nexus-creds',
                artifacts: [
                  [artifactId: 'vprofileid',
                  classifier: '',
                  file: 'target/vprofile-v1.war',
                  type: 'war']
                 ]
               )
            }
        }
        stage('Test'){
            steps{
                echo "Running test cases"
            }
        }
        stage('Deploy'){
            steps{
                echo "deploying artifact into tomcat"
            }
        }
    }
}