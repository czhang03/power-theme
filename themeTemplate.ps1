function global:prompt {
    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $RealExitCode = $LASTEXITCODE

    #############################################
    # start of your theme
    #############################################




    #############################################
    # end of your theme
    #############################################

    # do not remove this line
    # this line is to make sure the prompt function do not interfer with your exit code
    $Global:LASTEXITCODE = $RealExitCode

    # you can change this line if you want
    return ' '
}