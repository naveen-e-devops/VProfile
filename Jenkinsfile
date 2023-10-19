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
        stage('CODE ANALYSIS with SONARQUBE') {
          
		  environment {
             scannerHome = tool 'sonarqube-5'
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

      stage('nexus artifact uploader'){

       steps {
        nexusArtifactUploader(
        nexusVersion: 'nexus3',
        protocol: 'http',
        nexusUrl: '35.154.240.231:8081/',
        groupId: 'QA',
        version: "$BUILD_ID",
        repository: 'vprofile-repo',
        credentialsId: 'nexus-creds',
        artifacts: [
            [artifactId: "vprofile-artifact-id",
             classifier: '',
             file: 'target/vprofile-v1.war',
             type: 'war']
        ]
     )

        }
   }

  stage('deploy to tomact'){
  steps{
        deploy adapters: [tomcat8(credentialsId: 'tomcat-creds', path: '', url: 'http://43.204.145.203:8080')], contextPath: 'vprofile', war: 'target/vprofile-v1.war'

}

}
  
    }
}
