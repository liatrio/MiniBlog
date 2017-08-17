FROM microsoft/iis:windowsservercore

RUN mkdir C:\site 

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "Site" -PhysicalPath C:\site -BindingInformation "*:8000:"

RUN powershell -NoProfile -Command Install-WindowsFeature Web-Asp-Net45

EXPOSE 8000

ADD website/ /site

