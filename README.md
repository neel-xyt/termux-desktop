# Termux Own Desktop Environment (XFCE4)

A desktop environment for Termux, allowing you to run **XFCE4** (a lightweight Linux desktop) on Android.

---

## Applications

1. **Check Your Device CPU Architecture**  
   Use the [CPU Info](https://play.google.com/store/apps/details?id=com.kgurgul.cpuinfo) app to find your device's CPU architecture and ABI.

2. **Download Termux**  
   Install the [Termux app](https://f-droid.org/en/packages/com.termux/) from F-Droid on your Android device.

3. **Download Termux X11**  
   Get the appropriate [Termux X11 app](https://github.com/termux/termux-x11/releases) based on your CPU architecture.  
   This is a VNC-based app to interact with the desktop environment.

---

## Installation Steps

### 1. Automated Installation  

To install the Termux desktop environment using a single command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/install.sh)"
```
This installer will:

- Update Termux packages

- Install required packages: *xfce4, pulseaudio, termux-x11-nightly*, etc.

- Download the **XFCE4** launcher script

- Set up a launcher command xn dex in `~/bin`


Start the desktop anytime by running:
```
dexn
```
This launches the XFCE4 session in ``Termux-X11.``

---
### 2. Manual Installation

For manual setup, follow the detailed instructions in this [guide](https://github.com/neel-xyt/termux-desktop/blob/main/MANUALLY.md).

### Notes
Ensure *~/bin* is in your *PATH*. The installer automatically adds it to *~/.bashrc*.

`dexn` is a wrapper command: the script dex runs *XFCE4*, and *xn* allows calling it with the argument *dex*.

If you face any issues with PulseAudio or X11, restart Termux and try again.
