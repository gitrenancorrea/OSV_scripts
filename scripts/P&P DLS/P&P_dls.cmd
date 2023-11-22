@echo off

for /f "tokens=1-20 delims=;" %%a IN (ramais.csv) DO (
	setlocal enabledelayedexpansion
    echo Criando o Plug and Play do ramal %%k
	for /f %%z in ('python IPSEC_PW.py %%k') do set password=%%z
	echo CreateSIPPhone;;%%k;;Unify SIP;;%%m;;;false;;;%%k;!password!;system;;;;;;;;;;;>> dls.csv
	endlocal
	)
