@echo off

rem Executar o script Python e capturar a saída
for /f %%w in ('python IPSEC_PW.py 559236166857') do set "ipsec_pw=%%w"

rem Imprimir o valor IPSEC_PW retornado pelo Python
echo Valor de IPSEC_PW: %ipsec_pw%
pause