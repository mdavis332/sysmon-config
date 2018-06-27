@echo off
cd %temp%
echo [+] Downloading Graylog Sidecar to: %temp%\Sidecar.exe...
@powershell "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;(new-object System.Net.WebClient).DownloadFile('https://github.com/Graylog2/collector-sidecar/releases/download/0.1.6/collector_sidecar_installer_0.1.6-1.exe','%temp%\Sidecar.exe')"
start /wait Sidecar.exe /S -SERVERURL=https://YOURSERVERIPHERE:443/api -TAGS="windows"
echo [+] Executing Script to edit content of sidecar configuration...
REM @powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mdavis332/sysmon-config/master/Graylog_Content_Pack/sidecar.ps1')"
cd "C:\Program Files\graylog\collector-sidecar\"
echo [+] Installing Graylog Services...
graylog-collector-sidecar.exe -service install
graylog-collector-sidecar.exe -service start
echo [+] Checking Services...
@powershell get-service collector-sidecar
echo [+] Graylog Sidecar Successfully Installed and Configured!
timeout /t 10
exit
