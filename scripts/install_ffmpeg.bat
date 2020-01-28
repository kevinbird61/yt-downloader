@echo OFF
:: download ffmpeg
if exist %USERPROFILE%\Desktop\ffmpeg-4.2.2-win64-static.zip (
    :: do nothing
    echo [Dependencies] ffmpeg zip file existed
) else (
    echo [Dependencies] Downloading ffmpeg ...
    powershell -command "(new-object System.Net.WebClient).DownloadFile('https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-4.2.2-win64-static.zip','%USERPROFILE%\Desktop\ffmpeg-4.2.2-win64-static.zip')"
    echo [Dependencies] Downloaded ffmpeg
)

if exist C:\ffmpeg (
    :: exist, do nothing
    echo [Dependencies] C:\ffmpeg\ffmpeg-4.2.2-win64-static\bin\ffmpeg existed
) else (
    echo [Dependencies] unzip ffmpeg
    :: unzip 
    powershell Expand-Archive '%USERPROFILE%\Desktop\ffmpeg-4.2.2-win64-static.zip' -DestinationPath 'C:\ffmpeg'
)

:: Caution: This action require Admin privilege
echo ;%PATH%; | find /C /I ";<string>;" > tmpFile 
set /p path_existence= < tmpFile 
del tmpFile 

if path_existence == 0 (
    :: not found 
    echo [Dependencies] add PATH 
    :: set PATH=C:\ffmpeg\ffmpeg-4.2.2-win64-static\bin;%PATH%
    setx /M PATH "%PATH%;C:\ffmpeg\ffmpeg-4.2.2-win64-static\bin"
) else (
    :: found 
    echo [Dependencies] already add to PATH 
)


echo [Dependencies] ffmpeg Dependencies completed! You can use it now
PAUSE