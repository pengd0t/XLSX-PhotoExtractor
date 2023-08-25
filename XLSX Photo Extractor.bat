@echo off

:start
:: Save current folder script is in
set currentfolder="%cd%"

:: Prompt user for input, what file to work with?
echo.
SET /p filename=Enter the name of the file to extract pictures from (without the extension):

:: Check for directory and create it if not found. 
if not exist "c:\setupfiles\temp\" mkdir "c:\setupfiles\temp\"


:: Create copy of file
echo.
echo Creating temporary copy of file.
	xcopy "%filename%.xlsx" "c:\setupfiles\temp\%filename%\" /i
	xcopy 7z.* "c:\setupfiles\temp\%filename%\" /i > nul
cd c:\setupfiles\temp\%filename%\ > nul


:: Processing copy of file
echo. 
echo Converting XLSX...
	ren "%filename%.xlsx" "%filename%.zip"
	7z x "%filename%.zip" -o"c:\setupfiles\temp\%filename%\files\" > nul


:: Copy extracted photos to different folder
echo.
echo Copying photos to XLSX-Photo-Extractor folder...
	cd c:\setupfiles\temp\%filename%\files\xl\
	xcopy "media\" "c:\setupfiles\temp\XLSX-Photo-Extractor\%filename%\" /i /y

:: cleanup
cd c:\setupfiles\temp\
rmdir "c:\setupfiles\temp\%filename%\" /s /q

:: Return to home directory of script
cd "%currentfolder%"

echo.
echo Done.  New filename?
echo.


GOTO :start
