#!/bin/bash


#######################
###Admin credentials###
#######################
adminUser=$4
adminPassword=$5

currentUser=$(who | grep "console" | cut -d" " -f1)

userPwd=$(osascript << EOF

text returned of (display dialog "Updating password for $currentUser. Please enter your new password" default answer "xxxxxxxxx" buttons {"OK"} default button 1 with hidden answer)

EOF

)

echo "Enabling Secure token for $currentUser"

sysadminctl -adminUser $4 -adminPassword $5 -secureTokenOn $currentUser -password $userPwd

2. Generate Bootstrap token based off of Secure token status. As in Scenario A, the intended User can now generate their Bootstrap token using the below commands in terminal.

sudo profiles install -type bootstraptoken

sudo profiles status -type bootstraptoken