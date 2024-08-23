::-----------::
::--LICENSE--::
::-----------::
::Copyright 2024 96985922+Damian-Lorente@users.noreply.github.com
::  
::Licensed under the Apache License, Version 2.0 (the "License");
::you may not use this file except in compliance with the License.
::You may obtain a copy of the License at
::    
::  http://www.apache.org/licenses/LICENSE-2.0
::    
::Unless required by applicable law or agreed to in writing, software
::distributed under the License is distributed on an "AS IS" BASIS,
::WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
::See the License for the specific language governing permissions and
::limitations under the License.



::---------------::
::--DESCRIPTION--::
::---------------::
::Program that uninstalls "Microsoft
::Edge" browser.



::-----------::
::--PROGRAM--::
::-----------::
::-1 Turn off screen output statemens from sentences-::
@echo off


rem -2 Encode screen output characters in UTF-8 code page- rem
chcp 65001 1>nul 2>nul


rem -3 Configure as local enviroment the enviroment of the declared and used variables in the program- rem
setlocal


rem -4 Welcoming- rem
echo.
echo.
echo Welcome to "%~nx0".
echo.


rem -5 Show beginning of data entry section- rem
echo.
echo ==========
echo DATA ENTRY
echo ==========


rem -6 Confirm "Microsoft Edge" uninstalling- rem
rem -6.1 Enter confirmation- rem
echo --CONFIRM "MICROSOFT EDGE" UNINSTALLING--
echo Do you want to uninstall Microsoft Edge
set /p "Program_Use_Confirmation=browser? <y/n> (default option n): "
echo.
rem -6.2 Check if user wants to exit the program- rem
if "%Program_Use_Confirmation%" neq "y" (
  goto LA_End_Program
)


rem -7 Check if the program is currently executed with administrator privileges- rem
set "Error_Level=%errorlevel%"
net file 1>nul 2>nul
if "%errorlevel%" neq "%Error_Level%" (
  echo.
  echo Error: Administrator privileges are required for the execution of this program.
  echo Please, execute this program again with those privileges.
  echo.
  goto LA_End_Program
)


rem -8 Show beginning of data processing section- rem
echo.
echo ===============
echo DATA PROCESSING
echo ===============


rem -9 Kill processes associated to "Microsoft Edge"- rem
echo --KILL "MICROSOFT EDGE" PROCESSES--
echo | set /p "=Killing all "Microsoft Edge" processes......"
taskkill /f /fi "imagename eq msedge.exe" 1>nul 2>nul
echo Completed
echo.


rem -10 Delete all Key Registries from "Windows Registry" which block "Microsoft Edge" uninstalling- rem
echo --DELETE KEY REGISTRIES WHICH BLOCK "MICROSOFT EDGE" UNINSTALLING--
echo | set /p "=Deleting Key Registries from "Windows Registry" which block "Microsoft Edge" uninstalling......"
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView" /f 1>nul 2>nul
echo Completed
echo.


rem -11 Delete directories which contain "Microsoft Edge"- rem
echo --Delete "MICROSOFT EDGE" DIRECTORIES--
echo | set /p "=Delete directories which contain the source of "Microsoft Edge"......"
rmdir "C:\Program Files (x86)\Microsoft\Edge" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeCore" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeUpdate" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeWebView" /q /s 1>nul 2>nul
echo Completed
echo.


rem -12 Show beginning of data output section- rem
echo.
echo ===========
echo DATA OUTPUT
echo ===========


rem -13 Inform that "Microsoft Edge" has been uninstalled- rem
echo --"MICROSOFT EDGE" UNINSTALLED--
echo The uninstalling of "Microsoft Edge" has been completed successfully.
echo.


rem -14 Reconfigure as normal the enviroment for the variables declared outside the program- rem
:LA_End_Program
endlocal


rem -15 Farewell and end the program- rem
echo.
echo End of the program "%~nx0".
set /p "=You can exit the program pressing Enter."
echo.