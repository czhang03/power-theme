function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE

    #############################################
    # start of your theme
    #############################################

    $path = Get-ThemePath -Format 'folder'
    $Date = Get-ThemeDate
        
    Write-Host
    Write-Host "# " -NoNewline -ForegroundColor Blue
    Write-Host $env:USERNAME -NoNewline -ForegroundColor Cyan
    Write-Host " in " -NoNewline
    Write-Host "$path " -NoNewline -ForegroundColor Green
    Write-VcsStatus
    Write-Host " $Date" 
    Write-Host ">" -NoNewline -ForegroundColor Magenta


    #############################################
    # end of your theme
    #############################################

    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode

    # you can change this line if you want
    return ' '
}