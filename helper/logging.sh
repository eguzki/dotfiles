#!/bin/bash

#####################
# LOG FUNCTIONS
#####################
_message(){
   _error_color="\\033[37m\\033[1;31m" # BG light grey, FG red
   _warning_color="\\033[37m\\033[1;33m" # FG yellow
   _info_color="\\033[37m\\033[1;32m" # FG light green
   _debug_color="\\033[37m\\033[1;30m" # FG Dark Grey
   _default_log_color_pre="\\033[0m\\033[1;34m"
   _default_log_color_suffix="\\033[0m"
   isError=$(echo "$1" | { grep -i "\\[ERROR\\]" || test $? = 1; })
   isWarning=$(echo "$1" | { grep -i "\\[WARNING\\]" || test $? = 1; })
   isInfo=$(echo "$1" | { grep -i "\\[INFO\\]" || test $? = 1; })
   isDebug=$(echo "$1" | { grep -i "\\[DEBUG\\]" || test $? = 1; })
   outLog="/dev/stdout"
   if ! [ -z "$isError" ]; then 
      messageColor=${_error_color} && outLog="/dev/stderr" 
   else
      if ! [ -z "$isWarning" ]; then 
         messageColor=${_warning_color}
      elif ! [ -z "$isInfo" ]; then
         messageColor=${_info_color}
      elif ! [ -z "$isDebug" ]; then
         messageColor=${_debug_color}
      else      
         messageColor=${_default_log_color_pre}
      fi
   fi 
   echo -en "${messageColor}$1${_default_log_color_suffix}\n" >$outLog || echo "${messageColor}$1${_default_log_color_suffix}\n" >$outLog
}

##
# Logs with colors into Console and, if $2 has value, 
# without them into log file
# Input:
# *$1: Message
# $2: Log file
##
_log(){
   _message "[`date '+%Y-%m-%d %X'`] $1" 
   #
   if [[ -f "$2" ]]; then
     echo "[`date '+%Y-%m-%d %X'`] $1" >> "./$2"
   fi
}

_logError(){
  _log "[ERROR] $1" $2
}

_logWarn(){
  _log "[WARNING] $1" $2
}

_logInfo(){
  _log "[INFO] $1" $2
}

_logDebug(){
  _log "[DEBUG] $1" $2
}
