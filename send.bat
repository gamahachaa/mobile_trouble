%1

@echo off

set DEV=0
echo "START"
if %DEV%==1 (
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :dead
	if "%1"=="release" goto :publication
) ELSE ( 
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :publication
	if "%1"=="release" goto :publication
)


:publication

rem PREPARE DATESTAMP ------------------------------------------------------------------------------------------------------------------------------
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%%MM%%DD%_%HH%%Min%%Sec%"
rem ------------------ DEFINE FILE NAMES ------------------------------------------------------------------------
:: COPY TO SUB
set serverFolderName=mobile_trouble
set mainScript=mobile_trouble
rem -------------------------------------------------------------------------------------------------------------
set oldScriptName=%mainScript%.js
set newScriptName=%mainScript%_%fullstamp%.js

set newScriptNameMin=%mainScript%_%fullstamp%.min.js
set newMapName=%mainScript%_%fullstamp%.js.map
rem PREPARE and CLEAR OLD FILE removal  -------------------------------------------------------------------------
:: COPY TO SUB
set BINDIR=%cd%\export\html5\bin\

set ASSETSDIR=%BINDIR%\assets\
set FILESDELETE=%BINDIR%%mainScript%_20*

rem --------- ^ is the escape char for batch !!! --------------
set "HOWL_TARGET=^<link rel="shortcut icon" type="image/png" href="./favicon.png"^>"
set "HOWL=^<script type="text/javascript" src="./howl.js"^>^</script^>
rem DELETE  ------------------------------------------------------------------------------------------------------------------------------
rem if "%1"=="debug" goto :next
del /F %FILESDELETE%
:next

rem REPLACE META LINK TO JS FILES  ------------------------------------------------------------------------------------------------------------------------------
powershell -Command "Rename-Item -Path "%BINDIR%/index.html" -NewName tmp.html"
powershell -Command "Rename-Item -Path "%BINDIR%/index_howl.html" -NewName index.html"
powershell -Command "Rename-Item -Path "%BINDIR%/tmp.html" -NewName index_howl.html"


rem powershell -Command "(gc %BINDIR%/index.html) -replace '%HOWL_TARGET%', '%HOWL_TARGET%\n%HOWL%' | Out-File -encoding UTF8 %BINDIR%/index.html"


echo "DEV=%DEV%"
if %DEV%==1 (
	if "%1"=="release" goto :minify
	powershell -Command "(gc %BINDIR%/index.html) -replace './%oldScriptName%', './%newScriptName%' | Out-File -encoding UTF8 %BINDIR%/index.html"
	if "%1"=="debug" goto :NOTMINIFY
) ELSE (
	if "%1"=="release" goto :minify
	if "%1"=="debug" goto :EXPORT
)

:minify
powershell -Command "(gc %BINDIR%/index.html) -replace './%oldScriptName%', './%newScriptNameMin%' | Out-File -encoding UTF8 %BINDIR%/index.html"
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.min.js" -NewName %newScriptNameMin%"
goto :EXPORT

:NOTMINIFY

powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.js" -NewName %newScriptName%"
powershell -Command "Rename-Item -Path "%BINDIR%/%mainScript%.js.map" -NewName %newMapName%"

:EXPORT

if %DEV%==1 (
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :dead
	if "%1"=="release" goto :test
) ELSE ( 
	if "%1"=="" goto :dead
	if "%1"=="debug" goto :test
	if "%1"=="release" goto :release
)

rem echo %1

:test
call send_test.bat "%1 %DEV% %BINDIR% %serverFolderName%"

goto :completed

:release
rem PUSH to PROD SERVER 
call send_prod.bat "%1 %DEV% %BINDIR% %serverFolderName%"

rem robocopy export\html5\bin "C:\xampp\htdocs\localhost" * /E

goto :completed

:end

rem echo "JUST DEBUGGING"

:dead



echo "NO DIRECTIVES"

:completed

echo "completed "%1