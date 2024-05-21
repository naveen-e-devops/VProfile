pipeline {
    agent any 
    stages{
        stage('Build'){
            steps{
                // this stage is to build the code 
                echo "compile the source code"
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