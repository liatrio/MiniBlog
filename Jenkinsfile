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
                powershell('Invoke-WebRequest -outf rewrite.msi https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi')
                bat 'docker build -t iis-site .'
                bat 'docker run -d -p 8000:8000 --name miniblog iis-site'
                bat 'del rewrite.msi'
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
