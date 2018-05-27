#!/bin/bash
. ~/.bash_profile

########### SIGINT handler ############
function _int() {
   /ouaf/DEMO/bin/splenviron.sh -e DEMO -c "spl.sh start"
}

########### SIGTERM handler ############
function _term() {
   /ouaf/DEMO/bin/splenviron.sh -e DEMO -c "spl.sh start"
}

########### SIGKILL handler ############
function _kill() {
   /ouaf/DEMO/bin/splenviron.sh -e DEMO -c "spl.sh start"
}

###################################
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
############# MAIN ################
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
###################################

# Set SIGINT handler
trap _int SIGINT

# Set SIGTERM handler
trap _term SIGTERM

# Set SIGKILL handler
trap _kill SIGKILL

# Install Microfocus license
sudo /home/cissys/install_mf_license.sh

# Start CC&B Demo env
/ouaf/DEMO/bin/splenviron.sh -e DEMO -c "spl.sh start"

sleep 10

# Tail on alert log and wait (otherwise container will exit)
echo "The following output is now a tail of the alert.log:"
tail -f /ouaf/DEMO/logs/system/myserver.log &
childPID=$!
wait $childPID
