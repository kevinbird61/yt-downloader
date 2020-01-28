@ECHO OFF

echo "[CAUTION] Require ffmpeg dependencies to run the following steps."
:: PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"
echo "[SETTING] output dir = %USERPROFILE%\Music"

:START
set /p URL=Input youtube URL: 
.\bin\youtube-dl.exe -x --audio-format mp3 -o "%USERPROFILE%\Music\%%(title)s.%%(ext)s" %URL%

set /p LOOP=Do you want to download another URL(Y/N)? 
if %LOOP% == "Y" OR %LOOP% == "y" (
    echo ""
    GOTO START
) else (
    GOTO END
)

:END 
echo "Finish all downloads"