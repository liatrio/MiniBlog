pipeline {
    agent none
    stages {
        stage('build') {
            agent {
                label 'windows'
            }
            steps {
                bat 'C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\msbuild .\\MiniBlog.sln'
            }
        }
    }
}
