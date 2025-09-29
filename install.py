#!/usr/bin/env python3
import os
import sys

# ---------- Colors ----------
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
PURPLE = "\033[35m"
RESET = "\033[0m"

# ---------- Functions ----------
def clear_screen():
    os.system("clear")

def print_banner():
    banner = f"""{GREEN}
                oMMMMN;
                 .KMMMMk.
                   lWMMMWc
                    .0MMMM0.
                      cWMMMWl
                       .kMMMMK.
                         ;NMMMMo
                          .WMMMMk
                         :WMMMMl
                       .OMMMMK.
                      lWMMMWc
                    .KMMMMO.
                   oMMMMW:
                 .KMMMMk.            0KKKKKKKKKKKKKKKKc
                dMMMMN,              WMMMMMMMMMMMMMMMMo{RESET}
"""
    print(banner)

def run_command(command):
    """Run a system command and exit if it fails."""
    result = os.system(command)
    if result != 0:
        print(f"{RED}[!] Command failed: {command}{RESET}")
        sys.exit(1)

def install_desktop():
    clear_screen()
    print(f"{GREEN}[*] Updating packages...{RESET}")
    run_command('yes | pkg update')
    run_command("pkg upgrade -y")

    clear_screen()
    print(f"{GREEN}[*] Installing required packages...{RESET}")
    packages = [
        "x11-repo",
        "termux-x11-nightly",
        "pulseaudio",
        "tur-repo",
        "xfce4",
        "wget"
    ]
    for pkg in packages:
        run_command(f"pkg install {pkg} -y")

    clear_screen()
    print(f"{GREEN}[*] Downloading desktop launcher...{RESET}")
    run_command("wget https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh")

    # Setup the launcher command
    setup_launcher()

    clear_screen()
    print_banner()
    print(f"{GREEN}[*] Termux desktop successfully installed!{RESET}")
    print(f"{GREEN}[*] Start the desktop using: {PURPLE}xn dex{RESET}")

def setup_launcher():
    """Set up launcher command 'xn dex' to run XFCE4."""
    print(f"{GREEN}[*] Setting up launcher command 'xn dex'...{RESET}")
    bin_dir = os.path.expanduser("~/bin")
    os.makedirs(bin_dir, exist_ok=True)

    # Move the original script to ~/bin/dex
    run_command("mv xfce4.sh ~/bin/dex")
    run_command("chmod +x ~/bin/dex")

    # Create a wrapper script 'xn' in ~/bin
    xn_path = os.path.join(bin_dir, "xn")
    with open(xn_path, "w") as f:
        f.write("#!/bin/bash\n")
        f.write("if [ \"$1\" == \"dex\" ]; then\n")
        f.write("    ~/bin/dex\n")
        f.write("else\n")
        f.write("    echo 'Usage: xn dex'\n")
        f.write("fi\n")
    run_command(f"chmod +x {xn_path}")

    # Ensure ~/bin is in PATH
    bashrc = os.path.expanduser("~/.bashrc")
    with open(bashrc, "a") as f:
        f.write('\nexport PATH=$HOME/bin:$PATH\n')
    run_command("source ~/.bashrc")

    print(f"{GREEN}[*] You can now start the desktop by running: {PURPLE}xn dex{RESET}")

def main():
    clear_screen()
    print_banner()
    
    choice = input(f"{PURPLE}[*] Have you installed Termux Desktop XFCE4?{RESET} [{GREEN}y{RESET}/{RED}n{RESET}] >> ").lower()
    if choice == "y":
        install_desktop()
    elif choice == "n":
        print(f"{YELLOW}[*] Exiting...{RESET}")
        sys.exit(0)
    else:
        print(f"{RED}[!] Invalid choice. Please enter 'y' or 'n'.{RESET}")
        sys.exit(1)

if __name__ == "__main__":
    main()
