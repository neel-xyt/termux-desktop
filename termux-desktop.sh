#!/data/data/com.termux/files/home
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


# Function to perform the action if the user answers 'yes'
perform_action() {
clear
	 echo -e "\e[32m [#]updating...\e[0m"
yes|pkg up
clear
	echo -e "\e[32m[#] installing packages...\e[0m"
pkg install x11-repo -y
pkg install termux-x11-nightly -y
pkg install pulseaudio -y
pkg install tur-repo -y
clear
	echo -e "\e[32m [#]installing desktop xfce4...\e[l0m"
pkg install xfce4
clear
	echo -e "\e[32m [#]installing chromium and vs code... \e[l0m"
pkg install chromium -y
pkg install code-oss -y
clear
	echo -e "\e[32m [#]installing desktop launcher \e[0m"
pkg install wget
wget https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh
chmod +x xfce4.sh
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
echo -e "\e[32m [✓]successfully installed \e[0m"
echo -e "\e[32m [*]launch the desktop using this command   [ ./xfce4.sh ] \e[0m"
rm termux-desktop.sh
  # Add your action commands here
}

# Ask the user the question
echo -n -e "\e[32m[*] are you installed the tarmux desktop xfce4 (y/n):\e[0m "
read answer

# Convert the answer to lowercase to handle different cases (yes/Yes/YES)
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check the user's answer and perform the corresponding action
if [[ "$answer" == "y" ]]; then
  perform_action
elif [[ "$answer" == "n" ]]; then
  echo -e "\e[31m try again using this command  [ dash termux-desktop.sh ] \e[0m" 
else
  echo -e "\e[33mInvalid input. Please answer with 'y' or 'n'.\e[0m" # Yellow text for invalid input
fi



