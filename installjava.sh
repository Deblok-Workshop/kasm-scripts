# Reset
OFF='\033[0m'       # Text Reset

# Regular Colors
BLACK='\033[0;30m'        # BLACK
RED='\033[0;31m'          # RED
GREEN='\033[0;32m'        # GREEN
YELLOW='\033[0;33m'       # YELLOW
BLUE='\033[0;34m'         # BLUE
PURPLE='\033[0;35m'       # PURPLE
CYAN='\033[0;36m'         # CYAN
WHITE='\033[0;37m'        # WHITE

# Bold
BBLACK='\033[1;30m'       # BLACK
BRED='\033[1;31m'         # RED
BGREEN='\033[1;32m'       # GREEN
BYELLOW='\033[1;33m'      # YELLOW
BBLUE='\033[1;34m'        # BLUE
BPURPLE='\033[1;35m'      # PURPLE
BCYAN='\033[1;36m'        # CYAN
BWHITE='\033[1;37m'       # WHITE

DEBIAN_FRONTEND=noninteractive

if [ "$EUID" -ne 0 ]; then
    printf "$BBLUE[i]$OFF |$BLUE This script needs to be run as root. Attempting to elevate...$OFF\n"
    sudo "bash" "$0" "$@"  
    exit $?
fi

printf "$BYELLOW[!]$OFF |$YELLOW At the moment, this only works for Debian/Ubuntu. $OFF\n"
printf "$BYELLOW[!]$OFF |$YELLOW Continuing in 3 seconds... $OFF\n"
sleep 3

printf "$BBLUE[i]$OFF |$BLUE Installing Java 17 (JDK)... $OFF\n"
cd ~
curl https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb > java.deb
apt install -y ./java.deb


if java --version; then
    printf "$BGREEN[i]$OFF |$GREEN Java has been successfully installed $OFF\n"
else
    printf "$BRED[!]$OFF |$RED Java did not successfully install. $OFF\n"
    exit 1
fi