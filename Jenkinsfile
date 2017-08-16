pipeline {
    agent none
    stages {
        stage('docker-ephem') {
            agent {
                docker {
                    label 'windows'
                    image 'deepelement/docker-winservercore-jenkins-pipeline'
                }
            }
            steps {
                bat 'cd'
            }
        }
        // stage('build') {
        //     agent {
        //         label 'windows'
        //     }
        //     steps {
        //         bat 'C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\msbuild .\\MiniBlog.sln'
        //     }
        // }
    }
}
