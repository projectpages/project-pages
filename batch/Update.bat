::  Update to Repo
git add -p
git commit -m "Update Project-Pages"

git pull origin gh-pages
git push -u origin gh-pages

@echo Wait 30 Seconds While GitHub Builds Your Page
@timeout 30 /nobreak

start "" https://%User%.github.io/%Repo%/