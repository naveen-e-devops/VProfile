pipeline {
    agent any
    stages{
        stage('git clone') {
            steps{
                // cloning git repo 
                sh 'git clone https://github.com/naveen-e-devops/VProfile.git'
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
