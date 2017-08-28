#!powershell

param([string]$appName)

# Check for Already running instance
If(docker ps | Select-String -Pattern $appName) {
    docker kill miniblog
    docker rm miniblog
} ElseIf (docker ps -a | Select-String -Pattern $appName) {
    docker rm miniblog
} 

# Run new instance
docker run -d --name $appName iis-site



