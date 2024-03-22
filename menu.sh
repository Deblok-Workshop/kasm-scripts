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

# Underline
UBLACK='\033[4;30m'       # BLACK
URED='\033[4;31m'         # RED
UGREEN='\033[4;32m'       # GREEN
UYELLOW='\033[4;33m'      # YELLOW
UBLUE='\033[4;34m'        # BLUE
UPURPLE='\033[4;35m'      # PURPLE
UCYAN='\033[4;36m'        # CYAN
UWHITE='\033[4;37m'       # WHITE

# Background
On_BLACK='\033[40m'       # BLACK
On_RED='\033[41m'         # RED
On_GREEN='\033[42m'       # GREEN
On_YELLOW='\033[43m'      # YELLOW
On_BLUE='\033[44m'        # BLUE
On_PURPLE='\033[45m'      # PURPLE
On_CYAN='\033[46m'        # CYAN
On_WHITE='\033[47m'       # WHITE

# High Intensity
IBLACK='\033[0;90m'       # BLACK
IRED='\033[0;91m'         # RED
IGREEN='\033[0;92m'       # GREEN
IYELLOW='\033[0;93m'      # YELLOW
IBLUE='\033[0;94m'        # BLUE
IPURPLE='\033[0;95m'      # PURPLE
ICYAN='\033[0;96m'        # CYAN
IWHITE='\033[0;97m'       # WHITE

# Bold High Intensity
BIBLACK='\033[1;90m'      # BLACK
BIRED='\033[1;91m'        # RED
BIGREEN='\033[1;92m'      # GREEN
BIYELLOW='\033[1;93m'     # YELLOW
BIBLUE='\033[1;94m'       # BLUE
BIPURPLE='\033[1;95m'     # PURPLE
BICYAN='\033[1;96m'       # CYAN
BIWHITE='\033[1;97m'      # WHITE

# High Intensity backgrounds
On_IBLACK='\033[0;100m'   # BLACK
On_IRED='\033[0;101m'     # RED
On_IGREEN='\033[0;102m'   # GREEN
On_IYELLOW='\033[0;103m'  # YELLOW
On_IBLUE='\033[0;104m'    # BLUE
On_IPURPLE='\033[0;105m'  # PURPLE
On_ICYAN='\033[0;106m'    # CYAN
On_IWHITE='\033[0;107m'   # WHITE


# Menu
VERSION=1.0


clear

printf "$YELLOW---$OFF$BGREEN kasm-scripts Menu $BLUE(v$VERSION)$OFF $YELLOW---\n"
FILES=$(curl -s -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/Deblok-Workshop/kasm-scripts/contents/" 2>/dev/null \
    | jq -r '.[] | select(.type == "file") | .name')

printf "$OFF"

SELECTED=0
counter=0
while IFS= read -r filename; do
    if [ "$counter" -eq "$SELECTED" ]; then
        printf "$BBLUE- $BLUE$filename\n"
    else
        printf "  $filename\n"
    fi
    ((counter++))
done <<< "$FILES"


printf "$OFF\n"