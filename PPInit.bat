:: Git Environment
@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the absolute path to the current directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0") do @set git_install_root=%%~fI
@set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%git_install_root%\cmd;%PATH%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set PLINK_PROTOCOL=ssh
@if not defined TERM set TERM=msys

@del "Project-Pages-v1.2.0.exe"

:: Install Curl
@curl-7.43.0-win64.msi
@del "curl-7.43.0-win64.msi"

:: Get Parameters for Repo Initialization
@echo Create GitHub Repository 
@set /p User=User:%=%
@set /p Repo=Repo:%=%
@timeout /t -1

:: Create JSON for API
@echo {"name":"%Repo%","description": "New Project-Pages Instance","homepage": "https://%User%.github.io/%Repo%/"} > create.json

:: Create Repo Using Curl
@curl -u %User% https://api.github.com/user/repos -d @create.json
@timeout /t -1

:: Create _config.yml
@set /p Title=Blog Title:%=%
@set /p Desc=Blog Description (Sub-Title):%=%
@set /p Email=E-mail Address:%=%

@echo # Site settings > _config.yml
@echo title: %Title% >> _config.yml
@echo header-img: img/home-bg.jpg >> _config.yml
@echo email: %Email% >> _config.yml
@echo description: "%Desc%" >> _config.yml
@echo baseurl: "/%Repo%" >> _config.yml
@echo url: "http://%User%.github.io" >> _config.yml
@echo github_username:  %User% >> _config.yml
@echo project_repository: %Repo% >> _config.yml
@echo disqus_shortname: project-pages >> _config.yml
@echo # Build settings >> _config.yml
@echo # Don't change these variables >> _config.yml
@echo markdown: kramdown >> _config.yml
@echo highlighter: pygments >> _config.yml
@echo permalink: pretty >> _config.yml
@echo paginate: 5 >> _config.yml
@echo exclude: ["less","node_modules","Gruntfile.js","package.json","README.md"] >> _config.yml

::  Upload Repo
git init
git add .
git commit -m "Initialize Project-Pages Instance"
git checkout -b gh-pages
git remote add origin https://github.com/%User%/%Repo%.git
git push -u origin gh-pages

@echo Wait 30 Seconds While GitHub Builds Your Page
@timeout 30 /nobreak

start "" https://%User%.github.io/%Repo%/