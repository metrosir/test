// 重试3次，执行3分钟超时
pipeline {
    agent any
    stages {
        stage ('deploy'){
            steps {
                retry(3) {
                    sh './t.sh'
                }
                timeout(time:3, unit:'MINUTES') {
                    sh './t1.sh'
                }
            }
        }
    }
}

// 嵌套：总共3分钟超时，在3分钟之内可以重试5次
pipeline {
    agent any
    stages {
        stage('deploy') {
            steps {
                timeout(time:3, unit:'MINUTES') {
                    retry (5) {
                        sh './t.sh'
                    }
                }
            }
        }
    }
}