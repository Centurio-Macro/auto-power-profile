# Auto Power Profile

Auto Power Profile enables automatic switching between power profiles depending on the charging status of the Laptop. By default it toggles between "battery" and "balanced" on battery or wall power respectively.

The script uses [udev](https://linux.die.net/man/7/udev)rules that are run at specific kernel events. It creates one rule for when the Laptop switches to battery power and another for when the Laptop switches to wall power. Both rules run [system76-power](https://github.com/pop-os/system76-power) while providing one of the available power profiles as an argument. 

Available power profile of system76-power:
- battery
- balanced
- performance

System76-power is the default power profile manager on Pop!_OS. Tested on Pop!_OS 22.04. Other distributions may use the [power-profiles-daemon](https://gitlab.freedesktop.org/hadess/power-profiles-daemon).

# Install

1. Download the script or clone this repository. 
2. Mark the script as executable
``` bash
chmod +x install.sh
```
3. Run the script with privileges:

```bash
sudo ./install.sh
```

# Uninstall
To uninstall run the uninstall script with privileges:
``` bash
sudo ./install.sh remove
```


