@echo off
more > %CLIPSS_FILE%

if "%CLIPSS_PORT%" equ "" goto END
start /min curl http://localhost:%CLIPSS_PORT%/push_rsv > NUL
:END
