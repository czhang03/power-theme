function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE

    $Path = Get-ThemePath -Format "full"
    $time = Get-ThemeDate -Format "hh:mm:ss"

    Write-Host
    Write-Host $Path -NoNewline -ForegroundColor Green
    Write-VcsStatus
    Write-Host ' 🕒 ' -NoNewline
    Write-Host $time -ForegroundColor Magenta

    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode
    return '> '
}