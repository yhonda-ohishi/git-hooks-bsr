# Git hooksをセットアップするスクリプト (Windows PowerShell版)

$HooksDir = $PSScriptRoot
$GitHooksDir = Join-Path (Split-Path -Parent $PSScriptRoot) ".git\hooks"

Write-Host "🔧 Setting up Git hooks..." -ForegroundColor Cyan

# hooks/ディレクトリの全てのファイルを.git/hooks/にコピー
Get-ChildItem -Path $HooksDir -File | ForEach-Object {
    $hookName = $_.Name
    # セットアップスクリプト自身とREADMEはスキップ
    if ($hookName -notin @("setup-hooks.sh", "setup-hooks.ps1", "README.md")) {
        Write-Host "  📝 Installing $hookName" -ForegroundColor Yellow
        Copy-Item $_.FullName -Destination (Join-Path $GitHooksDir $hookName) -Force
    }
}

Write-Host "✅ Git hooks setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed hooks:" -ForegroundColor Cyan
Get-ChildItem -Path $GitHooksDir -File | Where-Object { $_.Name -notlike "*.sample" } | Select-Object -ExpandProperty Name
