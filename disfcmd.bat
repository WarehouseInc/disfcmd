::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCxdQgCNK3iGKbsZzPry+e+7hkgOX/YwaLPv/4e6bsUrzyU=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
SET /P AREYOUSURE=Running this script may require you to reboot your computer. Make sure to save any open files, close any open programs, and have elevated privileges. Proceed?(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
dism /online /cleanup-image /restorehealth
if errorlevel 0 
(
sfc /scannow
if not errorlevel 0 
(
echo Error. Run SFC in Safe Mode to try again.
)
)
if errorlevel 1 
(
@echo off
setlocal
set /p AREYOUSURE=The Windows Update client may have been corrupted. Run the Windows Update troubleshooter to resolve errors. If even the troubleshooter fails, you'll have to specify the directory of your Windows installation media to use the WIM image as the repair source. Verify that the WIM image contains the same Windows version as the installation on which this script is running. If the installation media is on a removable drive, make sure the drive is connected firmly through the restore process. Proceed?(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
set /p wimimage=
dism /online /cleanup-image /restorehealth /Source:WIM:%wimimage%:1 /limitaccess
if errorlevel 0
(
sfc /scannow
)
if not errorlevel 0
(
echo DISM failed to repair the component store. This script has done its best and can't proceed any further.
)
)