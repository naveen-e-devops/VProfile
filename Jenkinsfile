pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
        jdk "jdk8"
    }

    stages {
        stage('clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/naveen-e-devops/VProfile'

            }

            }
        stage('build'){
            steps{
                sh 'mvn package'
            }
        }
        stage('test'){
            steps{
                sh 'date'
            }
        }
        stage('artifact upload'){
            steps{
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: '172.31.35.38:8081',
                groupId: 'DEV',
                version: "{$BUILD_NUMBER}",
                repository: 'vprofile',
                credentialsId: 'nexus3-creds',
                artifacts: [
                [artifactId: "vprofileid",
                classifier: '',
                file: 'target/vprofile-v1.war',
                 type: 'war']
                ]
            )
            }
        }
        stage('deploy'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcat1-creds', path: '', url: 'http://172.31.44.112:8080')], contextPath: 'may-20', war: 'target/vprofile-v1.war'
            }
        }
        }
}
