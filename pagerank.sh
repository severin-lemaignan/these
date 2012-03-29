#! /bin/sh

{ date +%s ; make | awk '/Output written/ {print $5}' | awk '{sub(/\(/,"");print}' ; } | sed '{:q;N;s/\n/,/g;t q}' | awk '{printf("[%s],", $0)}'
