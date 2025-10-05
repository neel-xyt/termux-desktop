#!/bin/bash

# ---------- Colors ----------
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PURPLE="\033[35m"
RESET="\033[0m"

# ---------- Functions ----------
clear_screen() {
    clear
}

print_banner() {
    echo -e "${GREEN}
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
                dMMMMN,              WMMMMMMMMMMMMMMMMo${RESET}"
}

run_command() {
    "$@"
    if [ $? -ne 0 ]; then
        echo -e "${RED}[!] Command failed: $@${RESET}"
        exit 1
    fi
}

install_desktop() {
    clear_screen
    echo -e "${GREEN}[*] Updating packages...${RESET}"
    run_command yes | pkg update
    run_command pkg upgrade -y

    clear_screen
    echo -e "${GREEN}[*] Installing required packages...${RESET}"
    packages=(x11-repo termux-x11-nightly pulseaudio tur-repo xfce4 wget)
    for pkg in "${packages[@]}"; do
        run_command pkg install -y "$pkg"
    done

    clear_screen
    echo -e "${GREEN}[*] Downloading desktop launcher...${RESET}"
    wget -q --show-progress https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh -O xfce4.sh

    # Check if download was successful
    if [ ! -s xfce4.sh ]; then
        echo -e "${RED}[!] Failed to download xfce4.sh. Please check your internet connection.${RESET}"
        exit 1
    fi

    setup_launcher

    clear_screen
    print_banner
    echo -e "${GREEN}[*] Termux desktop successfully installed!${RESET}"
    echo -e "${GREEN}[*] Start the desktop using: ${PURPLE}dexn${RESET}"
}

setup_launcher() {
    echo -e "${GREEN}[*] Setting up launcher command 'dexn'...${RESET}"
    BIN_DIR="$HOME/bin"
    mkdir -p "$BIN_DIR"

    # Move downloaded launcher
    mv xfce4.sh "$BIN_DIR/xfce4-launch"
    chmod +x "$BIN_DIR/xfce4-launch"

    # Create simple command 'dexn'
    cat > "$BIN_DIR/dexn" <<'EOF'
#!/bin/bash
# Start XFCE Desktop in Termux X11
~/bin/xfce4-launch
EOF

    chmod +x "$BIN_DIR/dexn"

    # Add to PATH if not already added
    if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
        echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
    fi

    # Apply immediately
    export PATH="$HOME/bin:$PATH"
    source ~/.bashrc

    # Verify
    if command -v dexn >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Command 'dexn' successfully installed!${RESET}"
    else
        echo -e "${YELLOW}[!] Please restart Termux or run 'source ~/.bashrc' manually.${RESET}"
    fi
}

# ---------- Main ----------
clear_screen
print_banner

# Check if already installed
if [ -f "$HOME/bin/dexn" ]; then
    echo -e "${YELLOW}[!] XFCE desktop already installed.${RESET}"
    echo -e "${GREEN}[*] Start it using: ${PURPLE}dexn${RESET}"
    exit 0
fi

read -p "$(echo -e "${PURPLE}[*] Install Termux XFCE desktop now?${RESET} [y/n] >> ")" choice
choice=${choice,,} # lowercase

if [[ "$choice" == "y" ]]; then
    install_desktop
elif [[ "$choice" == "n" ]]; then
    echo -e "${YELLOW}[*] Installation canceled.${RESET}"
    exit 0
else
    echo -e "${RED}[!] Invalid choice. Please enter 'y' or 'n'.${RESET}"
    exit 1
fi
