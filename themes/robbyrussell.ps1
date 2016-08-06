function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE

    $currentFolder = Get-ThemePath

    Write-Host $currentFolder -NoNewline -ForegroundColor Cyan
    Write-VcsStatus
    Write-Host ' ' -NoNewline
    Write-Host '→' -NoNewline -ForegroundColor Magenta

    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode
    return ' '
}
