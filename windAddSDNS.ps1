$ChocoInstallPath = "$env:SystemDrive\\ProgramData\\Chocolatey\\bin"
if (!(Test-Path $ChocoInstallPath)) {
    If (-not (Test-Path $profile)) {
        New-Item -path $profile -type file -force
        Add-Content $profile "# Empty profile for chocolatey"
    }
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
    . $profile
    refreshenv
}
choco install azure-cli -y --force
refreshenv
az login -u 'jdooley@kinaxis.com' -p 'N@b!7312'
$SDNS=az network nic list -g JXTestTestJD --query "[*].dnsSettings.internalDomainNameSuffix | [0]"
Set-DnsClientGlobalSetting -SuffixSearchList @($SDNS.Replace("`"",""), "reddog.microsoft.com")