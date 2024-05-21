pipeline {
    agent any 
        tools {
        maven "maven-3"
        jdk "java8"
    }

    stages{
        stage('Build'){
            steps{
                // this stage is to build the code 
                echo "compile the source code"
                sh 'mvn package'
            }
        }
        stage('Test'){
            steps{
                echo "Running test cases"
            }
        }
        stage('Deploy'){
            steps{
                echo "deploying artifact into tomcat"
            }
        }
    }
}