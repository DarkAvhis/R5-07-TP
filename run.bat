@echo off
setlocal

rem Compile et execute un fichier Java.
rem Usage : run.bat <fichier ou classe> [arguments...]
rem Exemples : run.bat Q3 5      run.bat Q4.java 4

if "%~1"=="" (
    echo Usage : %~nx0 ^<fichier.java ^| nom de classe^> [arguments...]
    exit /b 1
)

set "NOM=%~n1"
set "SOURCE=%~dpn1.java"
set "ARGUMENTS="
for /f "tokens=1,* delims= " %%a in ("%*") do set "ARGUMENTS=%%b"

if not exist "%SOURCE%" (
    echo Erreur : fichier introuvable : %SOURCE%
    exit /b 1
)

set "DOSSIER_SORTIE=%TEMP%\run_java_%RANDOM%"
mkdir "%DOSSIER_SORTIE%"

javac -d "%DOSSIER_SORTIE%" "%SOURCE%"
if errorlevel 1 (
    echo Erreur : la compilation de %SOURCE% a echoue
    rmdir /s /q "%DOSSIER_SORTIE%"
    exit /b 1
)

java -cp "%DOSSIER_SORTIE%" %NOM% %ARGUMENTS%
set "CODE=%ERRORLEVEL%"

rmdir /s /q "%DOSSIER_SORTIE%"
exit /b %CODE%
