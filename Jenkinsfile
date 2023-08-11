pipeline {
    agent any
    

    stages {
        stage("code from github") {
            steps {
                git branch: 'main', url: 'https://github.com/sinku29/project-1.git'
            }
        }
      
        stage("build docker image") {
            steps {
                sh 'docker image build  -t $JOB_NAME:v1.$BUILD_ID .'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID sinku29/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID sinku29/$JOB_NAME:latest'
            }
        }
    
        
        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv('sonartoken') {
                        def scannerHome = tool name: 'sonar-server', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=https://github.com/sinku29/project-1.git -Dsonar.sources=./"
                    }
                }
            }
        }
    }
}