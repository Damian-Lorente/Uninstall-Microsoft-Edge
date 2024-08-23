::------------::
::--LICENCIA--::
::------------::
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
::--DESCRIPCION--::
::---------------::
::Programa que desinstala el navegador "Microsoft
::Edge".



::------------::
::--PROGRAMA--::
::------------::
::-1 Desactivar las salidas de datos por pantalla de las sentencias-::
@echo off


rem -2 Codificar los caracteres de salida por pantalla a la pagina de códigos de UTF-8- rem
chcp 65001 1>nul 2>nul


rem -3 Configurar como entorno local el entorno de las variables declaradas y usadas en el programa- rem
setlocal


rem -4 Bienvenida- rem
echo.
echo.
echo Bienvenid@ a "%~nx0".
echo.


rem -5 Mostrar inicio de sección de entrada de datos- rem
echo.
echo ================
echo ENTRADA DE DATOS
echo ================


rem -6 Confirmar la desinstalación de "Microsoft Edge"- rem
rem -6.1 Introducir confirmación- rem
echo --CONFIRMACIÓN DE DESINSTALACIÓN DE "MICROSOFT EDGE"--
echo ¿Quieres desinstalar el navegador Microsoft
set /p "Confirmacion_Uso_Programa=Edge? <s/n> (por defecto n): "
echo.
rem -6.2 Comprobar si se quiere salir del programa- rem
if "%Confirmacion_Uso_Programa%" neq "s" (
  goto E_Final_Programa
)


rem -7 Comprobar si se han obtenido permisos de administrador para ejecutar el programa- rem
set "Nivel_Error=%errorlevel%"
net file 1>nul 2>nul
if "%errorlevel%" neq "%Nivel_Error%" (
  echo.
  echo Error: Se requieren permisos de administrador para ejecutar este programa.
  echo Por favor, vuelve a ejecutarlo con dichos permisos.
  echo.
  goto E_Final_Programa
)


rem -8 Mostrar inicio de sección de procesamiento de datos- rem
echo.
echo ======================
echo PROCESAMIENTO DE DATOS
echo ======================


rem -9 Finalizar los procesos asociados a "Microsoft Edge"- rem
echo --FINALIZAR PROCESOS ASOCIADOS A "MICROSOFT EDGE"--
echo | set /p "=Finalizando procesos asociados a "Microsoft Edge"......"
taskkill /f /fi "imagename eq msedge.exe" 1>nul 2>nul
echo Completado
echo.


rem -10 Eliminar Claves de Registro del "Registro de Windows" que bloquean la desinstalacion de "Microsoft Edge"- rem
echo --ELIMINAR REGISTROS QUE BLOQUEAN LA DESINSTALACION DE "MICROSOFT EDGE"--
echo | set /p "=Eliminando las Claves de Registro del "Registro de Windows" que impiden desinstalar "Microsoft Edge"......"
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f 1>nul 2>nul
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView" /f 1>nul 2>nul
echo Completado
echo.


rem -11 Eliminar directorios que contienen a "Microsoft Edge"- rem
echo --ELIMINAR DIRECTORIOS QUE CONTIENEN A "MICROSOFT EDGE"--
echo | set /p "=Eliminando los directorios que contienen a "Microsoft Edge"......"
rmdir "C:\Program Files (x86)\Microsoft\Edge" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeCore" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeUpdate" /q /s 1>nul 2>nul
rmdir "C:\Program Files (x86)\Microsoft\EdgeWebView" /q /s 1>nul 2>nul
echo Completado
echo.


rem -12 Mostrar inicio de sección de salida de datos- rem
echo.
echo ===============
echo SALIDA DE DATOS
echo ===============


rem -13 Informar de que "Microsoft Edge" ha sido desinstalado- rem
echo --"MICROSOFT EDGE" DESINSTALADO--
echo Se ha desinstalado correctamente el navegador "Microsoft Edge".
echo.


rem -14 Reconfigurar el entorno normal para las variables declaradas fuera del programa- rem
:E_Final_Programa
endlocal


rem -15 Despedida y finalizar programa- rem
echo.
echo Fin del programa "%~nx0".
set /p "=Puedes salir completamente pulsando Enter."
echo.