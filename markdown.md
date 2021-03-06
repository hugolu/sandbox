# 標題 h1
## 標題 h2
### 標題 h3
#### 標題 h4
##### 標題 h5
###### 標題 h6

Atx形式則是在行首插入1到6個 # ，各對應到標題1到6階，例如以上：

### 分隔線

你可以在一行中用三個或以上的星號、減號、底線來建立一個分隔線，行內不能有其他東西。你也可以在星號中間插入空白。下面每種寫法都可以建立分隔線：

---
***
___

### 段落和換行

一個段落是由一個以上相連接的行句組成，而一個以上的空行則會切分出不同的段落（空行的定義是顯示上看起來像是空行，便會被視為空行。比方說，若某一行只包含空白和tab，則該行也會被視為空行），一般的段落不需要用空白或斷行縮排。

On July 2, an alien mothership entered Earth's orbit and deployed several dozen saucer-shaped "destroyer" spacecraft, each 15 miles (24 km) wide.
[中間沒有空行，上下兩句話會被當成同一段落]
On July 3, the Black Knights, a squadron of Marine Corps F/A-18 Hornets, participated in an assault on a destroyer near the city of Los Angeles.

On July 2, an alien mothership entered Earth's orbit and deployed several dozen saucer-shaped "destroyer" spacecraft, each 15 miles (24 km) wide.

On July 3, the Black Knights, a squadron of Marine Corps F/A-18 Hornets, participated in an assault on a destroyer near the city of Los Angeles.

### 區塊引言

Markdown使用email形式的區塊引言，如果你很熟悉如何在email信件中引言，你就知道怎麼在Markdown文件中建立一個區塊引言，那會看起來像是你強迫斷行，然後在每行的最前面加上>：

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

Markdown也允許你只在整個段落的第一行最前面加上>：

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.

> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
id sem consectetuer libero luctus adipiscing.

區塊引言可以有階層（例如：引言內的引言），只要根據層數加上不同數量的>：

> This is the first level of quoting.
>
> > This is nested blockquote.
>
> Back to the first level.

引言的區塊內也可以使用其他的Markdown語法，包括標題、清單、程式碼區塊等：

> ## This is a header.
> 
> 1.   This is the first list item.
> 2.   This is the second list item.
> 
> Here's some example code:
> 
>     return shell_exec("echo $input | $markdown_script");

### 強調

Markdown使用星號（\*）和底線（\_）作為標記強調字詞的符號，被\*或\_包圍的字詞會被轉成用<em>標籤包圍，用兩個\*或\_包起來的話，則會被轉成<strong>，例如：

_This text will be italic_

**This text will be bold**

**Everyone _must_ attend the meeting at 5 o'clock today.**

_Everyone **must** attend the meeting at 5 o'clock today._

你可以隨便用你喜歡的樣式，唯一的限制是，你用什麼符號開啟標籤，就要用什麼符號結束。
強調也可以直接插在文字中間：

un*frigging*believable

### 清單

Markdown支援有序清單和無序清單。

無序清單(Unordered lists)使用星號、加號或是減號作為清單標記：

- item1
- item2
- item3

有序清單(Ordered lists)則使用數字接著一個英文句點：

1. item A
2. item B
3. item C

要讓清單看起來更漂亮，你可以把內容用固定的縮排整理好：

*   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,
    viverra nec, fringilla in, laoreet vitae, risus.
*   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
    Suspendisse id sem consectetuer libero luctus adipiscing.

巢狀清單(Nested lists)

1. item 1
  1. item 1-1
  2. item 1-2
2. item 2
  * item 2-1
  * item 2-2
3. item 3

### 程式碼

如果要標記一小段行內程式碼，你可以用反引號把它包起來（`），例如：

Use the `printf()` function.

多行程式碼區段以三個（`）將程式碼包圍起來。

```
x = 0
x = 2 + 2
what is x
```

啟用語法高亮的程式碼區段：

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

### 連結 Links

Markdown支援兩種形式的連結語法：行內和參考兩種形式。

不管是哪一種，連結的文字都是用 [方括號] 來標記。

要建立一個行內形式的連結，只要在方塊括號後面馬上接著括號並插入網址連結即可，如果你還想要加上連結的title文字，只要在網址後面，用雙引號把title文字包起來即可，例如：超連結 www.github.com 或是 [Visit Google!](http://www.google.com "Google").

參考形式的連結使用另外一個方括號接在連結文字的括號後面，而在第二個方括號裡面要填入用以辨識連結的標籤：

This is [Google][google] reference-style link.

接著，在文件的任意處，你可以把這個標籤的連結內容定義出來：

[google]: http://www.google.com/ "Google 搜尋引擎"

### 圖片

很明顯地，要在純文字應用中設計一個「自然」的語法來插入圖片是有一定難度的。
Markdown使用一種和連結很相似的語法來標記圖片，同樣也允許兩種樣式：行內和參考。

詳細敘述如下：

* 一個驚嘆號!
* 接著一個方括號，裡面放上圖片的替代文字
* 接著一個普通括號，裡面放上圖片的網址，最後還可以用引號包住並加上 選擇性的'title'文字。

行內圖片的語法看起來像是：
```
![Alt text](/path/to/img.jpg)
![Alt text](/path/to/img.jpg "Optional title")
```
![Github icon](https://d3fu0ec0dkshyt.cloudfront.net/images/github/icon.png "Github")

參考式的圖片語法則長得像這樣：
```
![Alt text][id]
[id]: url/to/image  "Optional title attribute"
```
「id」是圖片參考的名稱，圖片參考的定義方式則和連結參考一樣：

![Github icon][github]
[github]: https://d3fu0ec0dkshyt.cloudfront.net/images/github/icon.png "Github"

### 表格 Tables

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

| Name | Description          |
| --- | --- |
| Help      | Display the help window.|
| Close     | Closes a window     |

| Name | Description          |
| ------------- | ----------- |
| Help      | ~~Display the~~ help window.|
| Close     | _Closes_ a window     |

| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |


### 任務列表 Task lists

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> are supported
- [x] list syntax is required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item


