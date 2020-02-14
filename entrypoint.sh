#!/bin/bash

# Logging functions
log_inf() {
  local msg="$1"
  ts=$(date '+%Y-%m-%d %H:%M:%S')
  echo -e "\n[$ts] [INFO] $msg\n"
}

if [[ $(echo "$@" | grep -qE "^reporter" -) ]]; then
  log_inf "Generating report..."
  arachni_reporter /report/report.afr --reporter=html:outfile=/report/report.html.zip
elif [[ -z "$@" ]]; then
  log_inf "Displaying help..."
  arachni -h
else
  log_inf "Scanning : $@ ..."
  arachni --report-save-path /report/report.afr "$@"
  arachni_reporter /report/report.afr --reporter=html:outfile=/report/report.html.zip
fi
chmod -R 777 /report