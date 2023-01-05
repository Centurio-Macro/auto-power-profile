#! /bin/bash
# inspired by https://superuser.com/questions/1417292/udev-rule-to-start-a-command-on-ac-battery-plug-unplug-event

# Pop!_OS power profile manager on GitHub: https://github.com/pop-os/system76-power
# available profiles: battery, balanced, performance

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi



if [ "$1" = "remove" ]; then

    echo "Removing udev rules for pluggin and unplugging"
    sudo rm /etc/udev/rules.d/60-onbattery.rules
    sudo rm /etc/udev/rules.d/61-onpower.rules

    udevadm control --reload

    echo "Success"

else
    echo "Creating udev rule for unplugging"
    sudo touch /etc/udev/rules.d/60-onbattery.rules

    sudo echo " # Rule for when switching to battery 
    SUBSYSTEM==\"power_supply\",ENV{POWER_SUPPLY_ONLINE}==\"0\",RUN+=\"/usr/bin/system76-power profile battery\"
    " > /etc/udev/rules.d/60-onbattery.rules

    echo "Creating udev rule for plugging in"
    sudo touch /etc/udev/rules.d/61-onpower.rules

    sudo echo " # Rule for when switching to ac 
    SUBSYSTEM==\"power_supply\",ENV{POWER_SUPPLY_ONLINE}==\"1\",RUN+=\"/usr/bin/system76-power profile balanced\"
    " > /etc/udev/rules.d/61-onpower.rules

    udevadm control --reload

    echo "Success"
fi
exit 0

