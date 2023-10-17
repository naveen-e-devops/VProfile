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

      stage('nexus artifact uploader'){

       steps {
        nexusArtifactUploader(
        nexusVersion: 'nexus3',
        protocol: 'http',
        nexusUrl: '43.205.195.201:8081/',
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
        deploy adapters: [tomcat8(credentialsId: 'tomcat-creds', path: '', url: 'http://15.207.54.81:8080')], contextPath: 'vprofile', war: 'target/vprofile-v1.war'

}

}
  
    }
}
