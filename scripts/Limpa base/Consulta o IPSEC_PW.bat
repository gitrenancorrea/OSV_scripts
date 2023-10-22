@echo off

rem Definir o valor a ser enviado
set "valor_enviar=556735093202"

rem Executar o script Python e capturar a saída
for /f %%w in ('python IPSEC_PW.py 552138760007') do set "ipsec_pw=%%w"

rem Imprimir o valor IPSEC_PW retornado pelo Python
echo Valor de IPSEC_PW: %ipsec_pw%
pause