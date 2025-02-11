
# Run the npm build command
npm run build

# Add all changes to git
git add .

# Get the current date and time
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Commit the changes with a message including the timestamp
git commit -m "Build and push latest changes - $timestamp"

# Push the changes to the remote repository
git push origin main

