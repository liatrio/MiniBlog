FROM microsoft/iis:windowsservercore

RUN mkdir C:\site 

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "Site" -PhysicalPath C:\site -BindingInformation "*:8000:"

# Install Application Pool
# RUN powershell -NoProfile -Command Install-WindowsFeature Web-Asp-Net45

# Turn off handlers and modules in delegation
RUN powershell -NoProfile -Command import-module WebAdministration; \
    powershell -NoProfile -Command Set-WebConfiguration //System.webServer/handlers \
    -metadata overrideMode -value Allow -PSPath IIS:/ ; \
    powershell -NoProfile -Command Set-WebConfiguration //System.webServer/modules \
    -metadata overrideMode -value Allow -PSPath IIS:/ 

# Install Rewrite
# COPY rewrite.msi \rewrite.msi
ADD https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi rewrite_amd64.msi
RUN rewrite_amd64.msi & del rewrite_amd64.msi
EXPOSE 8000

ADD website/ /site
