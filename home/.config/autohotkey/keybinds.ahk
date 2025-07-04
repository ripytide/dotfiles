!s::
{
    if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
        WinActivate
    else
        Run "wt.exe"
}
!h::
{
    if WinExist("ahk_class MozillaWindowClass")
        WinActivate
    else
        Run "floorp.exe"
}
!t::
{
    if WinExist("ahk_exe ms-teams.exe")
        WinActivate
    else
        Run "ms-teams.exe"
}
