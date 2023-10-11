pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "vprofile"
        jdk "jdk8"
    }
    stages{
        stage('Clone'){
            steps {
                echo "cloning a repo"
                git 'https://github.com/wkhanvisualpathit/VProfile.git'
            }
        }
        stage('build'){
            steps {
                echo "build my project"
                sh 'mvn package'
            }
        }
    }
}
