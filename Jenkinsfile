pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn3"
        jdk "jdk8"
    }
    stages{
        stage('git clone') {
            steps{
                // cloning git repo 
                git branch: 'test-pipeline', changelog: false, poll: false, url: 'https://github.com/naveen-e-devops/VProfile'
            }

        }
        stage('BUILD'){
            steps{
                // mvn build 
                sh 'mvn install'
            }
        }
        stage('deply'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'jenkins-tomcat', path: '', url: 'http://172.31.35.217:8080')], contextPath: '9-aug', war: 'target/vprofile-v1.war'
            }
        }
    }
}
