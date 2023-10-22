@echo off
rem if "%1" == "" (goto :PARAMETRO) else (goto :INICIO)
rem :INICIO
rem set arquivo=%1
echo FILE VERSION:11.00.01:MP2> MAC.txt
FOR /F "tokens=1-9 delims=;" %%a IN (ramais.csv) DO (
if "%%f" == "-" (
echo Ramal %%d sem MAC na planilha.
) else (
echo Adicionando o MAC no ramal. %%d
echo UM>> MAC.txt
echo ,SUBSCRIBERDN="%%d">> MAC.txt
echo ,RETAILER="DP10%%f">> MAC.txt
echo ;;>> MAC.txt
)
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