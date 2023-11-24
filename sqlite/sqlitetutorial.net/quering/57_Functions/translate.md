# SQLite FUNCTIONS #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-functions/

## Обзор ##############################

В этой секции вы увидите основные функции SQLite, такие как: агрегатные функции, функции даты и времени, строковые функции, и математические функции.

## Аггрегатные функции SQLite

| Name            | Description                                              |
|-----------------|----------------------------------------------------------|
| [AVG]           | Возвращает среднее сначение не нулевых значений в группе |
| [COUNT]         | Возвращает общее количество строк в табилце              |
| [MAX]           | Возвращает максимальное значение из всех значений группы |
| [MIN]           | Возвращает минимальное значение из всех значений группы  |
| [SUM]           | Возвращает сумму всех не нулевых значений группы         |
| [GROUP_CONCAT]  | Соединяет не нулевые значения в столбце                  |


## Строковые функции SQLite

| Name            | Description                                              |
|-----------------|----------------------------------------------------------|
| [SUBSTR]        | Вырезает и возвращает подстроку выбранной длинны, начиная с вырбранной позиции в исходной строку |
| [TRIM]          | Возвращает копию строки, в которой удалены специальные символы из начала и конца строки |
| [LTRIM]         | Возвращает копию строки, в которой удалены специальные символы из начала строки |
| [RTRIM]         | Возвращает копию строки, в которой удалены специальные символы из конци строки |
| [LENGTH]        | Возвращает количество символов строки или количество байт BLOB |
| [REPLACE]       | Возвращает копию строки, в которой каждое вхождение подстроки заменено другой подстрокой |
| [UPPER]         | Возвращает копию строки, где все символы приведены к верхнему регистру |
| [LOWER]         | Возвращает копию строки, где все символы приведены к нижнему регистру |
| [INSTR]         | Ищет подстроку в строке и возвращает номер позиции первого вхождения подстроки |

## Функции управления потоком SQLite

| Name            | Description                                              |
|-----------------|----------------------------------------------------------|
| [COALESCE]      | Возвращает первый не нулевой аргумент                    |
| [ISNULL]        | Предостовляет NULL конструкцию if/else                   |
| [IIF]           | Добавляет if-else логику в запрос                        |
| [NULLIF]        | Возвращает NULL если первый аргумент равен второму аргументу |

## Функции даты и времени

| Name            | Description                                              |
|-----------------|----------------------------------------------------------|
| [DATE]          | Вычисляет дату, основываясь на нескольких модификаторах даты |
| [TIME]          | Вычисляет время, основываясь на нескольких модификаторах времени |
| [DATETIME]      | Вычисляет дату и время, основываясь на нескольких модификаторах даты и времени |
| JULIANDAY       | Возвращает Юлианский день, который представляет из себя число дней с 24 Ноября 4714г. д.н.э. по Гринвичу |
| [STRFTIME]      | Форматирует дату, основываясь на указаном формате строки |

## Математическин функции SQLite

| Name            | Description                                              |
|-----------------|----------------------------------------------------------|
| [ABS]           | Возвращает абсолютное значение числа                     |
| [RANDOM]        | Возвращает случайное число с плавающей точкой между максимальным и минимальным значениями integer |
| [ROUND]         | Округляет число с плавающей точкой до указаной точности  |

---------------------------------------

Предидущее руководство < [SQLite INSTEAD OF TRIGGER][prev]  
Следующее руководство > [SQLite ABS][next]

[prev]: ../56_InsteadOfTrigger/translate.md
[next]: ../58_ABS/translate.md

[AVG]: https://www.sqlitetutorial.net/sqlite-avg/
[COUNT]: https://www.sqlitetutorial.net/sqlite-count-function/
[MAX]: https://www.sqlitetutorial.net/sqlite-max/
[MIN]: https://www.sqlitetutorial.net/sqlite-min/
[SUM]: https://www.sqlitetutorial.net/sqlite-sum/
[GROUP_CONCAT]: https://www.sqlitetutorial.net/sqlite-group_concat/

[SUBSTR]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-substr/
[TRIM]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-trim/
[LTRIM]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-ltrim/
[RTRIM]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-rtrim/
[LENGTH]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-length/
[REPLACE]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-upper/
[UPPER]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-upper/
[LOWER]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-lower/
[INSTR]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-instr/

[COALESCE]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-coalesce/
[ISNULL]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-ifnull/
[IIF]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-iif/
[NULLIF]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-nullif/

[DATE]: https://www.sqlitetutorial.net/sqlite-date-functions/sqlite-date-function/
[TIME]: https://www.sqlitetutorial.net/sqlite-date-functions/sqlite-time-function/
[DATETIME]: https://www.sqlitetutorial.net/sqlite-date-functions/sqlite-datetime-function/
[STRFTIME]: https://www.sqlitetutorial.net/sqlite-date-functions/sqlite-strftime-function/

[ABS]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-abs/
[RANDOM]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-random/
[ROUND]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-round/