#!/bin/sh

forest="forest.com"

host -t SRV _ldap._tcp.$forest > /dev/null

if [ $? -eq 0 ]
then
	# Get the name of our computer record
	compname=`dsconfigad -show|grep "Computer Account"|awk '{print $4}'`
	
	# See if compname got set and the dsconfigad command returned a 0
	if [ "$compname" != "" ] 
	then
		dscl /Search -read /Computers/$compname > /dev/null
		if [ $? -eq 0 ]
		then	
			domain=$( dsconfigad -show|grep "Active Directory Domain"|awk {'print $5'}|sed 's/\..*//' )
			echo "<result>$domain</result>"
		else
			echo "<result>Broken</result>"
		fi
	else
		echo "<result>Unbound</result>"
	fi
fi

exit 0
