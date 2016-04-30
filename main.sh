\define SHEBANG \#!/usr/bin/env bash
\SHEBANG

\include "log.sh"
\include "extname.sh"

\ifndef MAIN
\define MAIN
main(){
  local ext
  ext=$(extname "$1");
  warn "$ext"
  notice "$ext"
  die "$ext"
}
main "$@"
\endif
