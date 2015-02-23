#Project Pages

## What are Project Pages?

Project Pages provides a collaboration tool that is designed to accelerate research activities between different
research fields, locations, and environments. Collaborators can quickly create blog posts and presentations to
share ideas, intermediate results and research progress with each other.

##How do I set up Project Pages for your own project?

  1. [Fork](https://help.github.com/articles/fork-a-repo/) this repository 
  2. [Rename](https://help.github.com/articles/renaming-a-repository/) the forked repository to  your new project name.
  3. Update the indicated fields in the _config.yml

##How do I make a new post or presentation to share with others?

Create a new .markdown file in the _post directory with the date and title of the post (title YEAR-MONTH-DAY-title.md), and update the yaml frontmatter. For a new blog post, copy and update the yaml frontmatter from the example blog file 2015-01-01-New-Post.markdown. Here is an example for a new blog post.

    ---
    layout:     post
    title:      Post Headline
    date:       2015-01-01 12:00:00
    author:     Materials Innovation
    ---

To create a new presentation, copy and update the frontmatter from the example slide file 2015-01-01-New-Slide.markdown. Here is an example

    ---
    layout:     slide
    title:      Presentation Headline
    date:       2015-01-01 12:00:00
    author:     Materials Innovation
    
    theme:		blood # default/beige/blood/moon/night/serif/simple/sky/solarized
    trans:		default # default/cube/page/concave/zoom/linear/fade/none
    ---

For more information, click [here](http://jekyllrb.com/docs/posts/)
