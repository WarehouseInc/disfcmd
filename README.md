# Disclaimer: Untested product

This product has not undergone rigorous testing and I am not liable for any damage it causes on any environment or platform. Use with caution.

# Why does this exist?

Well, nothing more than 14 year old me programming in batch for the first time. I'd lose interest over time and now this is nothing more than a showcase.

# What does it do? 

Runs `dism /online /cleanup-image /restorehealth`. Proceeds to run `sfc /scannow` if image is successfully repaired, otherwise prompts a reboot into Safe Mode for an SFC retry.

If image is irreparable, prompts the user to run the WU troubleshooter. Using the installation image is possible as a last resort. If all else fails, Windows reinstallation is highly recommended.

# Is this still maintained?

No, it is a public archive. Forward all questions to my work email and I'll try my best to address them.
