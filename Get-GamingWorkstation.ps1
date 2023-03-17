#Installs Packages
choco install firefox vmwareworkstation 7zip steam goggalaxy origin uplay epicgameslauncher vlc vscode nvidia-display-driver battle.net intel-chipset-device-software intel-me-drivers logitechgaming sysmon citrix-workspace foxitreader naps2 git signal putty winscp

#Installs git for powershell
refreshenv
Install-Module posh-git -Scope CurrentUser -Force
Add-Content $PROFILE 'Import-Module posh-git'

$Edition=Get-WindowsEdition -Online

#Ensures scans will run, even if computer turned off at next login https://docs.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=windowsserver2019-ps
Set-MPPreference -DisableCatchupQuickScan $False
Set-MPPreference -DisableCatchupFullScan $False

#Ensures Patterns are updated prior to scan
Set-MPPreference -CheckForSignaturesBeforeRunningScan $true


if($Edition.Edition -eq "Professional")
{
    # Basic Client harding (Requires Win-10 Pro)
    Set-MpPreference -AttackSurfaceReductionRules_Ids BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 3B576869-A4EC-4529-8536-B80A7769E899 -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids D3E037E1-3EB8-44C8-A917-57927947596D -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2 -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869 -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules_Actions Enabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions Enabled
    # Disabled as these are enterprise additions
    Set-MpPreference -AttackSurfaceReductionRules_Ids d1e49aac-8f56-4280-b9ba-993a6d77406c -AttackSurfaceReductionRules_Actions Disabled
    Set-MpPreference -AttackSurfaceReductionRules_Ids c1db55ab-c21a-4637-bb3f-a12568109d35 -AttackSurfaceReductionRules_Actions Disabled
}
else
{
    write-host "No Defender Mitigations compatable with $($Edition.Edition)"
    write-host "Note: Due to usecase, not testing Education or Enterprise Editions of Windows"
}

Write-Host "Please setup sysmon seperatley if using, noting you should increase event log size in GPO"
