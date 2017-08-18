#!powershell

param([string]$appName)

$newIP = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $appName
$site = "iis:\sites\Default Web Site"
$filterRootIn = "system.webServer/rewrite/rules/rule[@name=\'$appName-in$_\']"

# Clear Old Configuration
Clear-WebConfiguration -pspath $site -filter $filterRootin

# Creates inbound rule
Add-WebConfigurationProperty -pspath $site -filter "system.webServer/rewrite/rules" \
    -name "."  -value @{name="$appName-in" + $_ ;patternSyntax=\'Regular Expressions\';stopProcessing=\'False\'}

# Set regular expression. 
Set-WebConfigurationProperty -pspath $site -filter "$filterRootIn/match" -name "url" -value ".*"

# Sets type "Rewrite"
Set-WebConfigurationProperty -pspath $site -filter "$filterRootIn/action" -name "type" -value "Rewrite"

# Sets IP in the server 
Set-WebConfigurationProperty -pspath $site -filter "$filterRootIn/action" -name "url" -value "http://${newIP}:8000/{R:0}"
