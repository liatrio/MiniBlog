pipeline {
    agent none
    stages {
        stage('build') {
            agent {
                label 'windows'
            }
            steps {
                bat 'dir'
                bat 'cd'
            }
        }
    }
}
