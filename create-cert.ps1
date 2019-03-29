Param(
	$deviceName = "severinTestDevice"
)

$cert = New-SelfSignedCertificate -Type Custom -Subject "CN=$deviceName, O=TEST, C=US" -KeySpec Signature -KeyExportPolicy Exportable -HashAlgorithm sha256 -KeyLength 2048 -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2") -CertStoreLocation "Cert:\CurrentUser\My"

Write-Host "Generated the certificate:"
Write-Host $cert

$password = ConvertTo-SecureString "Severin" -AsPlainText -Force

$cert | Export-PfxCertificate -FilePath powershell\certificate.pfx -Password $password
Set-Content -Path powershell\certificate.cer -Value ([Convert]::ToBase64String($cert.RawData)) -Encoding Ascii

Get-PfxCertificate -FilePath powershell\certificate.pfx