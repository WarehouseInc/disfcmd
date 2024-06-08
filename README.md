# WARNING
This product has not been tested thoroughly. Do not run it on your main PC as it may brick your Windows installation.

# Mechanism
Remember to create a restore point before this operation.

Runs `dism /online /cleanup-image /restorehealth` first. 

If successful, moves to `sfc /scannow`. If SFC fails, the tool suggests the user to try rebooting the computer into Safe Mode then run SFC again.

But if DISM failed to repair the component store at the beginning, the tool will suggest the user to run the Windows Update Troubleshooter. If the troubleshooter also fails, the tool will prompt the user to use a Windows installation image as an offline repair source for DISM as a last resort. The user will then enter the directory of the `install.wim` image inside the installation media. 

DISM will attempt the repair operation. If this final method fails, it is recommended to do a clean install as system files can no longer be reliably replaced.

# Feedback and consistency
Well this tool was my homework as a batch script and was born out of inspiration, so no updates are guaranteed. I mean, why though? If there's a bug just open an issue in the repository.
