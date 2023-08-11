pipeline {
    agent any
    environment {
        SONAR_TOKEN = credentials('sonartoken')
    }

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
    
        
        stage('Code Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-server'
                    def sonarQubeEnv = withSonarQubeEnv('sonartoken') {
                        sh "${scannerHome}/opt/sonar-scanner"
                    }
                }
            }
        }
    }
}