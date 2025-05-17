Clear-Host

Write-Host "==============================" -ForegroundColor Cyan
Write-Host " Active Directory Installatie " -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Dit script installeert automatisch Active Directory (ADDS) en configureert een nieuw forest." -ForegroundColor Yellow
Write-Host ""

$DomainName = Read-Host "Voer de gewenste domeinnaam in (bijv. 'bedrijf.local')"

Write-Host ""
Write-Host "Je hebt '$DomainName' gekozen als domeinnaam." -ForegroundColor Green
$bevestiging = Read-Host "Druk op [Enter] om door te gaan of [Ctrl+C] om te annuleren"

Write-Host "`nInstallatie van Windows-feature AD-Domain-Services wordt gestart..." -ForegroundColor Cyan
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Write-Host "`nConfiguratie van nieuw Active Directory forest met domein '$DomainName'..." -ForegroundColor Cyan

Install-ADDSForest -DomainName $DomainName -InstallDNS -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -LogPath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -Force:$true -SafeModeAdministratorPassword (Read-Host -AsSecureString "Voer een Directory Services herstelmodus wachtwoord in")

Write-Host "`nActive Directory is succesvol geïnstalleerd." -ForegroundColor Green
Write-Host "De server moet mogelijk opnieuw worden opgestart om de configuratie te voltooien." -ForegroundColor Yellow
