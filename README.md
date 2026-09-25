# rotp-media

Screenshot hosting for Rise of the Pirates, served free from GitHub Pages. Every image in `screenshots/` shows up on the site automatically, with one click to copy the HTML for a BYOND hub post.

## Before you push

Open `index.html`, find the `CONFIG` block near the bottom, and paste in your links:

```js
steamUrl: "https://store.steampowered.com/app/...",
discordUrl: "https://discord.gg/...",
```

The Steam and Discord buttons stay hidden until these are filled in.

## Setup (once)

**With the GitHub CLI**

```bash
bash setup.sh
```

This creates the public repo `rotp-media`, pushes everything, and turns on GitHub Pages. Your site will be at `https://YOURNAME.github.io/rotp-media/` a minute or two later. On Windows, run it from Git Bash.

**With just the website**

1. Create a new public repo named `rotp-media`.
2. Upload everything in this folder. Drag and drop works.
3. Go to Settings, then Pages. Under "Build and deployment", set Source to "Deploy from a branch", pick `main` and `/ (root)`, and save.

## Adding screenshots

Drop images into `screenshots/` and push:

```bash
git add screenshots
git commit -m "New screenshots"
git push
```

They show up on the site within a couple of minutes.

Start file names with a date and they sort newest first with a clean title. `2026-09-25-ship-combat.png` shows as "Ship combat, Sep 25, 2026". Use dashes, not spaces. PNG, JPG, GIF and WebP all work.

## Posting on the BYOND hub

Click **Copy hub HTML** under any screenshot and paste it into your post. Each image links to your Steam page, so every screenshot doubles as a wishlist button. The snippet uses `width="640"`. Change `embedWidth` in the config if you want a different size, and export screenshots at a sensible size (1280 or 1920 wide) so the page loads fast.

## Notes

- The page lists screenshots through GitHub's public API, which allows 60 requests an hour per visitor. The list is cached for two minutes, so normal browsing never gets close.
- To preview locally (`python -m http.server` in this folder), fill in `owner` and `repo` in the config. Do the same if you ever put the site on a custom domain.
- `.nojekyll` tells GitHub Pages to serve the files as they are. Keep it.
