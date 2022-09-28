
<#
The following section will help you get administrative privileges 
#>

param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
<#
The following section is the main code
in the "softwarelist" array add all the names of the programs you wanna stop after startup
remember you will have to write the exact process name of the program 
you can find the process names from taskmanager
#>
$softwarelist = 'PowerToys|MouseWithoutBorders|PhoneExperienceHost|discord'
get-process |
    Where-Object {$_.ProcessName -match $softwarelist} |
    stop-process -force



