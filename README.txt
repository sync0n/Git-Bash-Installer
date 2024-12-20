# Define the README content
$ReadMeContent = @"
# GitInstallerScript

## Overview
This script dynamically fetches and installs the latest Git Bash for Windows using PowerShell. It leverages GitHub's API to ensure the installer URL is always up-to-date.

## Features
- Automatically retrieves the latest 64-bit Git Bash installer.
- Performs a silent installation.
- Cleans up the installer file post-installation.

## Usage
1. Run the script in PowerShell with administrator privileges:
   ```powershell
   .\InstallGit.ps1
