#!/bin/bash
echo "Phpmyadmin fixes for configuration storage and some  extended features";
echo "................";
echo "Let's do it";
echo "............";
echo "..........";
echo ".........";
echo "........";
echo "......";

echo "Install some software - wget and pwgen";
yum install pwgen && yum install wget;

echo "Generate password for PMA (pma.txt)";
PASS=`pwgen -s 10 1`
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
mysql -uroot < create_tables.sql

echo "Delete temp files";
rm create_tables.sql
echo "pma@localhost user password = $PASS" > pma.txt
