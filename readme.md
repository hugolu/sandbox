# The largest heading
## The second largest heading

On July 2, an alien mothership entered Earth's orbit and deployed several dozen saucer-shaped "destroyer" spacecraft, each 15 miles (24 km) wide.

On July 3, the Black Knights, a squadron of Marine Corps F/A-18 Hornets, participated in an assault on a destroyer near the city of Los Angeles.

In the words of Abraham Lincoln:

> Pardon my french

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

_This text will be italic_

**This text will be bold**

**Everyone _must_ attend the meeting at 5 o'clock today.**

_Everyone **must** attend the meeting at 5 o'clock today._

Unordered lists

- item1
- item2
- item3

Ordered lists

1. item A
2. item B
3. item C

Nested lists

1. item 1
  1. item 1-1
  2. item 1-2
2. item 2
  * item 2-1
  * item 2-2
3. item 3

### Code formatting

#### inline formats

Here's an idea: why don't we take `SuperiorProject` and turn it into `**Reasonable**Project`.

#### Multiple lines

Check out this neat program I wrote:

```
x = 0
x = 2 + 2
what is x
```
### Links

For example, to create a hyperlink to www.github.com, with a link text that says, Visit GitHub!, you'd write this in Markdown: [Visit Google!](www.google.com).

### code blocks and syntax highlighting

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

### Tables

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


### Task lists

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> are supported
- [x] list syntax is required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item


