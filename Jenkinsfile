pipeline {
    agent { label "Dev" }
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
        stage('CODE ANALYSIS with SONARQUBE') {
          
		  environment {
             scannerHome = tool 'sonarqube-4'
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
        stage("nexus artifact upload"){
            steps{
              nexusArtifactUploader(
              nexusVersion: 'nexus3',
              protocol: 'http',
              nexusUrl: '172.31.46.242:8081/',
              groupId: 'QA',
              version: "$BUILD_ID",
              repository: 'vprofile-repo',
              credentialsId: 'nexuscreds',
              artifacts: [
                 [artifactId: "vprofile",
                 classifier: '',
                 file: "target/vprofile-v1.war",
                 type: 'war']
                ]
            )
            }
        }
        stage('deploy'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcatcreds', path: '', url: 'http://15.207.72.176:8080/')], contextPath: 'vprofile', war: 'target/vprofile-v1.war'
            }
        }
    }
}
