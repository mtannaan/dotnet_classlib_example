$MyInvocation.MyCommand.Path
    | Split-Path -Parent
    | Set-Location

Get-ChildItem
    | Where-Object {-not $_.Name.EndsWith('.ps1') -and -not $_.Name.EndsWith('.md')}
    | ForEach-Object {Remove-Item $_ -Recurse}
