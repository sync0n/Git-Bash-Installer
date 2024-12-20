# Define the script content
$ScriptContent = @"
try {
    # Get the latest release information from GitHub API
    \$LatestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/git-for-windows/git/releases/latest" -UseBasicParsing

    # Extract the URL for the 64-bit installer
    \$InstallerUrl = \$LatestRelease.assets | Where-Object { \$_.name -match "64-bit.exe" } | Select-Object -ExpandProperty browser_download_url
    \$OutputFile = "\$env:TEMP\GitInstaller.exe"

    if (-not \$InstallerUrl) {
        throw "Unable to find the 64-bit Git installer URL."
    }

    # Download the Git for Windows installer
    Invoke-WebRequest -Uri \$InstallerUrl -OutFile \$OutputFile -UseBasicParsing

    # Execute the installer silently
    Start-Process -FilePath \$OutputFile -ArgumentList "/VERYSILENT" -Wait

    # Cleanup the installer file
    Remove-Item -Path \$OutputFile -Force

    Write-Host "Git Bash installed successfully!" -ForegroundColor Green
} catch {
    Write-Host "An error occurred: \$($_.Exception.Message)" -ForegroundColor Red
}
"@

# Save the script to a file
Set-Content -Path "InstallGit.ps1" -Value $ScriptContent
