#!/bin/bash

# ---------- Colors ----------
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
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
    run_command wget https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh

    # Setup launcher
    setup_launcher

    clear_screen
    print_banner
    echo -e "${GREEN}[*] Termux desktop successfully installed!${RESET}"
    echo -e "${GREEN}[*] Start the desktop using: ${PURPLE}xn dex${RESET}"
}

setup_launcher() {
    echo -e "${GREEN}[*] Setting up launcher command 'xn dex'...${RESET}"
    BIN_DIR="$HOME/bin"
    mkdir -p "$BIN_DIR"

    # Move the original script to ~/bin/dex
    mv xfce4.sh "$BIN_DIR/dex"
    chmod +x "$BIN_DIR/dex"

    # Create wrapper script 'xn'
    cat > "$BIN_DIR/xn" <<'EOF'
#!/bin/bash
if [ "$1" == "dex" ]; then
    ~/bin/dex
else
    echo "Usage: xn dex"
fi
EOF

    chmod +x "$BIN_DIR/xn"

    # Ensure ~/bin is in PATH
    if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
        echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
    fi
    # Apply PATH immediately
    export PATH="$HOME/bin:$PATH"

    echo -e "${GREEN}[*] You can now start the desktop by running: ${PURPLE}xn dex${RESET}"
}

# ---------- Main ----------
clear_screen
print_banner

read -p "$(echo -e "${PURPLE}[*] Have you installed Termux Desktop XFCE4?${RESET} [y/n] >> ")" choice
choice=${choice,,}  # convert to lowercase

if [[ "$choice" == "y" ]]; then
    install_desktop
elif [[ "$choice" == "n" ]]; then
    echo -e "${YELLOW}[*] Exiting...${RESET}"
    exit 0
else
    echo -e "${RED}[!] Invalid choice. Please enter 'y' or 'n'.${RESET}"
    exit 1
fi
