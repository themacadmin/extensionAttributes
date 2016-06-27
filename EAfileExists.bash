#!/bin/bash

# Does file at /path/to/file exist?
if [ ! -f /path/to/file ]
then
echo "<result>No</result>"
else
echo "<result>Yes</result>"
fi
exit 0
