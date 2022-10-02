pipeline {
    agent {docker 'golang:1.18.3'}
    stages{
        stage("build"){
            steps{
                sh 'go env'
            }
        }
    }
}