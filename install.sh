#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\e[32m
                oMMMMN;
                 .KMMMMk.
                   lWMMMWc
                    .0MMMM0.
                       .kMMMMK.
                         ;NMMMMo
                          .WMMMMk
                         :WMMMMl
                       .OMMMMK.
                      lWMMMWc
                    .KMMMMO.
                   oMMMMW:
                 .KMMMMk.            0KKKKKKKKKKKKKKKKc
                dMMMMN,              WMMMMMMMMMMMMMMMMo

					by neel-xyt

\e[0m"

perform_action() {
    clear
    echo -e "\e[32m[#] Updating packages...\e[0m"
    pkg update -y && pkg upgrade -y

    clear
    echo -e "\e[32m[#] Installing repositories and dependencies...\e[0m"
    pkg install -y x11-repo tur-repo

    clear
    echo -e "\e[32m[#] Installing essential packages...\e[0m"
    pkg install -y termux-x11-nightly pulseaudio xfce4 wget

    # Optional packages - only install if not present
    command -v chromium >/dev/null || pkg install -y chromium
    command -v code-oss >/dev/null || pkg install -y code-oss

    clear
    echo -e "\e[32m[#] Downloading desktop launcher...\e[0m"
    if wget https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh; then
        chmod +x xfce4.sh
    else
        echo -e "\e[31m[!] Failed to download xfce4.sh. Check your internet or URL.\e[0m"
        exit 1
    fi

    clear
    echo -e "\e[32m
                oMMMMN;
                 .KMMMMk.
                   lWMMMWc
                    .0MMMM0.
                       .kMMMMK.
                         ;NMMMMo
                          .WMMMMk
                         :WMMMMl
                       .OMMMMK.
                      lWMMMWc
                    .KMMMMO.
                   oMMMMW:
                 .KMMMMk.            0KKKKKKKKKKKKKKKKc
                dMMMMN,              WMMMMMMMMMMMMMMMMo

  					by neel-xyt

\e[0m"
    echo -e "\e[32m[✓] Successfully installed Termux desktop environment\e[0m"
    echo -e "\e[32m[*] Launch it anytime using: [ ./xfce4.sh ]\e[0m"
}

echo -ne "\e[32m[*] Have you already installed the Termux desktop XFCE4 before? (y/n): \e[0m"
read answer
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "y" ]]; then
    perform_action
elif [[ "$answer" == "n" ]]; then
    echo -e "\e[31mTry again using this command: [ bash termux-desktop.sh ]\e[0m"
else
    echo -e "\e[33mInvalid input. Please answer with 'y' or 'n'.\e[0m"
fi
