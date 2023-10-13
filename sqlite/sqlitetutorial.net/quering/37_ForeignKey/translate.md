# SQLite FOREIGN KEY #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-foreign-key/

## Обзор ##############################

В этом руководстве вы узнаете, как использовать ограничение внешнего ключа SQLite для принудительного объявления отношений между таблицами.

## Поддержка внешних ключей SQLite

SQLite поддерживает ограничения внешнего ключа начиная с версии 3.6.19. SQLite не должна быть скомпилирована с использованием опций `SQLITE_OMIT_FOREIGN_KEY` и `SQLITE_OMIT_TRIGGER`.

Для определения, поддерживает ли ваша версия ограничения внешнего ключа, используйте следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Эта команда возвращает числовое значение 1, если доступно, 0, если не доступно. Если команда ничего не возвращет, то это значит, что SQLite версия не поддерживает ограничения внешнего ключа.

Если библиотека SQLite скомпилирована с поддержкой ограничений внешнего ключа, приложение пожет использовать команду `PRAGMA foreign_keys` для включения или отключения ограничения во время выполнения.

Для отключения ограничений внешнего ключа используйте следующее вырежение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys = OFF;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для включения: 

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys = ON;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Знакомство с ограничениями внешнего ключа SQLite

Давайте начнем с двумя таблицами: `suppliers` и `supplier_group`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER NOT NULL
);

CREATE TABLE supplier_groups (
  group_id INTEGER PRIMARY KEY,
  group_name TEXT NOT NULL
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Предположим что каждый ответственный принадлежит одной или нескольким группам. И каждая группа имеет ноль или более ответственных. Отношение `supplier_groups` и `suppliers` один ко многим. Другими словами, для каждой строки таблицы `suppliers` существует соответствующая строка в таблице `supplier_groups`.

На данный момент нет возможности запретить вам добавлять строки в таблицу `suppliers` без соответствующей строки в таблице `supplier_groups`.

Также вы можете удалить строку из таблицы `supplier_groups` блез удаления или обновления связанных строк в таблице `suppliers`. Это может оставить несвязанные строки в таблице `suppliers`.

Для принудительного отношения между строками таблиц `suppliers` и `supplier_groups` используется **ограничение внешнего ключа**.

Для добавления ограничения внешнего ключа в таблицу `suppliers` изменим объявление `CREATE TABLE` следующим образом:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE suppliers;

CREATE TABLE suppliers (
  suppliers_id INTEGER PRIMARY KEY,
  suppliers_name TEXT NOT NULL,
  group_id INTEGER NOT NULL,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![supplier_group_supplier]

Таблица `supplier_groups` называется родительской таблицей, которая является таблицей на которую ссылается внешний ключ. Таблица `suppliers` является дочерней таблицей, таблица к которой применено ограничение внешнего ключа.

Столбец `group_id` таблицы `supplier_groups` называется родительским ключем, который является столбцом или набором столбцов в родительской таблице, на который ссылается ограничение внешнего ключа. Обычно, родительский ключ является первичном ключом родительской таблицы.

Столбец `group_id` таблицы `suppliers` называется доченим ключем. В основном, дочерний ключ является первичным ключем родительской таблицы.

## Примеры ограничений внешнего ключа SQLite

Для начала, вставим три строки в таблицу `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO supplier_groups (group_name)
VALUES
  ('Domestic'),
  ('Global'),
  ('One-Time');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем вставим нового ответственного в таблицу `suppliers` и группой, которая есть в таблице `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('HP', 2);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Выражение отработало без ошибок.

Далее, попробуем вставить строку в таблицу `suppliers` с группой, которой нет в таблице `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO suppliers (suppliers_name, group_id)
VALUES
  ('ABC Inc.', 4);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SQLite проверит ограничение врешнего ключа и отклонит изменения с выводом соответствующего сообщения об ошибке.

## Действия ограничения внешнего колюча SQLite

Что должно произойти, если мы удалим строку из таблицы `supplier_groups`? Должны ли все соответствующие строки из таблицы `suppliers` быть тоже удалены? Такой же вопрос связан с обновлением строки.

Для определения поведения ограничения внешнего ключа, которое используется во время удаления или изменений родительского ключа, используются действия `ON DELETE` и `ON UPDATE`, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
FOREIGN KEY (foreign_key_columns)
  REFERENCES parent_table(parent_key_columns)
    ON UPDATE action
    ON DELETE action;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SQLite поддерживает следующие действия:

- SET NULL
- SET DEFAULT
- RESTRICT
- NO ACTION
- CASCADE

На практике значения первичного ключа родительской таблицы на меняется, поэтому правила для обновления не такие важные. Более важными являются правила удаления, которые определяют действие во время удаления родительского ключа.

Давайте посмотрим каждое действие в отдельности

### SET NULL

Когда родительский ключ изменяется, удаляется или обновляется, соотверствующие дочерние ключи всех строк дочерней таблицы задаются в `NULL`.

Сначала пересоздадим таблицу `suppliers` используя действие `SET NULL` для внешнего ключа:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем вставим несколько строк в таблицу `suppliers`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('XYZ Corp.', 3);

INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('ABC Corp.', 3);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, удалим группу с id `3` из таблицы `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM supplier_groups
WHERE group_id = 3;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Далее, выберем данные из таблицы `suppliers`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM suppliers;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Значения колонки `group_id` соответствующих строк таблицы `suppliers` заданы как `NULL`.

### SET DEFAULT

Действие `SET DEFAULT` задает значение по умолчанию, которое было задано колонке во время создания таблицы.

Поскольку значение по умолчанию для колонки `group_id` является `NULL`, если вы удалите строку из таблицы `supplier_groups`, то `group_id` будет задано значение `NULL`.

После присваивания значения по умолчанию, страбатывает ограничение и выполняется проверка.

### RESTRICT

Действие `RESTRICT` не позволяет вам изменять или удалять родительский ключ в родительской таблице.

Сначала пересоздадим таблицу `suppliers` с действием `RESTRICT` для внешнего ключа `group_id`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, вставим строку в таблицу `suppliers` запись со значением `group_id` 1:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('XYZ Corp.', 1);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Удалим группу с id 1 из таблицы `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM supplier_groups
WHERE group_id = 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SQLite не позволит удалить строку, выдав сообщение об ошибке.

Чтобы это исправить, вы должны удалить всет строки из таблицы `suppliers` где `group_id` равно 1:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM suppliers
WHERE group_id = 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, вы можете удалить группу в id 1 из таблицы `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM supplier_groups
WHERE group_id = 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### NO ACTION

Действие `NO ACTION` не имеет смысла указывать, так как оно имеет то же действие, что и `RESTRICT`.

### CASCADE

Действие `CASCADE` прокидывает действие из родительской таблицы в дочернюю, когда вы обновляете или удаляете родительский ключ.

Сначала, вставим группы в таблицу `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO supplier_groups (group_name)
VALUES 
  ('Domesic'),
  ('Global'),
  ('One-Time');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, пересоздадим таблицу с новым действием:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем вставим несколько строк в таблицу `suppliers`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO suppliers (supplier_name, group_id)
VALUES ('XYZ Corp.', 1);

INSERT INTO suppliers (supplier_name, group_id)
VALUES ('ABC Corp.', 2);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем обновим `group_id` на 100:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE supplier_groups
SET group_id = 100
WHERE group_name = 'Domesic';
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем выберем данные из таблицы `suppliers`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM suppliers;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Как вы можете видеть, значение `group_id` строки, которая ссылалась на запись таблицы `supplier_groups` тоже изменилось на 100. 

И, наконец, удалим строку с id 2 из таблицы `supplier_groups`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELETE FROM supplier_groups
WHERE group_id = 2;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Выберем данные:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM suppliers;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ответственный, который ссылался на удаленную строку из таблицы `supplier_groups` тоже удалился. Это действие `CASCADE`.

В этом руководстве вы изнали о ограниченияй внешнего ключа SQLite и как с ними работать.

---------------------------------------

Предидущее руководство < [SQLite PRIMARY KEY][prev]  
Следующее руководство > [SQLite NOT NULL CONSTRAINT][next]

[supplier_group_supplier]: SQLite-Foreign-Key-Example.png

[prev]: ../36_PrimaryKey/translate.md
[next]: ../38_NotNullConstraint/translate.md