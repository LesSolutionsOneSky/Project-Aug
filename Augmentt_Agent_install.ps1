
<# Install Augmentt Agent#>
Invoke-WebRequest -Uri https://github.com/LesSolutionsOneSky/Augmentt/raw/main/DiscoveryAgentSetup.msi -OutFile C:\Temp\DiscoveryAgentSetup.msi


#$InstallExitCode = (Start-Process -FilePath $SoftwarePath -ArgumentList "/quiet /norestart" -Wait -Verb RunAs -PassThru)
$InstallExitCode = (msiexec /i DiscoveryAgentSetup.msi /quiet /qn 'WRAPPED_ARGUMENTS="/VERYSILENT /SUPPRESSMSGBOXES /extensionKey=c5ddff01-dfe0-489d-8db7-55d1c3a0869b"')
If ($InstallExitCode -eq 0) {
    If (!$Silent) {Write-Verbose "The Automate Agent Installer Executed Without Errors"}
} Else {
    Write-Verbose "The Automate Agent Installer Executed With Errors!"
}# End Else