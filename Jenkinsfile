pipeline {
    agent any

    environment {
        IMAGE_NAME = "pruthadongre09/myapp"
        TAG = "v1"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Prutha-Dongre/my-devsecops-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Scan with Trivy') {
            steps {
                sh '''
                trivy image --scanners vuln --severity HIGH,CRITICAL --exit-code 1 --timeout 5m $IMAGE_NAME:$TAG
                '''
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }
    }
}