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
    }
}
