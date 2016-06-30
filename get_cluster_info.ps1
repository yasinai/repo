$vcServer = "vc-vmrack"
$cluster = "VMRACKS"
$esxCred = Get-Credential
Connect-VIServer $vcServer | Out-Null
#Connect to ESX hosts in cluster
foreach ($esx in Get-Cluster $cluster | Get-VMHost) {
Connect-VIServer $esx -Credential $esxCred | Out-Null
Get-VMHostAdvancedConfiguration -Name "ScratchConfig.ConfiguredScratchLocation"
}