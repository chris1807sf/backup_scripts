# triggering a bash script when an usb-sdd device gets plugged-in
udev rule has been setup, to:
* re-act on an "add" of a "block" device with a specific ATTRS{idVendor} and ATTRS{idProduct} --> my Samnsung T9 SSD device
* trigger: TAG+="systemd", ENV{SYSTEMD_USER_WANTS}="react_on_connect_usb_drive.service"

react_on_connect_usb_drive.service
* systemd service module
* setup as a "user" service: no elevated permissions needed to run
* Type=oneshot
* ExecStart=/home/chris/projects/backup_scripts/react_on_connect_usb_drive.sh

# files involved
* 90-usb-backup.rules
* react_on_connect_usb_drive.service
* react_on_connect_usb_drive.sh
* read.me

# commands used for the setup/execution/checking systemd service:
* check the .service file 
>$ systemd-analyze --user verify react_on_connect_usb_drive.service
* dir to place the .service file 
>$ cp react_on_connect_usb_drive.service /home/chris/.config/systemd/user/
* reload .service files / enable service / show status of service / start service
>$ systemctl --user daemon-reload

>$ systemctl --user enable react_on_connect_usb_drive.service

>$ systemctl --user status react_on_connect_usb_drive.service

>$ systemctl --user start react_on_connect_usb_drive.service
* see logging of systemd
>$ journalctl -f

# setting up the udev rule
* The rules file must be in /etc/udev/rules.d/
>$ sudo cp 90-USB-backup.rules /etc/udev/rules.d/
* Reload the udev rules:
>$ sudo udevadm control --reload-rules
* Trigger the new rules:
>$ sudo udevadm trigger

# More info in `info` file
