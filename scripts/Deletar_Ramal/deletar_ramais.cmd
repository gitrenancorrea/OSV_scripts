@echo off
rem if "%1" == "" (goto :PARAMETRO) else (goto :INICIO)
rem :INICIO
rem set arquivo=%1
echo FILE VERSION:11.00.01:MP2> deletar.txt
FOR /F "tokens=1-20 delims=;" %%a IN (ramais.csv) DO (
echo Deletando o ramal %%k
echo RS>> deletar.txt
echo ,SUBSCRIBERDN="%%k">> deletar.txt
echo ;;>> deletar.txt
setlocal enabledelayedexpansion
set "z=%%k"
set "officecode=!z:~0,8!"
set "ramal=!z:~-4!"
echo RemoveHomeDn>> deletar.txt
echo ,OfficeCode="!officecode!">> deletar.txt
echo ,StartCode="!ramal!">> deletar.txt
echo ;; >> deletar.txt
endlocal
)
exit

:PARAMETRO
echo.
echo  ##################################
echo  #                                #
echo  #  Arquivo .csv nao encontrado!  #
echo  #                                #
echo  ##################################
echo.
set /p sair=Digite qualquer tecla para sair!
goto :FIM

:FIM
echo.
echo  ########################
echo  #                      #
echo  #  Finalizando o App.  #
echo  #                      #
echo  ########################
timeout 2 >NUL  2>NUL
exit