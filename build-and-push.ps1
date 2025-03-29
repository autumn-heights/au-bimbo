# Run the npm build command
npm run build

# Zip the public directory
Compress-Archive -Path "./public" -DestinationPath "./public.zip" -Force

# Check if there are any changes to commit
$changes = git status --porcelain

if ($changes) {
    # Add all changes to git
    git add .

    # Get the current date and time
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Commit the changes with a message including the timestamp
    git commit -m "Build and push latest changes - $timestamp"

    # Push the changes to the remote repository
    git push origin main
} else {
    Write-Output "No changes to commit."
}

# Create a zip file with only git-tracked files
$tempFile = [System.IO.Path]::GetTempFileName()
git ls-files | Out-File -FilePath $tempFile
Compress-Archive -Path (Get-Content $tempFile) -DestinationPath "../au-bimbo-latest.zip" -Force
Remove-Item $tempFile