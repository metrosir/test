pipeline {
    agent any
    stages {
        stage ('deploy') {
            steps {
                sh 'run build '
            }
        }
    }
    post {
        always {
            echo "this always"
        }
        success {
            echo "this success"
        }
        failure {
            echo "this failure"
        }
        unstable {
            echo "this unstable"
        }
        changed {
            echo 'changed'
        }
    }
}