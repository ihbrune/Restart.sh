# Restart.sh
A Bash script for graceful restarts

# Purpose

Provides a script template that:

1. Stops a running process
2. Gives the process a maximum time to terminate itself. With regular checks if this has already happend
3. Kills the process (SIGKILL) if it refuses to stop after the maximum time 
4. Restarts the process

I build this script as part of a cronjob for restarting server processes. These processes take some time to stop and sometimes they refuse to stop at all.

# Contents

The template is contained in **restart.sh**. Use this for you own script.

*dummy.sh* is a small script for testing *restart.sh*.

# Customization

The script was developed under MacOS. Take a look at the hints in *restart.sh* and do some tests with *dummy.sh* before deploying into production.
