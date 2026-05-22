<#
  One-shot publisher for Claude Persona Studio -> GitHub.

  DO THIS ONCE FIRST (in your browser):
    1. Go to  https://github.com/new
    2. Repository name:  claude-persona-studio
    3. Choose Public.
    4. Leave "Add a README / .gitignore / license" all UNCHECKED.
    5. Click "Create repository".

  Then run this from the project folder:
    powershell -ExecutionPolicy Bypass -File .\push-to-github.ps1

  It uses the GitHub credentials already cached on your machine from when you
  pushed your other fleet repos, so it shouldn't ask you to log in. If it does,
  just approve the browser prompt once.
#>

$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/JackBhanded/claude-persona-studio.git"
$version = "v0.4.0"
Set-Location $PSScriptRoot   # always operate on THIS folder - no wrong-folder surprises

function RunGit([string[]]$gitArgs) {
    Write-Host ("  > git " + ($gitArgs -join ' ')) -ForegroundColor DarkGray
    & git @gitArgs
    if ($LASTEXITCODE -ne 0) { throw ("git " + ($gitArgs -join ' ') + " failed (exit $LASTEXITCODE)") }
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "  git isn't installed / on PATH. Get it from https://git-scm.com/download/win then retry." -ForegroundColor Red
    exit 1
}
if (-not (Test-Path ".claude-plugin/marketplace.json")) {
    Write-Host "  Can't find .claude-plugin/marketplace.json here - run this from the pack root folder." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "  Publishing Claude Persona Studio to $repoUrl" -ForegroundColor Cyan
Write-Host ""

# 1. Initialise the repo if it isn't one yet
if (-not (Test-Path ".git")) {
    RunGit @('init')
    RunGit @('branch', '-M', 'main')
}

# 2. Stage everything (.gitignore keeps LAUNCH.md + local junk out)
RunGit @('add', '-A')

# 3. Commit (don't fail if there's nothing new to commit)
& git commit -m "Claude Persona Studio $version - 22 one-click, session-scoped personas. Always Claude inside."
if ($LASTEXITCODE -ne 0) {
    Write-Host "  (nothing new to commit - continuing)" -ForegroundColor DarkGray
}

# 4. Point at the GitHub repo
$remotes = (& git remote)
if ($remotes -contains "origin") {
    RunGit @('remote', 'set-url', 'origin', $repoUrl)
} else {
    RunGit @('remote', 'add', 'origin', $repoUrl)
}

# 5. Push the code
RunGit @('push', '-u', 'origin', 'main')

# 6. Tag the release and push the tag (only create the tag if it's missing,
#    so re-running this script doesn't error on an existing tag)
$haveTag = & git tag --list $version
if (-not $haveTag) {
    RunGit @('tag', $version)
} else {
    Write-Host "  (tag $version already exists - leaving it as is)" -ForegroundColor DarkGray
}
RunGit @('push', 'origin', $version)

Write-Host ""
Write-Host "  Done! Live at https://github.com/JackBhanded/claude-persona-studio" -ForegroundColor Green
Write-Host "  Next: on github.com, go to Releases -> Draft a new release -> pick tag $version -> Publish (paste notes from LAUNCH.md)." -ForegroundColor DarkGray
Write-Host "  Install command for others:  /plugin marketplace add JackBhanded/claude-persona-studio" -ForegroundColor DarkGray
Write-Host ""
