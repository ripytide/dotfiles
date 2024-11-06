Function ls-function {eza --long --group --icons --group-directories-first --git -s modified $args}
Function la-function {eza --all --long --group --icons --group-directories-first --git -s modified $args}
Function tree-function {eza --tree --git-ignore --icons $args}
Set-Alias -Name ls -Value ls-function -Option AllScope
Set-Alias -Name la -Value la-function -Option AllScope
Set-Alias -Name tree -Value tree-function -Option AllScope

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell --cmd n | Out-String) })

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionViewStyle List
Set-PSReadLineOption -ShowToolTips:$false
Set-PSReadLineKeyHandler -Chord Ctrl+j -Function NextSuggestion
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function PreviousSuggestion
Remove-PSReadLineKeyHandler -Chord Ctrl+n
Remove-PSReadLineKeyHandler -Chord Ctrl+p

# Install-PSResource -Name PSReadLine
# Import-Module -Name CompletionPredictor

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
