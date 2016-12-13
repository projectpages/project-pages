#Project Pages

Project Pages is Jekyll Template specifically geared towards collaborative science. For more information, click [here](https://github.com/projectpages/project-pages/wiki/).

# Nav Bar Jumbles

If you have seemingly random pages popping up on your Nav Bar recently, this is due to the fact that GitHub/Jekyll changed a fundemental rule they used to render pages. 

## CAUSE:
It used to be that if a markdown file didn't have `---` frontmatter at the beginning, it wasn't rendered as a page. This was changed very recently (like in the last 2 days) so that every markdown file anywhere no matter what gets rendered as a page.  

## FIX:ss
Go to:

`project-pages/plugin/markdown/` or `yourreponame/plugin/markdown/` and deletesas
