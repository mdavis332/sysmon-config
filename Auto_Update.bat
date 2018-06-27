@echo on
cd C:\ProgramData\sysmon\
@powershell "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;(new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/mdavis332/sysmon-config/master/sysmonconfig-export.xml','C:\ProgramData\sysmon\sysmonconfig-export.xml')"
sysmon64 -c sysmonconfig-export.xml
exit
