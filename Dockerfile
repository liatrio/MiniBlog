FROM microsoft/iis:windowsservercore

RUN mkdir C:\site

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "Site" -PhysicalPath C:\site -BindingInformation "*:8000:"

EXPOSE 8000

ADD website/ /site

