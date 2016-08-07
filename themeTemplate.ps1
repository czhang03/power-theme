###########################################################################
# setting for you Write-VCSStatus
###########################################################################
# below is the default setting for git prompt, you can make you own
# see: https://github.com/dahlbyk/posh-git/blob/master/GitPrompt.ps1

$global:GitPromptSettings.DefaultForegroundColor                       = $Host.UI.RawUI.ForegroundColor

$global:GitPromptSettings.BeforeText                                  = ' ['
$global:GitPromptSettings.BeforeForegroundColor                       = [ConsoleColor]::Yellow
$global:GitPromptSettings.BeforeBackgroundColor                       = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.DelimText                                   = ' |'
$global:GitPromptSettings.DelimForegroundColor                        = [ConsoleColor]::Yellow
$global:GitPromptSettings.DelimBackgroundColor                        = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.AfterText                                   = ']'
$global:GitPromptSettings.AfterForegroundColor                        = [ConsoleColor]::Yellow
$global:GitPromptSettings.AfterBackgroundColor                        = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.FileAddedText                               = '+'
$global:GitPromptSettings.FileModifiedText                            = '~'
$global:GitPromptSettings.FileRemovedText                             = '-'
$global:GitPromptSettings.FileConflictedText                          = '!'

$global:GitPromptSettings.LocalDefaultStatusSymbol                    = $null
$global:GitPromptSettings.LocalDefaultStatusForegroundColor           = [ConsoleColor]::DarkGreen
$global:GitPromptSettings.LocalDefaultStatusForegroundBrightColor     = [ConsoleColor]::Green
$global:GitPromptSettings.LocalDefaultStatusBackgroundColor           = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.LocalWorkingStatusSymbol                    = '!'
$global:GitPromptSettings.LocalWorkingStatusForegroundColor           = [ConsoleColor]::DarkRed
$global:GitPromptSettings.LocalWorkingStatusForegroundBrightColor     = [ConsoleColor]::Red
$global:GitPromptSettings.LocalWorkingStatusBackgroundColor           = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.LocalStagedStatusSymbol                     = '~'
$global:GitPromptSettings.LocalStagedStatusForegroundColor            = [ConsoleColor]::Cyan
$global:GitPromptSettings.LocalStagedStatusBackgroundColor            = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BranchUntrackedSymbol                       = $null
$global:GitPromptSettings.BranchForegroundColor                       = [ConsoleColor]::Cyan
$global:GitPromptSettings.BranchBackgroundColor                       = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BranchIdenticalStatusToSymbol               = [char]0x2261 # Three horizontal lines
$global:GitPromptSettings.BranchIdenticalStatusToForegroundColor      = [ConsoleColor]::Cyan
$global:GitPromptSettings.BranchIdenticalStatusToBackgroundColor      = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BranchAheadStatusSymbol                     = [char]0x2191 # Up arrow
$global:GitPromptSettings.BranchAheadStatusForegroundColor            = [ConsoleColor]::Green
$global:GitPromptSettings.BranchAheadStatusBackgroundColor            = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BranchBehindStatusSymbol                    = [char]0x2193 # Down arrow
$global:GitPromptSettings.BranchBehindStatusForegroundColor           = [ConsoleColor]::Red
$global:GitPromptSettings.BranchBehindStatusBackgroundColor           = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BranchBehindAndAheadStatusSymbol            = [char]0x2195 # Up & Down arrow
$global:GitPromptSettings.BranchBehindAndAheadStatusForegroundColor   = [ConsoleColor]::Yellow
$global:GitPromptSettings.BranchBehindAndAheadStatusBackgroundColor   = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.BeforeIndexText                             = ""
$global:GitPromptSettings.BeforeIndexForegroundColor                  = [ConsoleColor]::DarkGreen
$global:GitPromptSettings.BeforeIndexForegroundBrightColor            = [ConsoleColor]::Green
$global:GitPromptSettings.BeforeIndexBackgroundColor                  = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.IndexForegroundColor                        = [ConsoleColor]::DarkGreen
$global:GitPromptSettings.IndexForegroundBrightColor                  = [ConsoleColor]::Green
$global:GitPromptSettings.IndexBackgroundColor                        = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.WorkingForegroundColor                      = [ConsoleColor]::DarkRed
$global:GitPromptSettings.WorkingForegroundBrightColor                = [ConsoleColor]::Red
$global:GitPromptSettings.WorkingBackgroundColor                      = $Host.UI.RawUI.BackgroundColor

$global:GitPromptSettings.EnableStashStatus                           = $false
$global:GitPromptSettings.BeforeStashText                             = ' ('
$global:GitPromptSettings.BeforeStashBackgroundColor                   = $Host.UI.RawUI.BackgroundColor
$global:GitPromptSettings.BeforeStashForegroundColor                   = [ConsoleColor]::Red
$global:GitPromptSettings.AfterStashText                              = ')'

$global:GitPromptSettings.AfterStashBackgroundColor                   = $Host.UI.RawUI.BackgroundColor
$global:GitPromptSettings.AfterStashForegroundColor                   = [ConsoleColor]::Red
$global:GitPromptSettings.StashBackgroundColor                        = $Host.UI.RawUI.BackgroundColor
$global:GitPromptSettings.StashForegroundColor                        = [ConsoleColor]::Red

$global:GitPromptSettings.ShowStatusWhenZero                          = $true

$global:GitPromptSettings.AutoRefreshIndex                            = $true

$global:GitPromptSettings.EnablePromptStatus                          = !$Global:GitMissing
$global:GitPromptSettings.EnableFileStatus                            = $true
$global:GitPromptSettings.RepositoriesInWhichToDisableFileStatus      = @( ) # Array of repository paths
$global:GitPromptSettings.DescribeStyle                               = ''

$global:GitPromptSettings.EnableWindowTitle                           = 'posh~git ~ '
$global:GitPromptSettings.Debug                                       = $false
$global:GitPromptSettings.BranchNameLimit                             = 0
$global:GitPromptSettings.TruncatedBranchSuffix                       = '...'




##############################################################
# begin of your prompt function
##############################################################

function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE

    #############################################
    # start of your theme
    #############################################


    # use the line below to get current time.
    # format parameter obey the same rule as the format parameter in get-Date
    $time = Get-ThemeDate -Format 'hh:mm:ss'


    # use the line below to get current working directory path. 
    # format parameter accepts 'concise', 'folder' and 'full', default is folder
    $path = Get-ThemePath -Format 'folder'

    

    #############################################
    # end of your theme
    #############################################

    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode

    # you can change this line if you want
    return '> '
}