@echo off

for /f "tokens=1-20 delims=;" %%a IN (ramais.csv) DO (
    echo Criando o ramal %%d
	if "%%d" == "%%k" (
		echo ModifyDevice;%%d;server-addr=s602das742srv.petrobras.biz;server-port=0;registrar-addr=s602das742srv.petrobras.biz;registrar-port=0;sgnl-gateway-addr=%%l;sgnl-gateway-port=0;>> dls.csv
	) else (
		echo ModifyDevice;%%k;user-id=%%d;server-addr=s602das742srv.petrobras.biz;server-port=0;registrar-addr=s602das742srv.petrobras.biz;registrar-port=0;sgnl-gateway-addr=%%l;sgnl-gateway-port=0;e164=%%d;>> dls.csv
	)
)