# phpmyadmin-fixer
Fixes for phpmyadmin (configuration storage and some extended features)

If you're tired from message - "The phpMyAdmin configuration storage is not completely configured, some extended features have been deactivated", this patch for you ;-)


##Installation:
__Ubuntu__

curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh

or

sudo wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-ubuntu.sh && chmod +x pma-ubuntu.sh && ./pma-ubuntu.sh

__Debian__

curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh

or		

wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-debian.sh && chmod +x pma-debian.sh && ./pma-debian.sh

__CentOS__

curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh

or

wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh

##What script do:
- work from user root;
- install wget/pwgen (if this software not installed before, it's for download and password generation);
- changes inside /etc/phpmyadmin/config.inc.php, fix value;
- make backup /etc/phpmyadmin/config.inc.php in /root folder;
- add in mysql pma user / and table phpmyadmin (if you have pma user or phpmyadmin table, script will delete those!);
- download and add table for database phpmyadmin;
- clean temp files and left pma.txt (there is password for pma@localhost) and old config;

##Changes:
- options savedsearches / navigationhiding / users / usergroups are set (for 4.x phpmyadmin);
- added table pma__usergroups (for 4.x phpmyadmin);
- sql dump on github now;
- sh files on github too.

###Tested on more than 50 different servers
###support 3.x and 4.x version of phpmyadmin
