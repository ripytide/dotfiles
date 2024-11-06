$app = Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | ? {
	($_.DisplayName -eq "WiRE") -and ($null -eq $_.BundleVersion)
}
if ($null -eq $app) {
	Write-Output "No installed version of WiRE found."
} else {
	$productCode = $app.UninstallString.Split()[1].Replace('/I','')
	Write-Output ("Uninstalling {0} {1} using product code {2}" `
		-f ($app.DisplayName, $app.DisplayVersion, $productCode))
	$xargs = @("/uninstall", $productCode, "/l*v", "uninstallation.log", "/passive", "/quiet")
	$msiexec = Start-Process "msiexec.exe" -ArgumentList $xargs -NoNewWindow -Wait -PassThru
	Write-Output "Uninstallation exit code was $($msiexec.ExitCode)"
}
