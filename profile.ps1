$conda_path = "C:\Users\KacperKrylowicz\miniconda3\Scripts\conda.exe"

If (Test-Path $conda_path) {
    (& $conda_path "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}

$commands = "grep", "ls", "vim"

$WslDefaultParameterValues = @{}
$WslDefaultParameterValues["grep"] = "-E"
$WslDefaultParameterValues["ls"] = "-AFh --group-directories-first" 

$commands | ForEach-Object { Invoke-Expression @"
Remove-Item -Path Alias\$_ -Force -ErrorAction Ignore
function global:$_() {
    for (`$i = 0; `$i -lt `$args.Count; `$i++) {
        if (Split-Path `$args[`$i] -IsAbsolute -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (wsl.exe wslpath (`$args[`$i] -replace "\\", "/"))
        } elseif (Test-Path `$args[`$i] -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (`$args[`$i] -replace "\\", "/")
        }
    }

    `$defaultArgs = ((`$WslDefaultParameterValues.$_ -split ' '), "")[`$WslDefaultParameterValues.Disabled -eq `$true]
    if (`$input.MoveNext()) {
        `$input.Reset()
        `$input | wsl.exe $_ `$defaultArgs (`$args -split ' ')
    } else {
        wsl.exe $_ `$defaultArgs (`$args -split ' ')
    }
}
"@
}

function get-gitlog { & git log $args }
function get-gitadd { & git add $args }
function get-gitcommit { & git commit $args }
function get-gitpush { & git push $args }
function get-gitstatus { & git status $args }
function get-gitdiff { & git diff $args }
function get-gitbranch { & git branch $args }

Set-Alias -Name "gl" -Value get-gitlog -Force -Option AllScope
Set-Alias -Name "ga" -Value get-gitadd -Force -Option AllScope
Set-Alias -Name "gm" -Value get-gitcommit -Force -Option AllScope
Set-Alias -Name "gp" -Value get-gitpush -Force -Option AllScope
Set-Alias -Name "gs" -Value get-gitstatus -Force -Option AllScope
Set-Alias -Name "gd" -Value get-gitdiff -Force -Option AllScope
Set-Alias -Name "gb" -Value get-gitbranch -Force -Option AllScope