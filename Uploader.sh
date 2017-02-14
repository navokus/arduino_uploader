#!/bin/sh
PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin
echo "[+] Check nrfutil"
nrfutil version 2>/dev/null 1>&2
if [ "$?" != 0 ]; then
    echo "nrfutil not found! It could be a missing PATH to the tool or nrfutil is not installed"
    echo "  * Please check PATH or install nrfutil version 0.5.1!"
    echo "  * Please be noted that other version does not work!"
    echo "- Current PATH:"
    echo $PATH
    echo "- nrfutil installation syntax:"
    echo "sudo pip install nrfutil==0.5.1"
    exit 1
fi
echo "[+] nrfutil installed"
echo $1 $2 $3 $4 $5
echo "[+] Start upload firmware to device"
nrfutil --verbose dfu genpkg --application $2 $3 && nrfutil --verbose dfu serial -pkg $3 -p $4 -b $5 && rm -rf $3
echo "[+] Done" 
exit 0
