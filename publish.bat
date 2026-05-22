@echo off
REM One-shot publisher for Claude Persona Studio -> GitHub.
REM
REM DO THIS ONCE FIRST (in your browser):
REM   1. Go to https://github.com/new
REM   2. Repository name: claude-persona-studio
REM   3. Choose Public; leave README/.gitignore/license UNCHECKED.
REM   4. Create repository.
REM
REM Then just double-click this file or run:  publish.bat
REM It uses your cached GitHub credentials, so it shouldn't ask you to log in.

setlocal
cd /d "%~dp0"

set "REPOURL=https://github.com/JackBhanded/claude-persona-studio.git"
set "VERSION=v0.4.0"

git --version >nul 2>&1
if errorlevel 1 (
  echo git isn't installed / on PATH. Get it from https://git-scm.com/download/win then retry.
  exit /b 1
)

echo.
echo Publishing Claude Persona Studio to %REPOURL%
echo.

if not exist ".git" (
  git init
  git branch -M main
)

git add -A
git commit -m "Claude Persona Studio %VERSION% - 22 one-click, session-scoped personas. Always Claude inside."

git remote | findstr /x "origin" >nul
if errorlevel 1 (
  git remote add origin %REPOURL%
) else (
  git remote set-url origin %REPOURL%
)

git push -u origin main

git tag --list %VERSION% | findstr /x "%VERSION%" >nul
if errorlevel 1 (
  git tag %VERSION%
)
git push origin %VERSION%

echo.
echo Done. Live at https://github.com/JackBhanded/claude-persona-studio
echo Others install with:
echo   /plugin marketplace add JackBhanded/claude-persona-studio
echo   /plugin install claude-persona-pack@persona-studio
echo.

endlocal
