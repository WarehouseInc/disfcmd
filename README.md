# disfcmd
A hybrid batch script between Windows SFC and DISM to try and repair your Windows system files.

The batch script will try to run dism /online /cleanup-image /restorehealth first, if successful it'll move to sfc /scannow and prompt you to reboot your computer if needed.

If the repair fails, you can try manually running the MSDT troubleshooter for the WU client.

If the troubleshooter fails too, you have an option of restoring the component store through a Windows WIM image.

Still, this script is incomplete. I always appreciate any feedback for this script.

Note that this is still an experimental tool and has not been fully tested.

Do not run it on your main PC as it may brick your Windows installation. I am not viable for any damage caused by running this tool on your main PC.

You have been warned.
