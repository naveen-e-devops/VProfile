pipeline {
    agent any 
    
    tools {
        jdk "java-8"
        maven "maven-3"
    }
    stages{
        stage('CLONE'){
            steps {
                git 'https://github.com/wkhanvisualpathit/VProfile.git'
            }
        }
        stage('Test'){
            steps{
                echo "runnig test cases"
            }
        }
        stage('Build'){
            steps{
                sh 'mvn package'
            }
        }
        
    }
}