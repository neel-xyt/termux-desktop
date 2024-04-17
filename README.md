# termux-own-desktop
it's own desktop of tarmux using xfce desktop. easily use the tarmux GUI mod 

• lightweight size 2.2GB.
![image0](https://github.com/Iamnod/termux-own-desktop/assets/166691075/26ccb03f-0983-473b-a5a9-8c30ce3ba9da)
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

xfce4.sh file comment:
```
pkg install git -y
git clone https://github.com/Iamnod/termux-own-desktop.git
```
next commented:
```
cd termux-own-desktop
```
finely change the mod fo xfce4.sh 
```
chmod +x xfce4.sh
```
run the file
```
./xfce4.sh
```
# tarmux x11 settings 

open tarmux x11 app go to  PREFERENCES

```•on(Fullscreen on device display).```

```•on(PIP mode)```

``` •off(Show additional keyboard)```
