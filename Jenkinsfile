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
                sh 'mvn build'
            }
        }
    }
}
