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
        }
}
