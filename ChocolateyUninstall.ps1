$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Octopus Deploy Tentacle" }
if($app -ne $null){
    $version=$app.Version
    $uninstaller=Get-Childitem "$env:ProgramData\Package Cache\" -Recurse -Filter OctopusTentacleInstall.msi | ? { $_.VersionInfo.ProductVersion.startswith($version)}
    Uninstall-ChocolateyPackage 'Octopus.Tentacle' 'msi' "/x" $uninstaller.FullName
}