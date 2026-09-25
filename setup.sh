#!/usr/bin/env bash
# One-time setup: creates a public repo, pushes this folder, and turns on GitHub Pages.
# Needs git and the GitHub CLI (https://cli.github.com), logged in with: gh auth login
# Usage: bash setup.sh            (repo name defaults to rotp-media)
#        bash setup.sh my-name    (use a different repo name)
set -euo pipefail

REPO_NAME="${1:-rotp-media}"

command -v git >/dev/null || { echo "Install git first."; exit 1; }
command -v gh  >/dev/null || { echo "Install the GitHub CLI first: https://cli.github.com"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Log in first: gh auth login"; exit 1; }

OWNER="$(gh api user --jq .login)"

if [ ! -d .git ]; then
  git init -b main
fi
git add -A
git commit -m "Set up ROTP screenshot site" || echo "Nothing new to commit, continuing."

gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

gh api -X POST "repos/$OWNER/$REPO_NAME/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null

echo
echo "Done. GitHub Pages is building. Your site will be live in a minute or two at:"
echo "https://$OWNER.github.io/$REPO_NAME/"
