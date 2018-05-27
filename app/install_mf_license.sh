#!/bin/bash

export COBDIR=/opt/SPLcobAS51

expect -c '
set timeout 2
spawn "/opt/SPLcobAS51/aslmf/apptrack"
expect "(6 spaces removes password)" { send "      " }
expect "Please re-enter the new password" { send "      " }
expect "Enter the Menu Selection" { send "3" }
expect "Enter the Serial Number part of the License Key:" { send "ORACLE_UTS30DAY32\n" }
expect "Enter the License Number part of the License Key:" { send "04038 10780 64AAF 5F705 7CD9 ILA\n" }
expect "Enter the Menu Selection" { send "6" }
expect "Enter the Menu Selection" { send "9" }
interact
'
