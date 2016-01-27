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
# Code for check curl/wget 
# by Serghey Rodin (https://vestacp.com) from (https://github.com/serghey-rodin/vesta/)
#
# ...
#
echo "Phpmyadmin fixes for configuration storage and some  extended features";
echo "................";
echo "Let's do it";
echo "............";
echo "..........";
echo ".........";
echo "........";
echo "......";

echo "Generate password for PMA (pma.txt)";
PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -c 32 ; echo`
echo "PMA Password = $PASS";

#centos phpmyadmin path
pmapath1="/etc/phpMyAdmin/config.inc.php"
cp $pmapath1 /root/config.inc.php.old

#delete old and paste new value 
sed -i '/pmadb/d' $pmapath1
sed -i '/controluser/d' $pmapath1
sed -i '/bookmarktable/d' $pmapath1
sed -i '/relation/d' $pmapath1
sed -i '/userconfig/d' $pmapath1
sed -i '/table_info/d' $pmapath1
sed -i '/column_info/d' $pmapath1
sed -i '/history/d' $pmapath1
sed -i '/recent/d' $pmapath1
sed -i '/table_uiprefs/d' $pmapath1
sed -i '/tracking/d' $pmapath1
sed -i '/table_coords/d' $pmapath1
sed -i '/pdf_pages/d' $pmapath1
sed -i '/designer_coords/d' $pmapath1
sed -i '/controlpass/d' $pmapath1
sed -i '/savedsearches/d' $pmapath1
sed -i '/navigationhiding/d' $pmapath1
sed -i '/users/d' $pmapath1
sed -i '/controlpass/d' $pmapath1
sed -i '/favorite/d' $pmapath1
sed -i '/usergroups/d' $pmapath1
sed -i '/central_columns/d' $pmapath1
sed -i '/designer_settings/d' $pmapath1
sed -i '/export_templates/d' $pmapath1
echo "\$cfg['Servers'][\$i]['favorite'] = 'pma__favorite';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['usergroups'] = 'pma__usergroups';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['central_columns'] = 'pma__central_columns';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['designer_settings'] = 'pma__designer_settings';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['export_templates'] = 'pma__export_templates';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['savedsearches'] = 'pma__savedsearches';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['navigationhiding'] = 'pma__navigationhiding';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['users'] = 'pma__users';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['usergroups'] = 'pma__usergroups';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['pmadb'] = 'phpmyadmin';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['controluser'] = 'pma';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['controlpass'] = '$PASS';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['bookmarktable'] = 'pma__bookmark';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['relation'] = 'pma__relation';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['userconfig'] = 'pma__userconfig';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['table_info'] = 'pma__table_info';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['column_info'] = 'pma__column_info';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['history'] = 'pma__history';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['recent'] = 'pma__recent';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['table_uiprefs'] = 'pma__table_uiprefs';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['tracking'] = 'pma__tracking';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['table_coords'] = 'pma__table_coords';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['pdf_pages'] = 'pma__pdf_pages';" >> $pmapath1
echo "\$cfg['Servers'][\$i]['designer_coords'] = 'pma__designer_coords';" >> $pmapath1

#SOME WORK with DATABASE (table / user)
PMADB=phpmyadmin
PMAUSER=pma

#DROP USER and TABLE
mysql -uroot <<MYSQL_PMA1
DROP USER '$PMAUSER'@'localhost';
DROP DATABASE $PMADB;
FLUSH PRIVILEGES;
MYSQL_PMA1

#CREATE PMA USER
mysql -uroot <<MYSQL_PMA2
CREATE USER '$PMAUSER'@'localhost' IDENTIFIED BY '$PASS';
CREATE DATABASE $PMADB;
MYSQL_PMA2

#GRANT PMA USE SOME RIGHTS
mysql -uroot <<MYSQL_PMA3
USE $PMADB;
GRANT USAGE ON $PMADB.* TO '$PMAUSER'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $PMADB.* TO '$PMAUSER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_PMA3

#MYSQL DB and TABLES ADDITION
echo "Download tables for our mysql server";
wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/create_tables.sql;

# Check wget
if [ -e '/usr/bin/wget' ]; then
    echo "Download via wget" &&
    wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/create_tables.sql;
    else
        echo "Error: download via wget failed"
fi

# Check curl
if [ -e '/usr/bin/curl' ]; then
    echo "Download via curl" &&
    curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/create_tables.sql;
    else
        echo "Error: download via curl failed."
fi

mysql -uroot < create_tables.sql

echo "Delete temp files";
rm create_tables.sql*
echo "pma@localhost user password = $PASS" > pma.txt