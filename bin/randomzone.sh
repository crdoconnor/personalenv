#!/bin/bash
tzwatch -f %H:%M | sort -R | sed "s/\s\sEurope\///g" | sed "s/\s\sAmerica\///g" | sed "s/\s\sAsia\///g" | sed "s/_/ /g" | head -n 1
