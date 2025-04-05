@echo off
setlocal enabledelayedexpansion

set MONOREPO_NAME=%~1

echo Creating monorepo structure for %MONOREPO_NAME%...

REM Create monorepo directory structure
mkdir %MONOREPO_NAME%
cd %MONOREPO_NAME%
mkdir packages
mkdir apps
mkdir docs
mkdir config

REM Create root configuration files
echo Creating root configuration files...
copy "%~dp0\templates\monorepo\package.json" "package.json"
copy "%~dp0\templates\monorepo\lerna.json" "lerna.json"
copy "%~dp0\templates\monorepo\.gitignore" ".gitignore"
copy "%~dp0\templates\monorepo\README.md" "README.md"

REM Create example packages
echo Creating example packages...
cd packages
mkdir common-lib
cd common-lib
copy "%~dp0\templates\monorepo\packages\common-lib\package.json" "package.json"
mkdir src
cd ..
cd ..

REM Create example apps
echo Creating example apps...
cd apps
mkdir web-app
cd web-app
copy "%~dp0\templates\monorepo\apps\web-app\package.json" "package.json"
mkdir src
cd ..
cd ..

echo Monorepo structure created successfully!
