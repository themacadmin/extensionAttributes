#!/bin/bash

# Does file at /path/to/file exist?
if [ -f /path/to/file ]
then
echo "<result>Yes</result>"
else
echo "<result>No</result>"
fi
exit 0
