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
        stage('deploy') {
            agent {
                label 'windows'
            }
            steps {
                bat 'docker build -t iis-site .'
                bat 'docker kill miniblog' 
                bat 'docker rm miniblog'
                bat 'docker run -d --name miniblog iis-site'
            }
        }
        stage('reverse proxy') {
            agent {
                label 'windows'
            }
            steps {
                bat('powershell -NoProfile -Command Invoke-Command -ComputerName . -FilePath .\\reverse_proxy.ps1  -ArgumentList miniblog')
            }
        }
    }
}
