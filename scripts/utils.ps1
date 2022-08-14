<# 

    How to use
    ==========
    
    . .\scripts\utils.ps1

    Invoke-DotNetPack -Version $(Set-IncrementPackageVersion  -Version $(Get-PackageVersion .\templatepack.csproj)) 

    Push-NugetPackage -ApiKey $env:NUGET_IOT_TEMPLATE2_APIKEY -Version $(Set-IncrementPackageVersion  -Version $(Get-PackageVersion .\templatepack.csproj))
#>


function  Get-PackageVersion() {

    [OutputType([Version])]
    param (
        [Parameter(Mandatory=$true)]       
        [string]$ProjectRelativePath
    )

    $xml = [xml](Get-Content $ProjectRelativePath)
    $version = [Version]$xml.Project.PropertyGroup.PackageVersion
    $version    
    
}

function Set-IncrementPackageVersion() {

    [OutputType([Version])]
    param (
        [Parameter(Mandatory=$true)]       
        [Version]$Version
    )

    $newVersion = "$($Version.Major).$($Version.Minor).$($Version.Build+1)"
    $newVersion
    
}


function Invoke-DotNetPack() {

    param (
        [Parameter(Mandatory=$true)]       
        [Version]$Version
    )

    dotnet build -c Release /p:Version=$Version /p:AssemblyVersion=$($Version).1
    dotnet pack -c Release -p:packageversion=$Version
}

function Push-NugetPackage() {

    param (
        [Parameter(Mandatory=$true)]       
        [Version]$Version,
        [Parameter(Mandatory=$true)]       
        [String]$ApiKey
    )

    $packageVersion = "$($Version.Major).$($Version.Minor).$($Version.Build)"
    dotnet nuget push ./bin/Release/Garrard.IOT.Templates.$($packageVersion).nupkg -k $ApiKey -s https://api.nuget.org/v3/index.json

}


