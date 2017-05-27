#!/bin/sh

# populate $forest with the name of your forest
forest="forest.com"

# Can you see your AD servers?
host -t SRV _ldap._tcp.$forest > /dev/null

if [ $? -eq 0 ]
then
	# Get the name of our computer record
	compname=`dsconfigad -show|grep "Computer Account"|awk '{print $4}'`
	
	# See if compname got set
	if [ "$compname" != "" ] 
	then
		# Can we read our own computer record?
		dscl /Search -read /Computers/$compname > /dev/null
		if [ $? -eq 0 ]
		then	
			# Get the name of the domain we're bound to
			domain=$( dsconfigad -show|grep "Active Directory Domain"|awk {'print $5'}|sed 's/\..*//' )
			echo "<result>$domain</result>"
		else
			# Mac has record of bind, but we're not bound
			echo "<result>Broken</result>"
		fi
	else
		# $compname empty, not bound
		echo "<result>Unbound</result>"
	fi
fi

exit 0
