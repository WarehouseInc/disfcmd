# disfcmd
A hybrid batch script between Windows SFC and DISM to try and repair your Windows system files.

# WARNING
This product has not been tested thoroughly. Do not run it on your main PC as it may brick your Windows installation.

I am not viable for any damage caused by running this tool on your main PC.

# Mechanism
Runs `dism /online /cleanup-image /restorehealth` first. 

If successful, moves to `sfc /scannow`. If SFC fails, the tool suggests the user to try rebooting the computer into Safe Mode then run SFC again.

But if DISM failed to repair the component store at the beginning, the tool will suggest the user to run the Windows Update Troubleshooter. If the troubleshooter also fails, the tool will prompt the user to use a Windows installation image as an offline repair source for DISM-as a last resort. The user will then enter the directory of the `install.wim` image inside the installation media. 

DISM will attempt the repair operation. If this final method fails, this tool is declared to have done its best and nothing further can be done.

# Feedback and consistency

This tool is incomplete. Why not? Well it's quite a rush in my homework as a batch script. Thus, I always welcome any feedback for this tool.

You can contact me through my email and I'll start an issue in this repository.
