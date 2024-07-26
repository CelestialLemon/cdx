@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: cdx substring
    goto :eof
)

set "target="
for /d %%i in (*) do (
    echo %%i | find /i "%1" >nul
    if !errorlevel! == 0 (
        set "target=%%i"
        goto :found
    )
)

:found
if defined target (
    endlocal
    cd "%target%"
) else (
    echo No matching directory found for "%1".
)

endlocal
