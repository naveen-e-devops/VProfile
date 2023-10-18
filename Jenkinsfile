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
    }
}