. .\scripts\utils.ps1
Invoke-DotNetPack -Version $(Set-IncrementPackageVersion  -Version $(Get-PackageVersion .\templatepack.csproj)) 
Push-NugetPackage -ApiKey $env:NUGET_IOT_TEMPLATE2_APIKEY -Version $(Set-IncrementPackageVersion  -Version $(Get-PackageVersion .\templatepack.csproj))