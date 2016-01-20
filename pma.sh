#!/bin/bash
# 
# phpmyadmin-fixer
#
# Fixes for phpmyadmin (configuration storage and some extended features)
#
# If you're tired from message - "The phpMyAdmin configuration storage 
# is not completely configured, some extended features have been deactivated", 
# this patch for you ;-)
#
#
# https://github.com/skurudo/phpmyadmin-fixer
# Author - Pavel Galkin (https://skurudo.ru)
#
# Code for OS check / admin check / check curl/wget 
# by Serghey Rodin (https://vestacp.com) from (https://github.com/serghey-rodin/vesta/)
#
# ...
#
# root check
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

# Detect OS
case $(head -n1 /etc/issue | cut -f 1 -d ' ') in
    Debian)     type="debian" ;;
    Ubuntu)     type="ubuntu" ;;
    CentOS)     type="centos" ;;
    *)          type="centos" ;;	
esac

# Check wget
if [ -e '/usr/bin/wget' ]; then
    wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-$type.sh -O pma-$type.sh
    if [ "$?" -eq '0' ]; then
        bash pma-$type.sh $*
        exit
    else
        echo "Error: pma-$type.sh download via wget failed."
        exit 1
    fi
fi

# Check curl
if [ -e '/usr/bin/curl' ]; then
    curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-$type.sh
    if [ "$?" -eq '0' ]; then
        bash pma-$type.sh $*
        exit
    else
        echo "Error: pma-$type.sh download via curl failed."
        exit 1
    fi
fi

exit


