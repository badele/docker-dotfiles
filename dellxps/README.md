### Installation
 * Use Manjaro CD-Rom installation
    *  Disable ```systemd.mask=mhwd-live.service``` from grub boot menu
    *  Before launch installation setup, disable mhwd script in the add ```def run()``` function, add ```return None``` in first line from the run() function on ```/lib/calamares/modules/mhwdcfg/main.py``` file
