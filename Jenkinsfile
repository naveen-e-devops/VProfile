pipeline {
    agent any
    tools {
        jdk "jdk8"
        maven "maven3"
    }
    stages{
        stage("clone"){
            steps{
                 git 'https://github.com/naveen-e-devops/VProfile.git'
            }
        }
        stage("Build"){
            steps{
                sh 'mvn package'
            }
        }
        stage("nexus artifact upload"){
            steps{
              nexusArtifactUploader(
              nexusVersion: 'nexus3',
              protocol: 'http',
              nexusUrl: '13.234.32.181:8081/',
              groupId: 'QA',
              version: "$BUILD_ID",
              repository: 'vprofile-repo',
              credentialsId: 'nexuscreds',
              artifacts: [
                 [artifactId: "vprofile",
                 classifier: '',
                 file: "target/vprofile-v1-$BUILD_ID/.war",
                 type: 'war']
                ]
            )
            }
        }
    }
}