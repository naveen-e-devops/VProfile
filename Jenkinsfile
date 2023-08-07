pipeline {
    agent any
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
