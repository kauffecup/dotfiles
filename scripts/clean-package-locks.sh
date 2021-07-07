#!/bin/bash

############################################################################
# What is this?
############################################################################
#
# This script will look at your changed files in git,
# and automatically revert any changes to the artifactory registry URL.
#
# It only changes lines that have been changed in the current git diff;
# Changes made in unaffected files or previous commits will not be touched.
# It also only targets your package-lock and npm-shrinkwrap.json files.
#
# This is to alleviate an ongoing issue we've had,
# where the registry URLs flip back and forth between two URLs.
#
############################################################################
# INSTRUCTIONS:
############################################################################
#
# You can copy + paste this script directly into your terminal,
# only if you are running bash as your shell.
# It will not work as expected if run directly from a ZSH shell,
# and probably not from any other shell.
#
# The recommended way to use this script is to save it to a file
# available in your PATH:
# - paste this script into a new file at /usr/local/bin/clean-package-locks
# - run `chmod +x /usr/local/bin/clean-package-locks` to make it executable
#
# Now you can run `clean-package-locks` anywhere inside of a git repo
# when you have unexpected package-lock or npm-shrinkwrap changes.
#
############################################################################


badUrl='artifactory.squarespace.net\/'
goodUrl='artifactory.squarespace.net:443\/artifactory\/'

getChangedLines() {
  git diff --unified=0 --diff-filter=M HEAD | \
  grep -v -e '^[+-]' -e '^index' | \
  sed 's/diff --git a.* b\//\n/g' | \
  sed 's/.*@@\(.*\)@@.*/\1/g' | \
  sed 's/^ -//g' | \
  sed 's/,[0-9]*//g' | \
  sed 's/\(^[0-9]*\).*+//g' | \
  sed '1s/^\n//g' | \
  tr '\n' ' ' | \
  sed 's/   /:/g' | \
  sed 's/  / /g' | \
  sed 's/^ //g' | \
  sed 's/ $//g' | \
  sed 's/:/\n/g' | \
  grep 'package-lock.json\|npm-shrinkwrap.json'
}

workingdir=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z $workingdir ]; then
   echo "not a git directory"
   exit 0 
fi

pushd $workingdir &>/dev/null

lines=$(getChangedLines 2>/dev/null)
if [ -z "$lines" ]; then
   echo "no changes to artifactory URLs in lockfiles were found"
   popd &>/dev/null;
   exit 0 
fi

IFS=$'\n'
for line in $lines
do
  IFS=$' ' read -d '' -ra arr <<< "$line"
  file=${arr[0]}
  numbers=${arr[@]:1}
  IFS=' ';
  commands=""
  for linenumber in $numbers
  do
    text=$(sed "${linenumber}q;d" "$file")
    if [[ "$text" =~ :443 ]]; then
      commands+=" -e \"${linenumber}s/$goodUrl/$badUrl/g\""
    else
      commands+=" -e \"${linenumber}s/$badUrl/$goodUrl/g\""
    fi
  done

  echo "reverting changes to artifactory URLs in \"${file}\"..."
  eval "sed -i .bak $commands $file"
  rm "${file}.bak"

  IFS=$'\n'
done
