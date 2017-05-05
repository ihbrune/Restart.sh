#!/bin/bash

# Pattern which identifies the process to be stopped in 'ps' results:
PROC_NAME="dummy.sh"

# Ensure your 'ps' command prints the PID in the frist row, otherwise
# change 'awk'. There is a second 'ps' down below:
PID=$( ps -axww | grep $PROC_NAME | grep -v grep | awk '{print $1}' )

# Command to stop the process normally: 
STOP_CMD="kill $PID"
# Command to start the process normally:
START_CMD="echo Set me!"

# Wait time, after which the process termination is reviewed again:
WAIT_STEP=1
# Maximum wait time for normal process termination:
WAIT_MAX=30

if [ ! -z "$PID" ]; then
    echo Stopping PID $PID
    $STOP_CMD

    until [ -z "$(ps -ax | grep "^ *$PID " | grep -v grep)" ]; do
	if [ "$WAIT_MAX" -gt 0 ]; then
	    sleep $WAIT_STEP
	    let WAIT_MAX=WAIT_MAX-WAIT_STEP 
	    echo "Countdown is at $WAIT_MAX"
	else
	    echo "Wait is over!"
	    kill -9 $PID
	fi
    done
else
    echo "$PROC_NAME not found"
fi

# Add '&' if appropriate:
$START_CMD 
