@echo off
color 1f
CLS
:Begin UAC check and Auto-Elevate Permissions
:--------------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo:
echo   Requesting Administrative Privileges...
echo   Press YES in UAC Prompt to Continue
echo:

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
    CLS
:--------------------------------------------------
title Windows Privacy Tweaking create by silverbios
:MENU
CLS
ECHO ------------------------------------------------------------------
echo. This Script contain 3 Privacy Tweaking options
echo. 1. Disable two Windows Telemetry service
echo. 2. Add two registry Tweak for Disabling Windows Telemetry
echo. 3. Block many Microsoft Domain Gathering For Telemetry  
Echo ------------------------------------------------------------------
SET /P M=Type 1, 2, 3, 4 (for exit) , 5 (reboot your system after using option 1 or 2) then press ENTER:
IF %M%==1 GOTO SERVICES
IF %M%==2 GOTO REGISTRY
IF %M%==3 GOTO HOSTS
IF %M%==4 GOTO EXIT
IF %M%==5 GOTO REBOOT
:SERVICES
SET /P AREYOUSURE=Are you sure to run This section to run This section (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO MENU
echo Running Option 1
echo. Disabling Telemtry Service
echo ...
echo ..
echo .
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushsvc start= disabled >nul 2>&1
echo Done
GOTO MENU
:Registry
SET /P AREYOUSURE=Are you sure to run This section (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO MENU
echo Running Option 2
echo Registry Tweaking ...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollectio" /v AllowTelemetry /t REG_DWORD /d 0 /f>NUL 2>NUL
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /D 0 /T REG_DWORD /F>NUL 2>NUL
echo Done
GOTO MENU
:HOSTS
SET /P AREYOUSURE=Are you sure to run This section (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO MENU
echo Running Option 3
echo Blocking some Microsoft Telemtry Domain
type %windir%\System32\drivers\etc\hosts >> %windir%\System32\drivers\etc\hostss
set hostspath=%windir%\System32\drivers\etc\hostss
echo 0.0.0.0 a.ads1.msn.com >> %hostspath%
echo 0.0.0.0 a.ads2.msads.net >> %hostspath%
echo 0.0.0.0 a.ads2.msn.com >> %hostspath%
echo 0.0.0.0 a.rad.msn.com >> %hostspath%
echo 0.0.0.0 ac3.msn.com >> %hostspath%
echo 0.0.0.0 activity.windows.com >> %hostspath%
echo 0.0.0.0 adnexus.net >> %hostspath%
echo 0.0.0.0 adnxs.com >> %hostspath%
echo 0.0.0.0 ads.msn.com >> %hostspath%
echo 0.0.0.0 ads1.msads.net >> %hostspath%
echo 0.0.0.0 ads1.msn.com >> %hostspath%
echo 0.0.0.0 aidps.atdmt.com >> %hostspath%
echo 0.0.0.0 aka-cdn-ns.adtech.de >> %hostspath%
echo 10%% .........
echo 0.0.0.0 alpha.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 api.cortana.ai >> %hostspath%
echo 0.0.0.0 b.ads1.msn.com >> %hostspath%
echo 0.0.0.0 b.ads2.msads.net >> %hostspath%
echo 0.0.0.0 b.rad.msn.com >> %hostspath%
echo 0.0.0.0 bingads.microsoft.com >> %hostspath%
echo 0.0.0.0 bl3301-a.1drv.com >> %hostspath%
echo 0.0.0.0 bl3301-c.1drv.com >> %hostspath%
echo 0.0.0.0 bl3301-g.1drv.com >> %hostspath%
echo 0.0.0.0 bn2-ris-ap-prod-atm.trafficmanager.net >> %hostspath%
echo 0.0.0.0 bn2-ris-prod-atm.trafficmanager.net >> %hostspath%
echo 0.0.0.0 bn2b-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 bn2b-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 bn2b-cor003.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 bn2b-cor004.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 bn2wns1.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 bn3sch020010558.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010560.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010618.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010629.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010631.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010635.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010636.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020010650.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020011727.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020012850.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020020322.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020020749.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020022328.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020022335.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn3sch020022361.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101120814.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101120818.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101120911.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101120913.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121019.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121109.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121118.wns.windows.com >> %hostspath%
echo 20%% ........
echo 0.0.0.0 bn4sch101121223.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121407.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121618.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121704.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121709.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121714.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101121908.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101122117.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101122310.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101122312.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101122421.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101123108.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101123110.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch101123202.wns.windows.com >> %hostspath%
echo 0.0.0.0 bn4sch102110124.wns.windows.com >> %hostspath%
echo 0.0.0.0 browser.pipe.aria.microsoft.com >> %hostspath%
echo 0.0.0.0 bs.serving-sys.com >> %hostspath%
echo 0.0.0.0 by3301-a.1drv.com >> %hostspath%
echo 0.0.0.0 by3301-c.1drv.com >> %hostspath%
echo 0.0.0.0 by3301-e.1drv.com >> %hostspath%
echo 0.0.0.0 c.atdmt.com >> %hostspath%
echo 0.0.0.0 c.msn.com >> %hostspath%
echo 0.0.0.0 ca.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 cache.datamart.windows.com >> %hostspath%
echo 0.0.0.0 cdn.atdmt.com >> %hostspath%
echo 0.0.0.0 cds10.stn.llnw.net >> %hostspath%
echo 0.0.0.0 cds1203.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1204.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1209.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1219.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1228.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1244.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1257.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1265.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1269.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1273.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1285.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1287.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1289.lon.llnw.net >> %hostspath%
echo 30%% .......
echo 0.0.0.0 cds1293.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1307.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1310.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1325.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds1327.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds177.dus.llnw.net >> %hostspath%
echo 0.0.0.0 cds20005.stn.llnw.net >> %hostspath%
echo 0.0.0.0 cds20404.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20411.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20415.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20416.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20417.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20424.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20425.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20431.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20435.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20440.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20443.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20445.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20450.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20452.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20457.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20461.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20469.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20475.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20482.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20485.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds20495.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds21205.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21207.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21225.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21229.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21233.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21238.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21244.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21249.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21256.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21257.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21258.lon.llnw.net >> %hostspath%
echo 40%% ......
echo 0.0.0.0 cds21261.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21267.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21278.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21281.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21293.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21309.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21313.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds21321.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds299.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds308.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds30027.stn.llnw.net >> %hostspath%
echo 0.0.0.0 cds310.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds38.ory.llnw.net >> %hostspath%
echo 0.0.0.0 cds54.ory.llnw.net >> %hostspath%
echo 0.0.0.0 cds405.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds406.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds407.fra.llnw.net >> %hostspath%
echo 0.0.0.0 cds416.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds421.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds422.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds425.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds426.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds447.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds458.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds459.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds461.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds468.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds469.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds471.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds483.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds484.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds489.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds493.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds494.lcy.llnw.net >> %hostspath%
echo 0.0.0.0 cds812.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds815.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds818.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds832.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds836.lon.llnw.net >> %hostspath%
echo 50%% .....
echo 0.0.0.0 cds840.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds843.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds857.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds868.lon.llnw.net >> %hostspath%
echo 0.0.0.0 cds869.lon.llnw.net >> %hostspath%
echo 0.0.0.0 ceuswatcab01.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 ceuswatcab02.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 ch1-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 ch1-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 ch3301-c.1drv.com >> %hostspath%
echo 0.0.0.0 ch3301-e.1drv.com >> %hostspath%
echo 0.0.0.0 ch3301-g.1drv.com >> %hostspath%
echo 0.0.0.0 ch3302-c.1drv.com >> %hostspath%
echo 0.0.0.0 ch3302-e.1drv.com >> %hostspath%
echo 0.0.0.0 compatexchange1.trafficmanager.net >> %hostspath%
echo 0.0.0.0 continuum.dds.microsoft.com >> %hostspath%
echo 0.0.0.0 corp.sts.microsoft.com >> %hostspath%
echo 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com >> %hostspath%
echo 0.0.0.0 cs.dds.microsoft.com >> %hostspath%
echo 0.0.0.0 cs1.wpc.v0cdn.net >> %hostspath%
echo 0.0.0.0 db3aqu.atdmt.com >> %hostspath%
echo 0.0.0.0 df.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 diagnostics.support.microsoft.com >> %hostspath%
echo 0.0.0.0 eaus2watcab01.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 eaus2watcab02.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 ec.atdmt.com >> %hostspath%
echo 0.0.0.0 flex.msn.com >> %hostspath%
echo 0.0.0.0 g.msn.com >> %hostspath%
echo 0.0.0.0 h1.msn.com >> %hostspath%
echo 0.0.0.0 h2.msn.com >> %hostspath%
echo 0.0.0.0 hk2.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020721.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020723.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020726.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020729.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020732.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020824.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020843.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020851.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020854.wns.windows.com >> %hostspath%
echo 60%% ....
echo 0.0.0.0 hk2sch130020855.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020924.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020936.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020940.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020956.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020958.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130020961.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021017.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021029.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021035.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021137.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021142.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021153.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021217.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021246.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021249.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021260.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021264.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021322.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021323.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021329.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021334.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021360.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021432.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021433.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021435.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021437.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021440.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021450.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021518.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021523.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021526.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021527.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021544.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021554.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021618.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021634.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021638.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021646.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021652.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021654.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021657.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021723.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021726.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021727.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021730.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021731.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021754.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021829.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021830.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021833.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021840.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021842.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021851.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021852.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021927.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021928.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021929.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130021958.wns.windows.com >> %hostspath%
echo 70%% ...
echo 0.0.0.0 hk2sch130022035.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130022041.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130022049.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2sch130022135.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2wns1.wns.windows.com >> %hostspath%
echo 0.0.0.0 hk2wns1b.wns.windows.com >> %hostspath%
echo 0.0.0.0 i-am3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-am3p-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-am3p-cor003.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-am3p-cor004.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-am3p-cor005.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-bl6p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-bl6p-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-bn3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-bn3p-cor090.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-by3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-by3p-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-ch1-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-ch1-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-db3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-db3p-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-db3p-cor003.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-db3p-cor004.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-db3p-cor005.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-sn2-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-sn2-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-sn3p-cor001.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 i-sn3p-cor002.api.p001.1drv.com >> %hostspath%
echo 0.0.0.0 ieonlinews.microsoft.com >> %hostspath%
echo 0.0.0.0 ieonlinews.trafficmanager.net >> %hostspath%
echo 0.0.0.0 insideruser.trafficmanager.net >> %hostspath%
echo 0.0.0.0 lb1.www.ms.akadns.net >> %hostspath%
echo 0.0.0.0 live.rads.msn.com >> %hostspath%
echo 0.0.0.0 m.adnxs.com >> %hostspath%
echo 0.0.0.0 mobile.pipe.aria.microsoft.com >> %hostspath%
echo 0.0.0.0 msedge.net >> %hostspath%
echo 0.0.0.0 msntest.serving-sys.com >> %hostspath%
echo 80%% ..
echo 0.0.0.0 nexus.officeapps.live.com >> %hostspath%
echo 0.0.0.0 nexusrules.officeapps.live.com >> %hostspath%
echo 0.0.0.0 nw-umwatson.events.data.microsoft.com >> %hostspath%
echo 0.0.0.0 oca.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 onecollector.cloudapp.aria.akadns.net >> %hostspath%
echo 0.0.0.0 par02p.wns.windows.com >> %hostspath%
echo 0.0.0.0 pre.footprintpredict.com >> %hostspath%
echo 0.0.0.0 preview.msn.com >> %hostspath%
echo 0.0.0.0 rad.live.com >> %hostspath%
echo 0.0.0.0 rad.msn.com >> %hostspath%
echo 0.0.0.0 redir.metaservices.microsoft.com >> %hostspath%
echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 schemas.microsoft.akadns.net >> %hostspath%
echo 0.0.0.0 secure.adnxs.com >> %hostspath%
echo 0.0.0.0 secure.flashtalking.com >> %hostspath%
echo 0.0.0.0 services.wes.df.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 settings-sandbox.data.microsoft.com >> %hostspath%
echo 0.0.0.0 settings-win-ppe.data.microsoft.com >> %hostspath%
echo 0.0.0.0 settings.data.glbdns2.microsoft.com >> %hostspath%
echo 0.0.0.0 settingsfd-geo.trafficmanager.net >> %hostspath%
echo 0.0.0.0 sg2p.wns.windows.com >> %hostspath%
echo 0.0.0.0 sn3301-c.1drv.com >> %hostspath%
echo 0.0.0.0 sn3301-e.1drv.com >> %hostspath%
echo 0.0.0.0 sn3301-g.1drv.com >> %hostspath%
echo 0.0.0.0 spynet2.microsoft.com >> %hostspath%
echo 0.0.0.0 spynetalt.microsoft.com >> %hostspath%
echo 0.0.0.0 spyneteurope.microsoft.akadns.net >> %hostspath%
echo 0.0.0.0 sqm.df.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 sqm.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 ssw.live.com >> %hostspath%
echo 0.0.0.0 survey.watson.microsoft.com >> %hostspath%
echo 0.0.0.0 tele.trafficmanager.net >> %hostspath%
echo 0.0.0.0 telecommand.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 telemetry.appex.bing.net >> %hostspath%
echo 0.0.0.0 telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 telemetry.remoteapp.windowsazure.com >> %hostspath%
echo 0.0.0.0 telemetry.urs.microsoft.com >> %hostspath%
echo 0.0.0.0 teredo.ipv6.microsoft.com >> %hostspath%
echo 0.0.0.0 test.activity.windows.com >> %hostspath%
echo 0.0.0.0 umwatsonc.events.data.microsoft.com >> %hostspath%
echo 0.0.0.0 v10.vortex-win.data.microsoft.com >> %hostspath%
echo 0.0.0.0 v20.vortex-win.data.microsoft.com >> %hostspath%
echo 0.0.0.0 view.atdmt.com >> %hostspath%
echo 0.0.0.0 vortex-sandbox.data.microsoft.com >> %hostspath%
echo 0.0.0.0 vortex.data.glbdns2.microsoft.com >> %hostspath%
echo 0.0.0.0 vortex.data.microsoft.com >> %hostspath%
echo 0.0.0.0 watson.live.com >> %hostspath%
echo 0.0.0.0 watson.microsoft.com >> %hostspath%
echo 0.0.0.0 watson.ppe.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 watson.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 web.vortex.data.microsoft.com >> %hostspath%
echo 0.0.0.0 wes.df.telemetry.microsoft.com >> %hostspath%
echo 0.0.0.0 weus2watcab01.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 weus2watcab02.blob.core.windows.net >> %hostspath%
echo 0.0.0.0 win10.ipv6.microsoft.com >> %hostspath%
echo 0.0.0.0 win1710.ipv6.microsoft.com >> %hostspath%
echo 0.0.0.0 win8.ipv6.microsoft.com >> %hostspath%
echo 0.0.0.0 www.msedge.net >> %hostspath%
echo 90%% .
echo 0.0.0.0 ztd.dds.microsoft.com >> %hostspath%
echo 0.0.0.0 apac1.notify.windows.com.akadns.net >> %hostspath%
echo 0.0.0.0 asimov-win.settings.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 cy2.vortex.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 db5.settings.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 db5.settings-win.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 db5.vortex.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 db5-eap.settings-win.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 geo.settings.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 geo.settings-win.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 geo.vortex.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 hk2.settings.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 modern.watson.data.microsoft.com.akadns.net >> %hostspath%
echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net >> %hostspath%
echo 0.0.0.0 v10-win.vortex.data.microsoft.com.akadns.net >> %hostspath%
del /f %windir%\System32\drivers\etc\hosts >nul 2>&1
rename %windir%\System32\drivers\etc\hostss hosts >nul 2>&1
echo 100
echo Done
GOTO MENU
:EXIT
exit
:REBOOT
shutdown -r /t 15