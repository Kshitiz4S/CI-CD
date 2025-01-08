pipeline {
    agent any

    stages {
        stage('GIT SCM Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Kshitiz4S/CI-CD.git']])
                echo 'SCM Checkout Successful'
            }
        }
        stage('Build Image'){
            steps{
                sh "docker build -t demo-website ."
                echo 'build successful'
            }
        }
        stage('Push Image to DockerHub'){
            steps{
                withCredentials([usernamePassword(credentialsId:'DockerHub',passwordVariable:'DOCKER_PASSWORD',usernameVariable:'DOCKER_USERNAME')]) {
                sh "docker tag demo-website:latest ${env.DOCKER_USERNAME}/demo-website:latest"
                sh "docker login -u ${env.DOCKER_USERNAME} -p ${env.DOCKER_PASSWORD}"
                sh "docker push ${env.DOCKER_USERNAME}/demo-website:latest"
                echo 'image pushed successfully'
                }
            }
        }
        stage('Deployment'){
            steps{
                sh "docker-compose down && docker-compose up -d"
                echo 'deployment successful'
            }
        }
    }
}

