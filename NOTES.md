# Notes

## To extract project version:

```powershell
$xml = [xml](Get-Content .\iot-template-device.csproj)
$version = [Version]$xml.Project.PropertyGroup.PackageVersion
```

## To build:

```powershell
dotnet build /p:Version=0.0.3 /p:AssemblyVersion=0.0.3.1
```

👆 File Version = 0.0.3.1
👆 Product Version = 0.0.3
