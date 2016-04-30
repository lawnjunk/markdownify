\include "constants.sh"
\ifndef LOG
\define LOG
warn(){
  echo "${yellow_bold}WARNING:${white}" "$@" "${reset}"
}
notice(){
  echo "${cyan_bold}NOTICE:${white}" "$@" "${reset}"
}
die(){
  echo "${red_bold}FATAL ERROR:${white}" "$@" "${reset}"
  exit 1
}
\endif
