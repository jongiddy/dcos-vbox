$ErrorActionPreference = "stop"

# Turn off firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Use master as DNS server, to get leader/master.mesos
$adapters = Get-NetAdapter | Select-Object -ExpandProperty Name
ForEach($adapter in $adapters) {
    Set-DnsClientServerAddress -InterfaceAlias $adapter -ServerAddresses 172.28.128.21
}

# Download dcos_install.ps1
Invoke-WebRequest -UseBasicParsing -Uri http://172.28.128.20:80/windows/prerequisites/dcos_install.ps1 -OutFile C:\Users\vagrant\Downloads\dcos_install.ps1

# Run dcos_install.ps1
& C:\Users\vagrant\Downloads\dcos_install.ps1 http://172.28.128.20:80 172.28.128.21
