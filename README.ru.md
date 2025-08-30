# phpMyAdmin Fixer

[![Лицензия](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/github-skurudo%2Fphpmyadmin--fixer-blue.svg)](https://github.com/skurudo/phpmyadmin-fixer)

**Исправления для phpMyAdmin (хранилище конфигурации и расширенные функции)**

Если вы устали от сообщения "The phpMyAdmin configuration storage is not completely configured, some extended features have been deactivated", этот патч для вас! 😊

## 🌟 Что вы получаете

- **Отслеживание страниц** - Контроль версий структуры и данных таблиц MySQL
- **Закладки** - Сохранение предопределенных запросов и их выполнение позже
- **Недавние таблицы** - Отображение недавно использованных таблиц в панели навигации для быстрого доступа
- **Триггеры** - Автоматически выполняемый код в ответ на определенные события
- **Режим дизайнера** - Визуальное отображение таблиц и графический способ создания/редактирования отношений phpMyAdmin
- **Поддержка отношений** - Создание связей с использованием нативных методов MySQL (InnoDB)
- **PDF схема** - Генерация PDF схемы вашей базы данных
- **Комментарии к столбцам** - Сохранение и отображение комментариев для каждого столбца в печатном виде
- **Пользовательские настройки** - Запоминание порядка столбцов, видимости и других настроек просмотра
- **Поиск по примеру** - Сохранение и загрузка поисковых запросов из панели Database > Query
- **Шаблоны экспорта** - Сохранение и загрузка шаблонов экспорта
- **Никаких предупреждений** - Устранение сообщения "storage is not completely configured"

> *Источник информации: страница FAQ phpMyAdmin*

## 🚀 Быстрая установка

### Универсальный установщик (Рекомендуется)
```bash
curl -O -k https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh
```

Или используя wget:
```bash
wget --no-check-certificate https://raw.githubusercontent.com/skurudo/phpmyadmin-fixer/master/pma.sh && chmod +x pma.sh && ./pma.sh
```

## 🖥️ Установка для конкретных ОС

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

## 🔧 Что делает скрипт

- **Требуются права root** - Скрипт выполняется с привилегиями root
- **Исправление конфигурации** - Обновляет `/etc/phpmyadmin/config.inc.php` с правильными значениями
- **Создание резервной копии** - Создает резервную копию конфигурационного файла в папке `/root`
- **Настройка базы данных** - Создает пользователя MySQL `pma` и базу данных `phpmyadmin`
- **Создание таблиц** - Загружает и устанавливает необходимые таблицы для phpMyAdmin
- **Очистка** - Удаляет временные файлы и старые конфигурации

## 📋 Последние изменения

- ✅ Новые таблицы и настройки для избранного, групп пользователей, центральных столбцов, настроек дизайнера, шаблонов экспорта
- ✅ Убрана зависимость от утилиты `pwgen`
- ✅ Добавлены проверки доступности wget/curl перед загрузкой
- ✅ Универсальный установщик с определением ОС от Сергея Родина (VestaCP)
- ✅ Расширенные опции для сохраненных поисков, скрытия навигации, пользователей и групп пользователей (phpMyAdmin 4.x)
- ✅ Добавлена поддержка таблицы `pma__usergroups` (phpMyAdmin 4.x)
- ✅ SQL дамп и shell скрипты теперь размещены на GitHub

## 🧪 Протестированные среды

- **Debian**: 7, 8, 9
- **Ubuntu**: 12, 14, 15, 16, 19
- **CentOS**: 6, 7
- **phpMyAdmin**: версии 3.x и 4.x

## 📚 Документация

- **[English](README.md)** - Английская версия
- **[Русский](README.ru.md)** (текущая)

## 🤝 Участие в разработке

Не стесняйтесь отправлять сообщения об ошибках, запросы функций или pull request'ы для улучшения этого проекта.

## 📄 Лицензия

Этот проект распространяется под лицензией MIT - см. файл [LICENSE](LICENSE) для подробностей.

## 👨‍💻 Автор

**Павел Галкин** - [skurudo.ru](https://skurudo.ru)

## 🙏 Благодарности

- **Сергей Родин** - Код определения ОС от [VestaCP](https://vestacp.com)
- Команда разработчиков phpMyAdmin за отличный веб-интерфейс

---

**⭐ Поставьте звездочку этому репозиторию, если он вам помог!**
