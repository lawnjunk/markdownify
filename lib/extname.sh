\ifndef EXTNAME
\define EXTNAME
extname(){
  local filepath
  filepath="$1"
  echo "${filepath/*./}"
}
\endif
