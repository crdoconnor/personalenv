#!/bin/bash
# SCRIPT: digclock.sh
# USAGE: ./digiclock &
# PURPOSE: Displays time and date in the top right corner of the
# screen using tput command.
# To stop this digclock use command "kill pid"
################################################################

####################### VARIABLE DECLARATION ###################

# To place the clock on the appropriate column, subtract the
# length of $Time and $Date, which is 22, from the total number
# of columns

Columns=$(tput cols)
Startpoint=$(($Columns-22))

# If you're in an X Window System terminal,you can resize the
# window, and the clock will adjust its position because it is
# displayed at the last column minus 22 characters.

Color1=`tput setab 2` # Green background color for time
Color2=`tput setab 6` # Cyan background color for date
Normal=`tput sgr0` # back to normal screen colors

####################### MAIN PROGRAM ###########################

# The script is executed inside a while without conditions

while :
do
Time=`date +%r`
Date=`date +"%d-%m-%Y"`
tput sc #Save the cursor position&attributes
tput cup 0 $Startpoint

# You can also use bellow one liner
# tput cup 0 $((`tput cols`-22))
# But it is not efficient to calculate cursor position for each
# iteration. That's why I placed variable assignment before
# beginning of the loop.

# print time and date in the top right corner of the screen.

echo -n $Color1$Time $Color2$Date$Normal

# restore the cursor to whatever was its previous position

tput rc

# Delay for 1 second

sleep 1

done
