
#colours
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
RESET = "\033[0m"
PURPLE = "\033[35m"
RESET = "\033[0m"
#import modules
import os
os.system("clear")
print(f"""{GREEN} 
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


""")
#print("									")
#print("																		")																")
h = input(f"{PURPLE}[*] are you installed the tarmux desktop xfce4{RESET} [{GREEN}y{RESET}/{RED}n{RESET}]>>")
if h == "y":
	os.system("clear")
	print(f"{GREEN}[*] updating....{RESET}")
	os.system('yes|pkg update')
	os.system("pkg upgrade -y")
	os.system("clear")
	print(f"{GREEN}[*] installing packages....{RESET}")
  	os.system("pkg install x11-repo -y")
	os.system("pkg install termux-x11-nightly -y ")
	os.system("pkg install pulseaudio -y")
	os.system("pkg install tur-repo")
	os.system("clear")
	print(f"{GREEN}[*] installing desktop....{RESET}")
	os.system("pkg install xfce4 -y")
 	os.system("clear")
	print(f"{GREEN}[*] installing desktop launcher....{RESET}")
	os.system("pkg install wget -y")
	os.system("wget https://raw.githubusercontent.com/Iamnod/termux-own-desktop/main/xfce4.sh")
	os.system("chmod +x xfce4.sh")
 	os.system("clear")
	print(f"""{GREEN}
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

""")
	print(f"{GREEN}[*] tarmux desktop successfully install {RESET}")
	print(f"{GREEN}[*] start the desktop using this command:[{RESET}{PURPLE} ./xfce4.sh{RESET}{GREEN}]{RESET")
if h == "n":
	os.system("exit")


