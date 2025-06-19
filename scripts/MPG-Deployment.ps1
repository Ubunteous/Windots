@echo off
chcp 65001
setlocal enabledelayedexpansion

set PROJECT="MonPetitGit\MonPetitGit.csproj"
set SOLUTION=MyGreatHelper.sln
set CONFIGURATION=Release
set PLATFORMS="Any CPU"
set PUBLISH_DIR=PublishOutput
set TARGET_DIR="C:\Users\Jean\OneDrive - Mag audit\Documents - Super Développeurs EasySRM\Work\MonPetitGitV2\"
set VERSION_FILE=version.txt

rem Increment the version
echo Incrementing version...
for /f "tokens=1-3 delims=." %%a in (%VERSION_FILE%) do (
    set /a MAJOR=%%a
    set /a MINOR=%%b
    set /a PATCH=%%c+1
)
set NEW_VERSION=%MAJOR%.%MINOR%.%PATCH%
echo New Version: %NEW_VERSION%
echo %NEW_VERSION% > %VERSION_FILE%

rem Build the project
echo Building the project...
msbuild %PROJECT% /t:Build /p:Configuration=%CONFIGURATION% /p:Version=%NEW_VERSION% /v:minimal
if %ERRORLEVEL% neq 0 (
    echo Build failed. Exiting...
    exit /b %ERRORLEVEL%
)

rem Publish the project
echo Build succeeded! Publishing the application...
msbuild %PROJECT% /t:Publish /p:Configuration=%CONFIGURATION% /p:PublishDir=%PUBLISH_DIR% /p:Version=%NEW_VERSION% /v:minimal
if %ERRORLEVEL% neq 0 (
    echo Publish failed. Exiting...
    exit /b %ERRORLEVEL%
)

:: robocopy "C:\Users\Jean\Mymy\MonPetitGit\MonPetitGit\PublishOutput" "C:\Users\Jean\Mag audit\Site d'équipe - Développement informatique\Benjamin" /move /e
move /y "C:\Users\Jean\Mymy\MonPetitGit\MonPetitGit\PublishOutput\*" "C:\Users\Jean\OneDrive - Mag audit\Documents - Super Développeurs EasySRM\Work\MonPetitGitV2\"
if %ERRORLEVEL% geq 8 (
    echo Failed to move files. Exiting...
    exit /b %ERRORLEVEL%
)


echo Application published and moved successfully to %TARGET_DIR% with version %NEW_VERSION%.
exit /b 0
