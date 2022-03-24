@echo off
setlocal
SET /P AREYOUSURE=Running this script may require you to reboot your computer. Make sure to save any open files, close any open programs, and have elevated privileges. Proceed?(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
dism /online /cleanup-image /restorehealth
if errorlevel 0 
(
 sfc /scannow
  (
   if errorlevel 0
    (
     SET /P AREYOUSURE=SFC has finished repairing your system files. Do you want to reboot your computer now?(Y/N)
     IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
     shutdown -r -t 0
    )
   if not errorlevel 0
  echo Sorry, but SFC didn't manage to repair one or all of your files. You'll have to manually reboot your computer in Safe Mode then try running SFC again.
 )
)
if not errorlevel 0
(
 @echo off
 setlocal
 set /p AREYOUSURE=DISM cannot repair the component store. It is possible that the Windows Update client may have been corrupted. Run the Windows Update troubleshooter to resolve errors. If even the troubleshooter fails, you'll have to specify the directory of your Windows installation media to use the WIM image as an offline repair source by entering the path after you choose to proceed. Verify that the WIM image contains the same Windows version as the installation on which this script is running. If the installation media is on a removable drive, make sure the drive is connected firmly through the restore process. Proceed?(Y/N)
 IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
 set /p wimimage=
 dism /online /cleanup-image /restorehealth /Source:WIM:%wimimage%:1 /limitaccess
 (
  if errorlevel 0
   (
    sfc /scannow
   )
  if not errorlevel 0
   (
    echo DISM failed to repair the component store. This script has done its best and can't proceed any further.
   )
 )
)
