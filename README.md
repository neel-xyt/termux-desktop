# termux-own-desktop
it's own desktop of tarmux using xfce desktop. easily use the tarmux GUI mod 

• lightweight size 2.2GB.
# download-the-required-applications

• check your device CPU architecture using [CPU info](https://play.google.com/store/apps/details?id=com.kgurgul.cpuinfo)app.
 
chack your ABI of CPU
<details>
<summary>image</summary>
 
![image1](https://github.com/Iamnod/termux-on-desktop/assets/166691075/68bb34b8-7380-4621-ac8f-601cbc737589)

</details>

• Downloa the [tarmux](https://github.com/termux/termux-app/releases/tag/v0.118.0) app of your ABI variant.

• Download the [tarmux x11](https://github.com/termux/termux-x11/releases) app of your ABI variant.
this is type of VNC.

 # first

 open the tarmux app

• run the update and upgrade comment:

```
pkg update -y
pkg upgrade -y
```

• install the following packages in Termux:
```
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install tur-repo
```

• than install the desktop xfce4 using this comment:
```
pkg install xfce4
```
• then install any Browser of your choice chromium , firefox.

install chromium using this comment:
```
pkg install chromium
```

install firefox using this comment:
```
pkg install firefox
```
install vs code using this comment:
```
pkg install code-oss
```
# desktop-launcher
create a dash filed using this comment:
```
pkg install nano
nano xfce4.sh
```
xfce4.sh dash file script:
```
#!/data/data/com.termux/files/usr/bin/bash

# Kill open X11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null

# Enable PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &

# Wait a bit until termux-x11 gets started.
sleep 3

# Launch  Termux X11 main activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

# Set audio server
export PULSE_SERVER=127.0.0.1

# Run XFCE4 Desktop
env DISPLAY=:0 dbus-launch --exit-with-session xfce4-session & > /dev/null 2>&1

exit 0
```
• Then seve the file using ```control + s and control + x ```
<details>
<summary>image</summary>
 
![image 2](https://github.com/Iamnod/termux-own-desktop/assets/166691075/12b243f2-34ff-4eba-86b5-e544d67be65d)
</details>
# end 
finely change the mod fo xfce4.sh  file using this comment:

```
chmod +x xfce4.sh
```
ran the file 

```
./xfcs4.sh
```
# tarmux x11 settings 

open tarmux x11 app go to  PREFERENCES

```•on Fullscreen on device display.```

```•on PIP mode```

``` •off Show additional keyboard```
