#!/bin/bash

# Is either or both of two files missing?
if [ ! -f /path/to/file1 ] || [ ! -f /path/to/file2 ]
then
echo "<result>No</result>"
else
echo "<result>Yes</result>"
fi
exit 0
