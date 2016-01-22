# phpmyadmin-fixer
Fixes for phpmyadmin (configuration storage and some extended features)

If you're tired of the message "The phpMyAdmin configuration storage is not completely configured, some extended features have been deactivated", this patch for you ;-)

##What do you get?
- Tracking pages (version control MySQL table structure and data);
- Bookmarks allow you to save predefined queries and execute them later;
- You can show recently used tables in the navigation panel. It helps you jump across the table directly, without the need to select the database and the table;
- Triggers - code which is automatically executed in response to certain events.
- Designer mode (visually display your tables and a graphical way of creating, editing, and displaying phpMyAdmin relations);
- Relation support (allows relationships (similar to foreign keys) using MySQL-native (InnoDB) methods);
- PDF schema (phpMyAdmin can produce PDF schema of your database);
- You can store comments to describe each column for each table. These will then be shown on the “printview”;
- phpMyAdmin can be configured to remember several things, column order, and column visibility from a database table) for browsing tables;
- Since release 3.4.x phpMyAdmin allows users to set most preferences by themselves and store them in the database;
- Since release 4.2.0 you can save and load query-by-example searches from the Database > Query panel;
- Since release 4.5.0 you can save and load export templates;
- no message about "storage is not completely configured";

_(information source - phpMyAdmin FAQ page)_

##Installation:
__Universal installer with OS Checker__

` curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh `

or

` sudo wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh `

##OS Installation:
__Ubuntu__

` curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-ubuntu.sh && chmod +x pma-ubuntu.sh && ./pma-ubuntu.sh `

or

` sudo wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-ubuntu.sh && chmod +x pma-ubuntu.sh && ./pma-ubuntu.sh `

__Debian__

` curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-debian.sh && chmod +x pma-debian.sh && ./pma-debian.sh `

or		

` wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-debian.sh && chmod +x pma-debian.sh && ./pma-debian.sh `

__CentOS__

` curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh `

or

` wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh `

##What the script does:
- works from user root;
- changes inside /etc/phpmyadmin/config.inc.php, fixes value;
- makes a backup of /etc/phpmyadmin/config.inc.php in /root folder;
- adds in a mysql pma user / and the table phpmyadmin (if the user "pma" or the table "phpmyadmin" already exists, the script will delete those!);
- download and add table for database phpmyadmin;
- clean temp files, leftover pma.txt (contains password for pma@localhost) and old config;

##Changes:
- we don't use pwgen for generation password anymore, no extra utilities;
- check wget/curl before downloading dump for database;
- universal installer with os detector by Sergey Rodin (VestaCP - https://vestacp.com);
- options savedsearches / navigationhiding / users / usergroups are set (for 4.x phpmyadmin);
- added table pma__usergroups (for 4.x phpmyadmin);
- sql dump on github now;
- sh files on github too.

####Tested on different servers: Debian 7/8, Ubuntu 12/14/15, CentOS 6/7
####Support 3.x and 4.x version of phpmyadmin
