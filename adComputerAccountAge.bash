#!/bin/bash

# By AD defaults, computer accounts expire every 30 days (can be modded by AD admins).
# These accounts are automatically refreshed so long as the computer can contact a DC.
# If a computer fails to contact a DC to refresh the computer account, bind breaks.
# If this keychain entry is > 30 days old, you probably have a broken binding.

domain=$( dsconfigad -show|grep "Active Directory Domain"|awk {'print $5'}|sed 's/\..*//'|tr '[:lower:]' '[:upper:]' )

moddate=$( security find-generic-password -l "/Active Directory/$domain"|grep cdat|awk '{print $2}'|sed 's/\"//g' |cut -c 1-8 )

formatteddate=$( date -j -f %Y%m%d $moddate +%Y-%m-%d )

if [[ $formatteddate =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
  then echo "<result>$formatteddate</result>"
  else echo "<result>Error Bad Date</result>"
fi

exit 0
