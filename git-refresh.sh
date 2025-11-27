#!/bin/bash

# 1️⃣ Check for local changes
if [[ -n $(git status -s) ]]; then
  echo "Local changes detected. Staging and committing..."
  git add .
  git commit -m "Auto-commit local changes before pull"
fi

# 2️⃣ Pull latest from GitHub and merge
echo "Pulling latest changes from origin/main..."
git pull --no-rebase origin main

# 3️⃣ Refresh VS Code
echo "Refreshing VS Code..."
osascript -e 'tell application "Visual Studio Code" to activate' \
          -e 'tell application "System Events" to keystroke "r" using {command down, shift down}'

echo "✅ GitHub sync & VS Code refresh complete!"
