pipeline {
    agent any
    stages {
        stage ('从git仓库拉取代码阶段') {
            steps{
                echo "----------------------从git仓库拉取代码阶段------------------"
                timeout(time:3, unit:'MINUTES') {
                    git branch: 'main', credentialsId: '5c26cc66-ec4d-40aa-a261-58f29df53b76', url: 'git@github.com:metrosir/test.git'
                }
            }
        }
        stage ('生产docker镜像') {
            steps {
                echo "----------------------生产docker镜像------------------"
                sh '''
                docker login -u t1 -p 'Oa123!@#' 192.144.178.98:443
                docker build -t 192.144.178.98:443/my/nginx:latest -f project/Dockerfile .
                docker push 192.144.178.98:443/my/nginx:latest
                '''
            }
        }
        stage('Deploy to K8S'){
            steps {
                echo "----------------------kubernetesDeploy------------------"
                kubernetesDeploy configs: 'deploy/deploy.yaml'
            }
        }
    }
}