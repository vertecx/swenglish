Param (
    [Parameter(Mandatory=$true)]
    [string]$Path,
    [Parameter(Mandatory=$true)]
    [string]$Certificate
)

# signtool claims setup.exe is not a valid Win32 application so don't try to sign it.
Get-ChildItem -Path $Path -Recurse -Include *.dll,*.msi  | ForEach-Object {
    & signtool.exe sign /fd SHA256 /n "$Certificate" /tr "http://tsa.startssl.com/rfc3161" $_.FullName
}
