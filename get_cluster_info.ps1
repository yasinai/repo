#$esxCred = Get-Credential


Add-PSSnapin VMware.VimAutomation.Core

#Connecting to VC-VMRACK
Connect-VIServer VC-VMRACK -user $domainuser -Password $domainpassword | Out-Null


#Get List of VMs

Get-VM | Get-CDDrive | select @{N="VM";E="Parent"},IsoPath | where {$_.IsoPath -ne $null}   | Select-String -Pattern "scratch"  | format-list -property Line | out-file c:\jenkins\test.csv



#Connect to ESX hosts in cluster

#foreach ($esx in Get-Datacenter VMRACKS | Get-VMHost) {
#Connect-VIServer $esx -Credential $esxCred | Out-Null
#Get-VMHostAdvancedConfiguration -Name "ScratchConfig.ConfiguredScratchLocation"
#}
