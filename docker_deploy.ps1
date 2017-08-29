#!powershell

param([string]$appName)

# Check for Already running instance
If(docker ps | Select-String -Pattern $appName) {
    docker kill $appName
    docker rm $appName
} ElseIf (docker ps -a | Select-String -Pattern $appName) {
    docker rm $appName
} 

# Run new instance
docker run -d --name $appName iis-site



