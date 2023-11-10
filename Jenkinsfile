pipeline {
    agent any

    tools {
        maven "maven-3"
        jdk "jdk8"
    }

    stages {
        stage('clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/naveen-e-devops/VProfile.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn package'
            }
        }
        stage('nexus artifact uploader'){
            steps{
                nexusArtifactUploader(
                  nexusVersion: 'nexus3',
                  protocol: 'http',
                  nexusUrl: '172.31.36.77:8081',
                  groupId: 'QA-server',
                  version: "$BUILD_ID",
                  repository: 'vprofile-repo',
                  credentialsId: 'nexuscreds',
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
