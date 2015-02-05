---
layout:     slide
title:      Presentation Headline
date:       2015-01-01 12:00:00
author:     Materials Innovation

theme:		blood # default/beige/blood/moon/night/serif/simple/sky/solarized
trans:		default # default/cube/page/concave/zoom/linear/fade/none
---
<script type="text/template">
#{{ page.title }}
##{{ page.author }}
###{{ page.date }}
--horizontal
<!-- Start Writing Below in Markdown -->
Showcasing Presentation Features. This template is ideal for very quickly creating decent presentations when content and simplicity is more important than excessive styling.
--horizontal
Seperate with --horizontal between content for horizontal slides.
--vertical
Seperate with --vertical between content for vertical slides.
--horizontal
Press ESC for a zoomed out overview of the presentation.
--horizontal
Press S for presenter view. Use --notes to add presenter notes.
--notes
Lorem Ipsum Dolor
--horizontal
Press B to pause the presentation.
--horizontal
#Headers:

# Header 1

## Header 2

### Header 3
--horizontal
#Styling:

**Bold**

*Italics*

***Bold and Italics***
--horizontal
Use MathJax for Math.
$$ A = \pi r^2 $$
--horizontal
#Lists:

1. Item 1

2. Item 2

* Unordered Item

  * Sub Item 1

    1. **Bold** Sub Sub Ordered Item
--horizontal
#Links:

[In-Line](https://www.google.com)

[I'm a reference-style link 1][1]

[I'm a reference-style link 1][2]

[1]:https://www.mozilla.org
[2]:http://www.reddit.com
--horizontal
#Images:

![Description](http://img3.wikia.nocookie.net/__cb20140102180853/fairytail/images/5/5b/Logo_Fairy_Tail_right.png)
--horizontal
#Code:

Inline `code`.

--vertical
```python
import numpy as np
def _set_colors():
    HighRGB = np.array([26, 152, 80]) / 255.
```

--horizontal
#Quotes

> War does not decide who is right, only who is **left**.

--horizontal
#HTML

You actually can not write in HTML using this template. If you want to create HTML presentations using this framework head over to [reveal.js](http://lab.hakim.se/reveal-js/#/).

<!-- End Here -->
--vertical
#[Print]({{ site.url }}{{ site.baseurl }}{{ page.url }}/?print-pdf#)
#[Back]({{ site.url }}{{ site.baseurl }})

Created using [reveal.js](http://lab.hakim.se/reveal-js/#/).
</script>


