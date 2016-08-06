$global:THEME = @{
    'DateTimeFormat' = ''
    'PathFormat' = ''
}

function Enable-Theme {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet("pure", "robbyrussell", "amuse", IgnoreCase=$true)]
        [string] $ThemeName
    )
    $ThemeName = $ThemeName.ToLower(); # all the theme filename will be lower case

    Invoke-Expression ". $PSScriptRoot\$ThemeName.ps1"  # load the theme
}

function New-Theme  {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string] $ThemeName
    )

    $ThemeName = $ThemeName.ToLower();  # all the theme filename will be lower case
    $ThemeFileFullName = Join-Path -Path $PSScriptRoot -ChildPath "$ThemeName.ps1"  # get the full path of the theme file

    # validate theme name
    if (Test-Path $ThemeFileFullName) {
        Write-Error 'Theme already exists, please give another name' 
        return     
    }

    # create theme from template
    Copy-Item -Path .\themeTemplate.ps1 -Destination $ThemeFileFullName

    # log message
    Write-Host 'theme file successfully created in:' -ForegroundColor Green
    Write-Host $ThemeFileFullName -ForegroundColor Yellow
}

function Get-ThemeDate  {
    param (
        [Parameter(Mandatory=$false)]
        [string] $Format
    )


    if ($THEME.DateTimeFormat) {  # if user's setting exits
        $DateStr = Get-Date -Format $THEME.DateTimeFormat
        return $DateStr
    }
    elseif ($Format) {  # if there is no user's setting, use developer setting
        $DateStr = Get-Date -Format $Format
        return $DateStr
    }
    else {  # if all none, use default Get-Date
        $DateStr = Get-Date
        return $DateStr
    }

}


function Get-ThemePath {
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('concise', 'full', 'folder')]
        [string] $Format = 'folder'
    )
    
    if ($THEME.PathFormat) {  # user setting exist
        $pathStr = Get-ThemePathHelper -Format $THEME.PathFormat  # use the user setting
        return $pathStr
    }
    elseif ($Format) {
        $pathStr = Get-ThemePathHelper -Format $Format  # use the developer setting
        return $pathStr
    }

}

function Get-ThemePathHelper ($Format) {

    # concise path is a fish-like path format
    # it only display the first letter in each forlder, besides the current forlder
    # C:\path\to\current\folder will be displayed as C:\p\t\c\folder

    if ($Format -eq 'concise') {
        # split the path into a list
        $PathList = $PWD -split '\\'

        # only take the first letter in each folder name, except the Drive Letter and current folder
        $concisePathList = @($PathList[0])  # put the Drive Letter into the pathList
        foreach ($Path in $PathList[1..$($PathList.Length-2)]) {
            $concisePathList += $Path[0]
        }
        $concisePathList += $PathList[-1]
        
        # reconstruct the path string
        $concisePath = $concisePathList -join '\'

        return $concisePath
    }

    # only display the current folder
    elseif ($Format -eq 'folder') {
        $folderName = Split-Path $PWD -leaf
        return $folderName
    }

    # display the full path
    elseif ($Format -eq 'full') {
        return $PWD
    }

    # error
    else {
        Write-Error 'the path format you specify is not valid'
        return
    }
}