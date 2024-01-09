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
        stage('CODE ANALYSIS with SONARQUBE') {
          
		  environment {
             scannerHome = tool 'sonarqube-4'
          }

          steps {
            withSonarQubeEnv('sonarqube') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile-project \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.login=admin \
                   -Dsonar.password=admin123 \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=targets \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
            }

            //timeout(time: 1, unit: 'MINUTES') {
            //   waitForQualityGate abortPipeline: false
           // }
          }
        }
        stage('Nexus artifact upload'){
            steps{
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: '172.31.44.6:8081',
                groupId: 'DEV',
                version: "$BUILD_NUMBER",
                repository: 'vprofile-repo',
                credentialsId: 'nexus-creds',
                artifacts: [
                    [artifactId: "vprofile",
                    classifier: '',
                    file: 'target/vprofile-v1.war',
                    type: 'war']
                     ]
                )
            }
        }
        stage('Deploy to tomcat'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcat-creds', path: '', url: 'http://13.201.74.125:8080')], contextPath: 'jan-9', war: 'target/vprofile-v1.war'
            }
        }
        
    }
}