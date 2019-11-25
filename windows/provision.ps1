Invoke-WebRequest -UseBasicParsing -Uri http://172.28.128.20:80/2.1/genconf_win/serve/prerequisites/dcos_install.ps1 -OutFile C:\Users\vagrant\Downloads\dcos_install.ps1

& C:\Users\vagrant\Downloads\dcos_install.ps1 http://172.28.128.20:80 2.1 172.28.128.21
