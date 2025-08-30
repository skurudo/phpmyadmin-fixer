# phpMyAdmin Fixer

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/github-skurudo%2Fphpmyadmin--fixer-blue.svg)](https://github.com/skurudo/phpmyadmin-fixer)

**Fixes for phpMyAdmin (configuration storage and extended features)**

If you're tired of the message "The phpMyAdmin configuration storage is not completely configured, some extended features have been deactivated", this patch is for you! 😊

## 🌟 What you get

- **Tracking pages** - Version control for MySQL table structure and data
- **Bookmarks** - Save predefined queries and execute them later
- **Recent tables** - Show recently used tables in the navigation panel for quick access
- **Triggers** - Automatically executed code in response to certain events
- **Designer mode** - Visual table display and graphical way of creating/editing phpMyAdmin relations
- **Relation support** - Create relationships using MySQL-native (InnoDB) methods
- **PDF schema** - Generate PDF schema of your database
- **Column comments** - Store and display comments for each column in print view
- **User preferences** - Remember column order, visibility, and other browsing preferences
- **Query-by-example searches** - Save and load search queries from Database > Query panel
- **Export templates** - Save and load export templates
- **No more configuration warnings** - Eliminate the "storage is not completely configured" message

> *Information source: phpMyAdmin FAQ page*

## 🚀 Quick Installation

### Universal Installer (Recommended)
```bash
curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh
```

Or using wget:
```bash
wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh
```

## 🖥️ OS-Specific Installation

### Ubuntu
```bash
sudo curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-ubuntu.sh && sudo chmod +x pma-ubuntu.sh && sudo ./pma-ubuntu.sh
```

### Debian
```bash
curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-debian.sh && chmod +x pma-debian.sh && ./pma-debian.sh
```

### CentOS
```bash
curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma-centos.sh && chmod +x pma-centos.sh && ./pma-centos.sh
```

## 🔧 What the script does

- **Root access required** - Script runs with root privileges
- **Configuration fix** - Updates `/etc/phpmyadmin/config.inc.php` with correct values
- **Backup creation** - Creates backup of config file in `/root` folder
- **Database setup** - Creates MySQL user `pma` and `phpmyadmin` database
- **Table creation** - Downloads and installs required tables for phpMyAdmin
- **Cleanup** - Removes temporary files and old configurations

## 📋 Recent Changes

- ✅ New tables and settings for favorites, user groups, central columns, designer settings, export templates
- ✅ Removed dependency on `pwgen` utility
- ✅ Added wget/curl availability checks before downloading
- ✅ Universal installer with OS detection by Sergey Rodin (VestaCP)
- ✅ Enhanced options for saved searches, navigation hiding, users, and user groups (phpMyAdmin 4.x)
- ✅ Added `pma__usergroups` table support (phpMyAdmin 4.x)
- ✅ SQL dump and shell scripts now hosted on GitHub

## 🧪 Tested Environments

- **Debian**: 7, 8, 9
- **Ubuntu**: 12, 14, 15, 16, 19
- **CentOS**: 6, 7
- **phpMyAdmin**: 3.x and 4.x versions

## 📚 Documentation

- **[English](README.md)** (current)
- **[Русский](README.ru.md)** - Russian translation
- **[Project Details](PROJECT.md)** - Technical project overview
- **[Описание проекта](PROJECT.ru.md)** - Technical project overview in Russian

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve this project.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Pavel Galkin** - [skurudo.ru](https://skurudo.ru)

## 🙏 Acknowledgments

- **Sergey Rodin** - OS detection code from [VestaCP](https://vestacp.com)
- phpMyAdmin development team for the excellent web interface

---

**⭐ Star this repository if it helped you!**
