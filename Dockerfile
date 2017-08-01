# escape=`
FROM microsoft/windowsservercore

MAINTAINER erik.faye-lund@fusetools.com

ADD extra C:\Temp\
RUN powershell C:\Temp\install_deps.ps1
