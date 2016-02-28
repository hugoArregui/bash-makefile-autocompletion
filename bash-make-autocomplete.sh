#!/bin/bash

function make_autocomplete() {
  local cur
  if [ -f 'Makefile' ]; then 
    cur="${COMP_WORDS[COMP_CWORD]}"
    TARGETS=`cat Makefile | grep -e '^[a-zA-Z0-9\-]\+:$' | cut -d: -f1 | tr '\n' ' '`
    COMPREPLY=( $(compgen -W "$TARGETS" -- $cur) )
  fi
}

complete -F make_autocomplete make
