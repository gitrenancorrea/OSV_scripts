@echo off
echo FILE VERSION:11.00.01:MP2> ramais.txt
FOR /F "tokens=1-20 delims=;" %%a IN (ramais.csv) DO (
setlocal enabledelayedexpansion
set "z=%%d"
set "officecode=!z:~0,8!"
set "ramal=!z:~-4!"
echo Criado o ramal %%d
echo HomeDn>> ramais.txt
echo ,OfficeCode="!officecode!">> ramais.txt
echo ,StartCode="!ramal!">> ramais.txt
echo ;;>> ramais.txt
echo CS_SIP>> ramais.txt
echo ,SUBSCRIBERDN="%%d">> ramais.txt
if "%%f" == "-" (
echo Ramal %%d sem MAC.
) else (
echo ,RETAILER="DP10%%f">> ramais.txt
)
echo ,BILLINGID="%%d">> ramais.txt
echo ,RATEAREA="RA_%%a">> ramais.txt
echo ,NUMBERPLANNAME="%%j">> ramais.txt
echo ,IMPACTLEVEL="Unclassified">> ramais.txt
echo ,BGNAME="Petrobras">> ramais.txt
echo ,EXTERNALDNFLAG=true>> ramais.txt
echo ,DISTINCTIVERINGING=false>> ramais.txt
echo ,COUNTRYCODELEN=^2>> ramais.txt
echo ,EXTCALLERID="%%g!ramal!">> ramais.txt
echo ,DISPLAYNAME="%%b">> ramais.txt	
echo ,TIMEZONE="LOCAL">> ramais.txt
echo ,LANGUAGE="System Default">> ramais.txt
echo ,SUBSCRIBERSTATUS="Active">> ramais.txt
echo ,INTERCEPTANNOUNCEMENT="None">> ramais.txt
echo ,PHONENAME="%%d">> ramais.txt
echo ,REGTYPE="Dynamic">> ramais.txt
echo ,IPSEC_REALM="system">> ramais.txt
echo ,IPSEC_UNAME="%%d">> ramais.txt
for /f %%z in ('python IPSEC_PW.py %%k') do echo ,IPSEC_PW="%%z">> ramais.txt
echo ,IPSEC_SCHEME="digest-authentication">> ramais.txt
echo ,IPSEC_SRTP="SrtpAutomatic">> ramais.txt
echo ,IPSEC_SDES_SRTP="SrtpAutomatic">> ramais.txt
echo ,MAXSIPSESSIONS=^0>> ramais.txt
echo ,TRANSPORTTYPE="TCP">> ramais.txt
echo ,VIPTYPE="VIPNo">> ramais.txt
echo ,ANAT_SUPPORT="AnatAuto">> ramais.txt
echo ,OUTCALLSUPERVISIONTIMER=^0>> ramais.txt
echo ,TRUSTEDSUB=false>> ramais.txt
echo ,MEDIAREDIRECTALLOWED=false>> ramais.txt
echo ,OVERRIDEIRMCODECRESTRICTIONS=false>> ramais.txt
echo ,AORPERCONTACT=false>> ramais.txt
echo ,TRANSFERHANDOFF=false>> ramais.txt
echo ,SENDINSECUREREFFEREDBYHEADER=false>> ramais.txt
echo ,VIDEOCALLALLOWED=true>> ramais.txt
echo ,SENDPUBNRINFQN=false>> ramais.txt
echo ,SENDINTERNATIONALNUMBERGNF=false>> ramais.txt
echo ,ALLOWSUBPROVIDEDCALLINGID=false>> ramais.txt
echo ,DONOTPUBLISHREGISTRATIONTOE911DM=false>> ramais.txt
echo ,DISLONGCALLAUDIT=false>> ramais.txt
echo ,DONOTSENDSIPURI=false>> ramais.txt
echo ,SENDSIPURIWHENAVAILABLE=false>> ramais.txt
echo ,REGISTVIACENTRALSBC=false>> ramais.txt
echo ,RESERVED_6=false>> ramais.txt
echo ,RESERVED_8=false>> ramais.txt
echo ,RESERVED_11=false>> ramais.txt
echo ,DISABLESRTP=false>> ramais.txt
echo ,DONOTALLOW_URNSFORNG911=false>> ramais.txt
echo ,DONOTALLOW_NG911HEADERS=false>> ramais.txt
echo ,ACDCALL_DISTRIBUTIONDEVICE=false>> ramais.txt
echo ,SIP_RECORD_ALL_CALLS=false>> ramais.txt
echo ,DONOTALLOW_GEOLOCATIONHEADERS=false>> ramais.txt
echo ,IGNORE_LOCATION_BY_VALUE=false>> ramais.txt
echo ,HIDE_ISFOCUS=false>> ramais.txt
echo ,SMLTNS_CALLS_NOT_ALLOWED_FROM_MULT_CONTACTS=false>> ramais.txt
echo ,ASSOCIATEDSIPENDPOINTNAME="%%i">> ramais.txt
echo ,ICE_SUPPORT="ICEAutomatic">> ramais.txt
echo ,AEI_SUPPORT="AEIAuto">> ramais.txt
echo ,SUB_PROV_LICENSE="DynamicProvisionedSubLicense">> ramais.txt
echo ,SIPUA_FORKING_SUPPORT="SipUAForkingAuto">> ramais.txt
echo ,SRTP_MODE="SrtpModeAuto">> ramais.txt
echo ;;>> ramais.txt
echo UMB>> ramais.txt
echo ,SUBSCRIBERDN="%%d">> ramais.txt
echo ,BGLINENAME="%%b">> ramais.txt
echo ,BGATTENDANTNUMBERFLAG=false>> ramais.txt
echo ,BGEXTENSION="%%g!ramal!">> ramais.txt
echo ,BGDEPTNAME="">> ramais.txt
echo ,BGEMERGENCYDEPTNAME="">> ramais.txt
echo ;;>> ramais.txt
echo UFP>> ramais.txt
echo ,SUBSCRIBERDN="%%d">> ramais.txt
echo ,PRESERVELOCPRES=false>> ramais.txt
echo ,FPNAME="%%c">> ramais.txt
echo ,BGNAME="Petrobras">> ramais.txt
echo ;;>> ramais.txt
)
FOR /F "tokens=1-10 delims=;" %%a IN (ramais.csv) DO (
if "%%h" == "-" (
echo Ramal %%d sem PU.
) else (
echo ACPU>> ramais.txt
echo ,BGNAME="Petrobras">> ramais.txt
echo ,CPUID=%%h>> ramais.txt
echo ,CPUNAME="%%a_GRP_%%h">> ramais.txt
echo ,NOTIFICATIONDELAYTIMER=^0>> ramais.txt
echo ,CIDPRESENTATION="CpuGroupCIDPresentationAllowed">> ramais.txt
echo ;;>> ramais.txt
echo ALOCALCPU>> ramais.txt
echo ,BGNAME="Petrobras">> ramais.txt
echo ,CPUID=%%h>> ramais.txt
echo ,LOCALCPU_SERVICEID="%%d">> ramais.txt
echo ,LOCALCPU_CIDCALLSTOMEMBER="CpuGroupCIDPresentationAllowed">> ramais.txt
echo ,LOCALCPU_CIDNOTIFICATIONTOMEMBER="CpuGroupCIDPresentationAllowed">> ramais.txt
echo ;;>> ramais.txt
endlocal
)
)

rem set /p palavra_procurada=Digite a palavra que você deseja procurar:

REM Chame o script Python e passe a palavra_procurada como argumento
rem for /f %%z in ('python HUNT.py CS') do set resultado=%%z
rem echo %resultado%
rem pause
REM Verifique o valor de retorno
rem if "%resultado%" equ "0" (
rem     echo A palavra foi encontrada.
rem	pause
rem ) else (
rem    echo A palavra não foi encontrada.
rem	pause
rem )
rem pause