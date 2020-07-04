#!/bin/bash
LPATH='/opt/sifter/'
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'
ARG=$2
# IP addition argument
# Help Menu
usage() {                                    	  # Function: Print a help message.
	echo -e  "${YLW}Sifter Help Menu${NC}"
	echo "*****************"
	echo "+"
	echo "+"
	echo "# sifter runs the programs bringing up the menu in a cli environment"
	echo "# sifter -c will check the exsiting hosts in the hostlist"
	echo "# sifter -a '<target-ip>' must be added with '' and then automattically appends the hostname/IP to host file"
	echo "# sifter -e Opens the Exploitation Module"
	echo "# sifter -i Opens the Info-based Module menu"
	echo "# sifter -d Opens the Domain Focused Modules"
	echo "# sifter -n Opens the Network Mapping Modules menu"
	echo "# sifter -w Opens the Website Focused Modules"
	echo "# sifter -wa Opens the Web-App Focused Module menu"
	echo "# sifter -v Opens the Vulnerability Scanning Module Menu"
    echo "# sifter -m Opens the Module Menu directly"
    echo "# sifter -p opens the password tools for quick passlist generation or hash decryption"
	echo "# sifter -r opens the results folder for viewing of files or photos"
    echo "# sifter -u Checks for any updates on Github"
    echo "# sifter -z Opens the Module Information Menu"
	echo "# sifter -h This Help Menu" 1>&2
}
# Information Modules
# Enterprise Target Info
cred_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Enterprise Information Gatherers"
  echo -e "${LP}This module focuses on Enterprises and their online presence"
  echo -e "${YLW}eg. web-directories, enterprise email addresses, etc."
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("theHarvester" "Osmedeus" "ReconSpider" "CredNinja" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
                            "theHarvester")
                                ./modules/credmods/harvester.sh
                                ;;

                            "Osmedeus")
                                ./modules/credmods/osmedeus.sh
                                ;;

                            "ReconSpider")
                                ./modules/credmods/rspider.sh
                                ;;

                            "CredNinja")
                                ./modules/postex/credninja.sh
                                ;;
                            
                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Individual Target Info
phone_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Targeted Information Gatherers"
  echo -e "${LP}This module focuses on individual targets."
  echo -e "${YLW}eg. Social media information, phone number information, etc."
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("Seeker" "Sherlock" "xRay" "Maryam" "Back" "Quit") 
          select opt in "${options[@]}"
          do
                  case $opt in
                            "Seeker")
                                ./modules/credmods/seeker.sh
                                ;;

                            "Sherlock")
                                ./modules/credmods/sherlock.sh
                                ;;

                            "Maryam")
                                ./modules/credmods/maryam.sh
                                ;;

                            "xRay")
                                ./modules/credmods/xray.sh
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Info Module-Category Selection
info_mods(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "Information Gatherers"
    echo -e "${ORNG}"
    PS3='Which module category would you like to use?'
            options=("Enterprise Focus" "Individual Focus" "Back" "Quit")
            select opt in "${options[@]}"
            do
                    case $opt in
                            "Enterprise Focus")
                                cred_mods
                                ;;

                            "Individual Focus")
                                phone_mods
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
        echo -e "${NC}"

}
# HoneyPot Scanners
honey_mods(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "HoneyPot Detection Systems"
    echo -e "${LP}This module focuses on Enterprises and their online presence"
    echo -e "${YLW}eg. web-directories, enterprise email addresses, etc."
    echo -e "${ORNG}"
    PS3='What tool would you like to use?'
            options=("HoneyCaught" "SniffingBear" "HoneyTel" "Back" "Quit")
            select opt in "${options[@]}"
            do
                    case $opt in
                            "HoneyCaught")
                                ./modules/honeymods/honeyc.sh
                                ;;

                            "SniffingBear")
                                ./modules/honeymods/s_bear.sh
                                ;;

                            "HoneyTel")
                                ./modules/honeymods/honeytel.sh
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
        echo -e "${NC}"

}
# Domain Modules
dom_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Domain Recon Gathering"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("DnsTwist" "Armory" "SayDog" "Back" "Quit") 
          select opt in "${options[@]}"
          do
                  case $opt in
                            "DnsTwist")
                                ./modules/dommods/dnstwist.sh
                                ;;

                            "Armory")
                                ./modules/dommods/armory.sh
                                ;;

                            "SayDog")
                                sdog
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Network Modules
net_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Network Scanners"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("nMap" "Arp-Scan" "AttackSurfaceMapper" "wafw00f" "aSnip" "Espionage" "Back"  "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
                            "nMap")
                                ./modules/netmods/nmap.sh
                                ;;

                            "Arp-Scan")
                                sudo arp-scan -l
                                ;;

                            "AttackSurfaceMapper")
                                ./modules/netmods/asm.sh
                                ;;

                            "wafw00f")
                                ./modules/netmods/wafw00f.sh
                                ;;

                            "aSnip")
                                ./modules/netmods/asnip.sh
                                ;;

                            "Espionage")
                                ./modules/netmods/espionage.sh
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Vulnerability Scanners
vuln_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Vulnerability Scanners"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("Flan" "RapidScan" "Yuki-Chan" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
                            "Flan")
                                ./modules/vulnscanners/flan.sh
                                ;;

                            "RapidScan")
                                ./modules/vulnscanners/rapidscan.sh
                                ;;

                            "Yuki-Chan")
                                ./modules/vulnscanners/yuki.sh
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 1
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Web-Focused Modules
web_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Website Scanners & Enumerators"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("Dirb" "Nikto" "BlackWidow" "DorksEye" "WPForce" "Zeus" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
			    "Dirb")
			        ./modules/webmods/dirb.sh
				;;

                            "Nikto")
                                ./modules/webmods/nikto.sh
                                ;;

                            "BlackWidow")
                                ./modules/webmods/widow.sh
                                ;;

                            "WPForce")
                                echo -e "${YLW}WPScan & WPForce"
                                echo -e "${W}Tools for use against wordpress${NC}"
                                sleep 3
                                ./modules/webmods/wordpress.sh
                                ;;

			    "DorksEye")
			    	./modules/webmods/dorkseye.sh
				;;

                            "Zeus")
                                ./modules/webmods/zeus.sh
                                ;;

                            "Back")
                                modules
                                ;;

                            "Quit")
                                exit 2
                                ;;
                    esac
            done
            echo -e "${NC}"
}
# Post Exploitation
post_ex(){
    echo -e "${RED}"
    figlet -f mini "Post-Exploitation"
    echo -e "${NC}"
    PS3='What tool would you like to use?'
        options=("EoP Exploit" "Omega" "WinPwn" "PowerSharp" "CredHarvester" "ACLight2" "Back")
        select opt in "${options[@]}"
        do
            case $opt in
                "EoP Exploit")
                    echo -e "${W}The EoP module helps elevate user privileges on an exploited system${NC}"
                    ./modules/postex/EoP.sh
                    ;;

                "Omega")
                    echo -e "${W}This tool acts as a Command n Control Server for call-back of exploited systems${NC}"
                    ./modules/postex/omega.sh
                    ;;                    

                "WinPwn")
                    echo -e "${W}This module checks for internal system privilege escalation methods that could be used to elevate user privs${NC}"
                    ./modules/postex/winpwn.sh
                    ;;

                "PowerSharp")
                    echo -e "${W}This is a ${YLW}PowerShell${W} tool that is to be used on an exploited system${NC}"
                    xterm -e bash /opt/sifter/modules/postex/powersharp.sh
                    ;;

                "CredHarvester")
                    echo -e "${W}Python3 tool to gather credentials on a successfully infultrated machine${NC}"
                    ./modules/postex/credharvester.sh
                    ;;
                
                "ACLight2")
                    echo -e "${W}This tool is used on an exploited target in order \nto search for Shadow Admins${NC}"
                    ./modules/postex/aclight.sh
                    ;;

                "Back")
                    ex_mods
                    ;;

            esac
        done
    echo -e "${NC}"
}
# Password Tools
pass_tools(){
    cd /opt/sifter/modules/passtools
    echo -e "${RED}"
    figlet -f mini "Password Tools"
    echo -e "${ORNG}"
    PS3='Which tool would you like to use?'
        options=("Mentalist" "DCipher" "Back")
        select opt in "${options[@]}"
        do
            case $opt in
                "Mentalist")
                    echo -e "${YLW}Mentalist is a Graphical password creation tool"
                    ./modules/passtools/Mentalist
                    ;;

                "DCipher")
                    echo -e "${YLW}Decipher hashes using online rainbow & lookup table attack services.${NC}"
                    ./modules/passtools/dcipher.sh
                    ;;

                "Back")
                    exmods
                    ;;

            esac
        done
    echo -e "${NC}"
}
# Exploitation Modules
ex_mods(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Exploitation Tools"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("Microsoft Explicit" "BruteDUM" "TigerShark" "Web Exploiters" "Search for Exploits" "Post-Exploitation" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "Microsoft Explicit")
                        echo -e "${YLW}These tools are used to exploit MicroSoft systems${NC}"
                        sleep 3
                        ms_tools
			            ;;

                    "BruteDUM")
                        bruters
                        ;;

                    "TigerShark")
                        echo -e "${YLW}TigerShark is a multi-tooled phishing framework${NC}"
                        sleep 3
                        ./modules/exmods/tiger.sh
                        ;;

                    "Web Exploiters")
                        echo -e "${YLW}These tools are aimed at exploiting websites${NC}"
                        sleep 3
                        web_tools
                        ;;

                    "Search for Exploits")
                        echo -e "${YLW}These tools allow you to search to certain exploits or vulnerabilities${NC}"
                        sleep 3
                        search_tools
                        ;;

                    "Post-Exploitation")
                        post_ex
                        ;;

                    "Back")
                        modules
                        ;;

                    "Quit")
                        exit 2
                        ;;

                esac
        done
    echo -e "${NC}"
}
# BruteForce Modules
bruters(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "BruteDUM"
    echo -e "${ORNG}"
    echo -e "${YLW}BruteDUM is a bruteforcing tool that consists of Medusa, nCrack, Hydra${NC}"
    sleep 3
    ./modules/exmods/brutedum.sh
}
sdog(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "SayDog"
    echo -e "${ORNG}"
    echo -e "${YLW}SayDog is a multi-purpose exploitation tool. Aimed at web exploitation and vuln-analysis${NC}"
    sleep 3
    ./modules/dommods/sdog.sh
}
# Exploit Searchers
search_tools(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "Exploit Finders"
    echo -e "${ORNG}"
    PS3='What tool would you like to use?'
        options=("ShodanSploit" "FindSploit" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "ShodanSploit")
                        echo -e "${YLW}ShodanSploit allows for shodan searches to be done quickly from the terminal${NC}"
                        sleep 3
                        ./modules/exmods/ssploit.sh
                        ;;

                    "FindSploit")
                        echo -e "${YLW}This tool allows you to search, copy or compile exploits${NC}"
                        sleep 3
                        ./modules/exmods/fsploit.sh
                        ;;

                    "Back")
                        modules
                        ;;

                    "Quit")
                        exit
                        ;;

                esac
        done
    echo -e "${NC}"
}
# MicroSoft Exploitation
ms_tools(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "MicroSoft Exploitation Tools"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("ActiveReign" "iSpy" "FuzzyDander" "NeverMore" "SMBGhost" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
			              "ActiveReign")
			                    echo -e "${YLW}ActiveReign is a LDAP Network-Attack toolkit${NC}"
                                sleep 3
                                ./modules/exmods/ar3.sh
			                    ;;

                          "iSpy")
                                echo -e "${YLW}iSpy is a Microsft '${UBLUE}blue${NC}${YLW}' vulnerability scanner${NC}"
                                sleep 3
                                ./modules/exmods/ispy.sh
			                    ;;

                            "FuzzyDander")
                                echo -e "${LP}FuzzBunch & DanderSpritz Framework,"
                                echo -e "codename:${RED}FuzzyDander${NC}"
                                echo -e "${YLW}If you do not know what these tools are or how they work,\nyou should not be using them. As such no instructions will be added.${NC}"
                                if [[ ! -f '/opt/sifter/modules/exmods/fuzzdander.sh' ]]; then
                                    echo -e "${URED}You do not have this module, please post an issue request on github or send me \n an email at s1l3n7h0s7@gmail.com and it will be sent to you with install instructions${NC}"
                                else
                                    echo -e "${W}Would you like to continue?(y/n)${NC}"
                                    read M_ANS
                                    if [[ ${M_ANS} == 'y' ]]; then
                                        ./modules/exmods/fuzzydander.sh
                                    else
                                        ex_mods
                                    fi
                                fi
                                ms_tools
                                ;;

                            "NevrrMore")
                                ./modules/exmods/nvrmore.sh
                                ;;

                            "SMBGhost")
                                echo -e "${LP}SMBGhost scans for the CVE-2020-0796 vulnerability in Windows SMB3 protocol${NC}"
                                sleep 3
                                ./modules/exmods/smbghost.sh
                                ;;

                            "Back")
                                modules
                                ;;

                           "Quit")
                                exit
                                ;;
                esac
        done
    echo -e "${NC}"
}
# DDoS Tools
ddos(){
      cd /opt/sifter
      echo -e "${RED}"
      figlet -f mini "DDoS Tools"
      echo -e "${ORNG}"
      PS3='What tool would you like to use?'
        options=("Dark Star" "Impulse" "Back" "Quit")
        select opt in "${options[@]}"
        do
            case $opt in
                "Dark Star")
                    ./modules/exmods/dark_star.sh
                    ;;

                "Impulse")
                    ./modules/exmods/impulse.sh
                    ;;

                "Back")
                    webex
                    ;;

            esac
        done
    echo -e "${NC}"
}       
# Router Tools
routertools(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "Router Tools"
    echo -e "${ORNG}"
    PS3='What tool would you like to use?'
        options=("MkCheck" "RouterSploit" "Back" "Quit")
        select opt in "${options[@]}"
        do
            case $opt in
                "MkCheck")
                    cd /opt/MkCheck
                    sudo ./mkcheck
                    ;;

                "RouterSploit")
                    cd /root/routersploit
                    sudo python3 rsf.py
                    ;;

                "Back")
                    modules
                    ;;

                "Quit")
                    exit
                    ;;
            esac
        done
    echo -e "${NC}"
}      
# Web Exploitation
webex(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Website Exploitation Tools"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("DDoS" "NekoBot" "xShock" "VulnX" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "NekoBot")
                        echo -e "${YLW}NekoBot is a Web-Shell exploitation framework${NC}"
                        ./modules/exmods/nekobot.sh
                        ;;

                    "DDoS")
                        ddos
                        ;;

                    "xShock")
                        echo -e "${YLW}xShock is a shellshock exploitation tools${NC}"
                        sleep 3
                        ./modules/exmods/xshock.sh
                        ;;

                    "VulnX")
                        ./modules/exmods/vulnx.sh
                        ;;

			        "Back")
                        modules
                        ;;

                    "Quit")
                        exit
                        ;;
                esac
        done
    echo -e "${NC}"
}
# XSS Checkers
xssmods(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "WebAppplication Scanners"
    echo -e "${ORNG}"
    PS3='What tool would you like to use?'
          options=("XSS-Strike" "XSS-Freak"" "Back" "Quit")
          select opt in "${options[@]}"
          do
            case $opt in
                "XSS-Strike")
                    ./modules/webapps/xsstrike.sh
                    ;;

                "XSS-Freak")
                    ./modules/webapps/xssfreak.sh
                    ;;

                "Back")
                    modules
                    ;;

                "Quit")
                    exit
                    ;;
            esac
          done
    echo -e "${NC}"
}
# Web-App Modules
webapps(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "WebAppplication Scanners"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("Sitadel" "BFAC" "AapFinder" "OneFind" "XSS" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                        "Sitadel")
                            ./modules/webapps/sitadel.sh
                            ;;

                        "AapFinder")
                            ./modules/webapps/aapfinder.sh
                            ;;

                        "BFAC")
                            ./modules/webapps/bfac.sh
                            ;;

                        "OneFind")
                            ./modules/webapps/onefind.sh
                            ;;

                        "XSS")
                            xssmods
                            ;;

                        "Back")
                            modules
                            ;;

                        "Quit")
                            exit
                            ;;
                esac
        done
    echo -e "${NC}"
}
# Host Check
check_hosts(){
    TARLIST=$(cat /opt/sifter/files/host_list.txt | grep "eg. target.com")
    if [[ ${TARLIST} == "eg. target.com" ]]; then
        rm /opt/sifter/files/host_list.txt
        echo -e "${RED}Please add an appropriate target first${NC}"
        nano /opt/sifter/files/host_list.txt
    else
        sleep 1
    fi
    echo -e "${ORNG}Host Check${NC}"
    	echo -e "${ORNG}***********${NC}"
        if [[ -f 'files/pingtest_raw.pass' ]]; then
    	    rm files/pingtest_raw.pass
        fi
        if [[ -f 'files/pingtest.pass' ]]; then
            rm files/pingtest.pass
        fi
        if [[ -f 'files/pingtest_pass.txt' ]]; then
            rm files/pingtest_pass.txt
        fi

    	for name in `cat files/host_list.txt`

    	        do
    	            ping -c 1 $name
    	                if [[ $? == 0 ]]; then
    	                    echo -e "${LP}=================="
    	                    echo -e "${LP} ${name} Alive ${NC}" && echo ${name} >> files/pingtest_raw.pass
    	                    echo -e "${LP}==================${NC}"
    	                else
    	                    echo -e "${RED}=================="
    	                    echo -e "${RED} ${name} Dead ${NC}" && echo ${name} >> files/pingtest_raw.fail
    	                    echo -e "${RED}==================${NC}"
    	                fi
    	        done

	                sleep 5

            echo "============================================================================================================================="

        	    echo -e "${LP}Pingtest_Pass${NC}"
            	echo -e "${LP}*************${NC}"
		        cat files/pingtest_raw.pass | sort | uniq > files/pingtest.pass
        	    echo -e "${YLW}"
		        cat files/pingtest.pass
		        echo -e "${NC}"
		        sed -e 's/^/http:\/\//' files/pingtest.pass > files/pingtest_pass.txt

        	    echo "============================================================================================================================="

	            echo -e "${RED}Pingtest_Fail${NC}"
	            echo -e "${RED}*************${NC}"
	            cat files/pingtest_raw.fail | sort | uniq > files/pingtest.fail
	            echo -e "${YLW}"
		        cat files/pingtest.fail
		        echo -e "${NC}"
	            sleep 5
        	    menu
}
# List Argument Options Settings Below
ip_add(){
    echo -e "${W}Please enter your target:${NC}"
    read IP_ANS
    sleep 1
    echo "$IP_ANS" >> files/host_list.txt
    ip_q
}
ip_q(){
    echo -e "${W}Would you like to add another?y/n${NC}"
    read ANS
    sleep 1
    if [[ $ANS == 'y' ]]; then
        ip_add
    else
        menu
    fi
}
# Result Options
result_choices(){
    echo -e "${ORNG}"
    ls
    echo -e "${NC}"
    PS3='What would you like to do?'
            options=("Check File" "Check Image" "Change Directory" "Back")
            select opt in "${options[@]}"
            do
                    case $opt in
                            "Check File")
                                echo -e "${W}Please enter the file name${NC}"
                                read FNAME
                                if [[ ! -f '${FNAME}' ]]; then
                                    echo -e "${FNAME} is a directory, please try changing directories instead.${NC}"
                                else
                                    echo -e "${W}==========================================================================${NC}"
                                    cat ${FNAME}
                                    kdialog --geometry 600x800 --textbox ${FNAME}
                                    echo -e "${W}==========================================================================${NC}"
                                fi
                                result_choices
                                ;;

                             "Check Image")
                                echo -e "${W}Please enter the image name${NC}"
                                read INAME
                                eom ${INAME}
                                result_choices
                                ;;

                            "Change Directory")
                                echo -e "${W}Please enter the directory name${NC}"
                                read DIR_NAME
                                # shellcheck disable=SC2164
                                cd ${DIR_NAME}
                                result_choices
                                ;;

                            "Back")
                                cd /opt/sifter
                                modules
                                ;;

                    esac
            done
    echo -e "${NC}"
}
# Results
results(){
    echo -e "${YLW}Results"
    echo -e "${LP}*******${NC}"
    echo -e "${LP}"
    # shellcheck disable=SC2164
    cd /opt/sifter/results
    ls
    echo -e "${W}Please enter the name of the result directory you'd like to see${NC}"
    read DNAME
    # shellcheck disable=SC2164
    cd ${DNAME}
    echo -e "${LP}"
    ls
    result_choices
    # shellcheck disable=SC2164
    cd /opt/sifter
}
# Module Menu
modules(){
    echo -e "${URED}Modules${NC}"
    echo -e "${ORNG}"
    PS3='What would you like to do?'
            options=("Information Gatherers" "Domain Recon Gathering" "Network Scanners" "Website Scanners & Enumerators" "Vulnerability Scanners" "HoneyPot Detection Systems" "Router Tools" "Exploitation Tools" "WebAppplication Scanners" "Password Tools" "View Results" "Main Menu" "Module Info" "Pass Time" "Quit")
            select opt in "${options[@]}"
            do
                    case $opt in
                            "Information Gatherers")
                                info_mods
                                ;;

                            "Domain Recon Gathering")
                                dom_mods
                                ;;

                            "Network Scanners")
                                net_mods
                                ;;

                            "Website Scanners & Enumerators")
                                web_mods
                                ;;

                            "Vulnerability Scanners")
                                vuln_mods
                                ;;

                            "HoneyPot Detection Systems")
                                honey_mods
                                ;;

                            "Router Tools")
                                routertools
                                ;;

                            "Exploitation Tools")
                                ex_mods
                                ;;

			                "WebAppplication Scanners")
			                    webapps
			                    ;;

                            "Password Tools")
                                passtools
                                ;;

                            "View Results")
                                results
                                ;;

                            "Module Info")
                                ./info/info.sh
                                ;;

                            "Main Menu")
                                menu
                                ;;

                            "Pass Time")
                                echo -e "${RED}This module is to pass some time during long scans \nsuch as nMap (Full Port Scan) or RapidScan${NC}"
                                echo -e "${W}Would you like to continue? (${YLW}y${W}/${YLW}n${W})"
                                read PTOPT
                                if [[ ${PTOPT} == 'y' ]]; then
                                    firefox https://github.blog/2020-05-15-ludum-dare-46-staff-picks &
                                else
                                    modules
                                fi
                                ;;

                            "Quit")
                                exit
                                ;;
                    esac
            done
    echo -e "${NC}"
}
# Menu
menu(){
     if [[ -d '/opt/sifter/results' ]]; then
        sleep 1
    else
        mkdir /opt/sifter/results
    fi
    echo -e "${INV}${LGRY}"
    python3 extras/ban.py
    echo -e "${LP}"
    python3 extras/ban2.py
    echo -e "${LGRY}==============${W}Hit ${YLW}Ctrl + C${W} at any time to quit ${UPURPLE}Sifter${NC}${LGRY}==============${NC}"
    arg=$1
    echo -e "${ORNG}"
    PS3='What would you like to do?'
            options=("Check Hosts" "Edit Host List" "Parse Results to Modules" "Update" "Quit")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Check Hosts")
                        TARLIST=$(cat files/host_list.txt | grep "eg. target.com")
                        if [[ ${TARLIST} == "eg. target.com" ]]; then
                            rm /opt/sifter/files/host_list.txt
                            touch /opt/sifter/files/host_list.txt
                            echo -e "${W}Please add targets to the list${NC}"
                            sleep 2
                            nano /opt/sifter/files/host_list.txt
                        else
                            sleep 1
                        fi
                        check_hosts
                        ;;

                    "Edit Host List")
                        nano /opt/sifter/files/host_list.txt
                        ;;

                    "Parse Results to Modules")
                        modules
                        ;;

		    "Update")
		        update
                        reset
                        sifter
                        ;;

                    "Quit")
                        exit 2
                        ;;
                esac
            done
    echo -e "${NC}"
}
# Update Arg
up_arg(){
    echo $1 >> temp.log
    echo $2 >> temp.log
    echo $3 >> temp.log
    echo $4 >> temp.log
    echo $5 >> temp.log
    echo $6 >> temp.log
    echo $7 >> temp.log
    echo $8 >> temp.log
    echo $9 >> temp.log

    for UFILES in `cat temp.log`
       	        do
    	            rm ${LPATH}${UFILES}
                done
    rm /opt/sifter/temp.log
}
update(){
    sudo chown $USER:$USER -R /opt/sifter
    cd /opt/sifter
    echo -e "${ORNG}"
    figlet -f mini "Checking for updates"
    echo -e "${NC}"
    git fetch
    VER=$(git pull)
    if [[ ${VER} == "Already up to date." ]]; then
        echo -e "${LP}"
        figlet -f mini "Up to date."
        echo -e "${NC}"
    else
	    sleep 5
	    echo -e "${W}Are there pull conflicts with files?(${YLW}y/n${W})${NC}"
      	    sleep 3
	    read UANS
	    if [[ ${UANS} == "y" ]]; then
            export LPATH
            echo -e "${W}Please enter the conflicting files (seperated by a space)${NC}"
		    read FILES
                    sleep 2
		    up_arg ${FILES}
		    git pull
	    fi
        ./install.sh
        sudo cp sifter -t /usr/sbin
        sudo chown $USER:$USER /opt/sifter --recursive
        sudo chown $USER:$USER /usr/sbin/sifter
        chmod +x /opt/sifter --recursive
        chmod +x /usr/sbin/sifter
        echo -e "${W}Done!${NC}"
    fi
}

cd /opt/sifter
while getopts "a:bndwirmepcvuhz" options
    do            	# Loop: Get the next option;
	case "${options}" in                                	# use silent error checking;
                                                            # option a takes 1 arguments.
		c)
			echo -e "${YLW}"
			figlet -f mini "Checking for live targets..."
			echo -e "${NC}"
			check_hosts
            		modules
			;;

		a)
			echo -e "${ORNG}"
			figlet -f mini "Adding $ARG to host list"
			echo -e "${NC}"
	                TARLIST=$(cat /opt/sifter/files/host_list.txt)
            		if [[ ${TARLIST} == "eg. target.com" ]]; then
                 		rm /opt/sifter/files/host_list.txt
                		touch /opt/sifter/files/host_list.txt
            		fi
			echo "$ARG" >> files/host_list.txt
			sleep 2
			modules
			;;

		i)
			echo -e "${LP}"
			figlet -f mini "Info Gatherers"
			echo -e "${NC}"
			cred_mods
			;;

		d)
			echo -e "${LP}"
			figlet -f mini "Domain-Fuzzers"
			echo -e "${NC}"
			dom_mods
			;;

		e)
			echo -e "${LP}"
			figlet -f mini "Exploitative Modules"
			echo -e "${NC}"
			ex_mods
			;;

		n)
			echo -e "${LP}"
			figlet -f mini "Network Mappers"
			echo -e "${NC}"
			net_mods
			;;

		v)
			echo -e "${LP}"
			figlet -f mini "Vulnerability Scanners"
			echo -e "${NC}"
			vuln_mods
			;;

		b)
			echo -e "${LP}"
			figlet -f mini "Web-Application Testers"
			echo -e "${NC}"
			webapps
			;;

        p)
            echo -e "${LP}"
            figlet -f mini "Password Tools"
            echo -e "${NC}"
            passtools
            ;;

		w)
			echo -e "${LP}"
			figlet -f mini "Web Recon"
			echo -e "${NC}"
			web_mods
			;;

        r)
            echo -e "${LP}"
            figlet -f mini "Sifter Results"
            echo -e "${NC}"
            results
            ;;

        u)
            update
      		;;

		h)
			echo -e "${RED}"
			figlet "SifteR"
			echo -e "${NC}"
			usage
			;;

        z)
            echo -e "${RED}"
            figlet -f mini "Module Info"
            echo -e "${NC}"
            ./info/info.sh
            ;;

        m)
	    echo -e "${INV}${LGRY}"
	    python3 extras/ban.py
            echo -e "${RED}"
            figlet -f mini "Modules"
            echo -e "${NC}"
            modules
            ;;

        *)
            echo -e "${RED}No valid option was chosen, defaulting to Main Menu${NC}"
            menu
            ;;

	esac
done
if [[ $OPTIND == 1 ]]; then				# if no option is passed
	menu		  	                    # default command is run
fi
exit 0
