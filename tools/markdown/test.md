[Википедия][wiki]

[Официальный сайт (синтаксис)][daring fireball]

[Шпаргалка от скилбокса][skillbox]

[Диалект гитхаба][GitHub Flavored Markdown Spec]

[Расширенный диалект][CommonMark Spec]

\ - Экранирование символа

<p>\* - Внутри блока не экранируется</p>

\**Курсив*\*

\*\***Полужирный**\*\*

\~~~~зачеркнутый~~\~~

Фрагмент кода внутри строки \``Hello world`\`

Блочный фрагмент 4 пробела или 1-2 tab

    *Курсив*

~~~~~~~~~~~~~~ markdown ~~~~~~~~~~
*Курсив*
**Полужирный**
***Полужирный курсив***

- список
- список 2
  - 3453апва

1. 342
2. 342
3. 453453

# Заголовок
## заголовок
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
````````````````````````````````````` html
<!doctype html>
<html>
  <head>
    <!-- Заголовок документа -->
  </head>
  <body>
    <!-- Тело документа -->
  </body>
</html>
`````````````````````````````````````

* ваыва
* ваыва
- выаываыа
- цукцук
- укцук
+ уцкцукцук
+ кцу цукц

1. Элемент
2. №2
9. След элемент

Текст
# \# Заголовок первого уровня
## \#\# Заголовок второго уровня
### \#\#\# Заголовок третьего уровня
#### \#\#\#\# Заголовок четвертого уровня
##### \#\#\#\#\# Заголовок пятого уровня
###### \#\#\#\#\#\# Заголовок шестого уровня

Заголовок первого уровня (альтернатива)<br> ============================
====================
Заголовок вторгого уровня<br> ---------------------------------------------------------
--------------------

`````````````````````````` markdown
> цитата \<blockquote>\</blockquote>
> 
> все еще цитата ываыв аы ваы ва ыва ыва ыва ываыв аыва
> ваыва ываы ваы ваыв аыв аы ваыв аыв аы вы
  ываываы ваы ваы ва ыва ы
> > Цитата в цитате
> >
> > asdas
>
``````````````````````````


> цитата \<blockquote>\</blockquote>
> 
> все еще цитата ываыв аы ваы ва ыва ыва ыва ываыв аыва
> ваыва ываы ваы ваыв аыв аы ваыв аыв аы вы
  ываываы ваы ваы ва ыва ы
> > Цитата в цитате
> >
> > asdas
>

[Ссылка](https://ru.wikipedia.org/wiki/Markdown#cite_note-37 "Необязательный заголовок")

Где-то среди текста встречается [текст ссылки][example].

Также ссылка повторяется [пример адреса][example].

Ссылка на [второй][foo] также [Bar][] ресурсы.

[example]: http://example.com/ "Необязательный заголовок ссылки"
[foo]: http://example.net/ 'Необязательный заголовок ссылки'
[bar]: http://example.edu/ (Необязательный заголовок ссылки)

![Alt-текст](https://gas-kvas.com/uploads/posts/2023-02/1675415680_gas-kvas-com-p-kartinki-dlya-fonovogo-risunka-rabochego-s-25.jpg "Заголовок изображения")

This is a regular paragraph.

<table>
    <tr>
        <td>Foo</td>
        <td>Foo 2</td>
    </tr>
</table>

This is another regular paragraph.

<h1>Заголовок</h1>

!!! danger "Привет"

[TOC] - Оглавление

-----------------

*******************

_____________________

- [ ] Неотмеченный пункт
- [x] Отмеченный пункт

- Пункт
  - Подпункт
  - ва
    - 4532

| Стобец 1        | Столбец 2 | Столбец 3 |
|:----------------|----------:|:---------:|
| Длинная записть |  Которкая |  ваываыаы |
| Запись          |    Запись |   Запись  |

|| Спойлер ||

&lt;
&amp;
&
<

&copy;

AT&T

[wiki]: https://ru.wikipedia.org/wiki/Markdown
[daring fireball]: https://daringfireball.net/projects/markdown/syntax
[skillbox]: https://skillbox.ru/media/code/yazyk-razmetki-markdown-shpargalka-po-sintaksisu-s-primerami/

[GitHub Flavored Markdown Spec]: https://github.github.com/gfm/

[CommonMark Spec]: https://spec.commonmark.org/0.30/

Здесь идет текст абзаца `<blank>` `&#8212;` &#8212; `&mdash;` &mdash;

<http://example.com/>

http://example.com/

<address@example.com>

1. List item one
+
List item one continued with a second paragraph followed by an Indented block.
+ 
`````````````````` bash
$ ls *.sh
$ mv *.sh ~/tmp
``````````````````
+
List item 

2. ldfisdf a
+
--

| abc | def |
| --- | --- |
| bar |
| bar | baz | boo |

~~Hi~~ Hello, ~there~ world!

This will ~~~not~~~ strike.