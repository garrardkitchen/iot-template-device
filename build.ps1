. .\scripts\utils.ps1
Invoke-DotNetPack -Version $(Set-IncrementPackageVersion  -Version $(Get-PackageVersion .\templatepack.csproj)) 