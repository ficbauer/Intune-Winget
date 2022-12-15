#Fill this variable with the Winget package ID
$PackageName = "Microsoft.VisualStudioCode"
$VSCVersion = (Get-Item "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe").VersionInfo.FileVersion

$ResolveWingetPath = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"
    if ($ResolveWingetPath){
           $WingetPath = $ResolveWingetPath[-1].Path
    }

$config
cd $wingetpath
$InstalledApps = .\winget.exe list --id $PackageName

if ($VSCVersion -lt "1.74.0") {
    Write-Host "Upgrade"
    Exit 1
}
else {
    Write-Host "Not Upgrade"
    Exit 0
}
