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
        stage('CODE ANALYSIS with SONARQUBE') {
          
		  environment {
             scannerHome = tool 'sonarqube'
          }

          steps {
            withSonarQubeEnv('sonarqube') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile-repo \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.login=admin \
                   -Dsonar.password=admin123 \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
            }

            //timeout(time: 1, unit: 'MINUTES') {
            //   waitForQualityGate abortPipeline: false
           // }
          }
        }
        stage('artifact uploader'){
            steps{
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: '172.31.40.179:8081',
                groupId: 'visualpath',
                version: '$BUILD_ID',
                repository: 'vprofile-repo',
                credentialsId: 'nexus-creds',
                artifacts: [
                  [artifactId: 'vprofileid',
                  classifier: '',
                  file: 'target/vprofile-v1.war',
                  type: 'war']
                 ]
               )
            }
        }
        stage('Test'){
            steps{
                echo "Running test cases"
            }
        }
        stage('Deploy'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcat-creds', path: '', url: 'http://65.1.106.102:8080')], contextPath: null, war: 'target/vprofile-v1.war'
            }
        }
    }
}