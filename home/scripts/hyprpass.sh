#!/usr/bin/env bash

# Default values
database=""
mode=""

while getopts "npd:" flag; do
  case $flag in
    n)
      if [[ $mode == "" ]]
      then
        mode="name"
      elif [[ $mode == "password" ]]
      then
        mode="both"
      fi
    ;;
    p)
      if [[ $mode == "" ]]
      then
        mode="password"
      elif [[ $mode == "name" ]]
      then
        mode="both"
      fi
    ;;
    d)
      database=$OPTARG
    ;;
    \?)
      exit 1
  esac
done

if [[ $database == "" ]]
then
  echo "database not specified"
  exit 1
fi

password=$(echo "" | tofi --prompt-text="Enter Password: " --hide-input=true --hidden-character="*" --require-match=false)
if [[ $password == "" ]]; then exit 1; fi;

list=$(echo "$password" | keepassxc-cli ls -qRf "$database")
selection=$(echo "$list" | tofi --prompt-text="Select Entry: ")

attributes=$(echo "$password" | keepassxc-cli show -q -a "Username" -a "Password" "$database" "$selection")
name=$(echo "$attributes" | head -1)
cred=$(echo "$attributes" | tail -1)

case $mode in
  both)
    sequence="$name\t$cred"
  ;;
  name)
    sequence="$name"
  ;;
  password)
    sequence="$cred"
  ;;
esac

ydotool type "$sequence"
