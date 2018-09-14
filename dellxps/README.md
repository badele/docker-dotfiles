# Manjaro installation
## Bios configuration

Before installing it is necessary to modify some UEFI Settings. They can be accessed by pressing the F2 key repeatedly when booting.

* Change the SATA Mode from the default "RAID" to "AHCI". This will allow Linux to detect the NVME SSD. If dual booting with an existing Windows installation, Windows will not boot after the change but this can be fixed without a reinstallation.
* Change Fastboot to "Thorough" in "POST Behaviour". This prevents intermittent boot failures.
* Disable secure boot to allow Linux to boot.

### CD-Rom Manjaro installation
* Use Manjaro CD-Rom installation
    *  Disable `systemd.mask=mhwd-live.service` from grub boot menu
    *  Before launch installation setup, disable mhwd script in the add `def run()` function, add `return None` in first line from the run() function on `/lib/calamares/modules/mhwdcfg/main.py` file
