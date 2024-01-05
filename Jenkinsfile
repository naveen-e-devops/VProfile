pipeline {
    agent any 
    
    tools {
        jdk "java-8"
        maven "maven-3"
    }
    stages{
        stage('CLONE'){
            steps {
                git 'https://github.com/wkhanvisualpathit/VProfile.git'
            }
        }
        stage('Test'){
            steps{
                echo "runnig test cases"
            }
        }
        stage('Build'){
            steps{
                sh 'mvn package'
            }
        }
        stage('Nexus artifact upload'){
            steps{
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: '13.233.208.212:8081',
                groupId: 'DEV',
                version: "v1",
                repository: 'vprofile-repo',
                credentialsId: 'nexus-creds',
                artifacts: [
                    [artifactId: "vprofile",
                    classifier: '',
                    file: 'target/vprofile-v1.war',
                    type: 'war']
                     ]
                )
            }
        }
        
    }
}