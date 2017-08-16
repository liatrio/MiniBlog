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
                bat 'docker run -d -p 8000:8000 --name miniblog iis-site'
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
