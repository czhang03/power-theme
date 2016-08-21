function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE


    $currentfolder = Get-ThemePath -Format 'folder'

    # newline
    Write-Host 

    # first line
    Write-Host ' ' -NoNewLine
    Write-Host $currentfolder -NoNewLine -ForegroundColor Blue
    Write-Host ' ' -NoNewLine
    Write-VcsStatus
    Write-Host ' '

    # second line
    Write-Host ' ' -NoNewLine
    if ($RealExitCode -ne 0) {
        Write-Host '〉' -NoNewline -ForegroundColor Red
    }
    else {
        Write-Host '〉' -NoNewline -ForegroundColor Magenta
    }
    
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode
    return ' '
}