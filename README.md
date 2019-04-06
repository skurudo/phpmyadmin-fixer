# phpMyAdmin-fixer
Correções para o phpmyadmin (armazenamento de configuração e alguns recursos estendidos)

Se você está cansado da mensagem "O armazenamento da configuração do phpMyAdmin não está completamente configurado, alguns recursos estendidos foram desativados", este patch para você ;-)

## O que você ganha?
* Páginas de rastreamento (estrutura de tabela e dados de controle de versão do MySQL);
* Você pode mostrar tabelas usadas recentemente no painel de navegação. Ele ajuda você a pular a tabela diretamente, sem a necessidade de selecionar o banco de dados e a tabela;
* Triggers - código que é executado automaticamente em resposta a certos eventos.
* Modo Designer (exibe visualmente suas tabelas e uma maneira gráfica de criar, editar e exibir relações phpMyAdmin);
* Suporte à relação (permite relacionamentos (similares a chaves estrangeiras) usando métodos nativos do MySQL (InnoDB);
* Esquema PDF (o phpMyAdmin pode produzir o esquema PDF do seu banco de dados);
* Você pode armazenar comentários para descrever cada coluna para cada tabela. Estes serão então mostrados no “printview”;
* O phpMyAdmin pode ser configurado para lembrar várias coisas, a ordem das colunas e a visibilidade da coluna de uma tabela de banco de dados) para tabelas de navegação;
* Desde o release 3.4.x, o phpMyAdmin permite que os usuários definam a maioria das preferências e armazenem-nas no banco de dados;
* Since release 4.2.0 you can save and load query-by-example searches from the Database > Query panel;
* Desde a versão 4.5.0, você pode salvar e carregar modelos de exportação;
* Nenhuma mensagem sobre "armazenamento não está completamente configurado";

_(fonte da informação: página do FAQ do phpMyAdmin)

## Installation: __Instalador universal com o OS Checker__

```sh
bash <(curl -s https://raw.githubusercontent.com/luizjr/phpMyAdmin-Fixer-VestaCP/master/pma.sh)
```

## O que o script faz:
- Funciona a partir do usuário root;
- Muda dentro de /etc/phpmyadmin/config.inc.php, corrigindo os valores;
- Faz um backup de /etc/phpmyadmin/config.inc.php na pasta /root;
- adds in a mysql pma user / and the table phpmyadmin (if the user "pma" or the table "phpmyadmin" already exists, the script will delete those!);
- download and add table for database phpmyadmin;
- clean temp files, leftover pma.txt (contains password for pma@localhost) and old config;

## Alterações:
- new tables and settings for favorite, usergroups, central_columns, designer_settings, export_templates;
- we don't use pwgen for generation password anymore, no extra utilities;
- check wget/curl before downloading dump for database;
- universal installer with os detector by Sergey Rodin (VestaCP - https://vestacp.com);
- options savedsearches / navigationhiding / users / usergroups are set (for 4.x phpmyadmin);
- Tabela pma__usergroups adicionada (para phpmyadmin 4.x);
- SQL dump no github agora;
- Scripts no github.

#### Testado em servidores diferentes: Debian 7/8, Ubuntu 12/14/16.04/18.04, CentOS 6/7
#### Suporte 3.x e versão 4.x do phpmyadmin
####Tested on different servers: Debian 7/8, Ubuntu 12/14/15, CentOS 6/7
####Support 3.x and 4.x version of phpmyadmin
