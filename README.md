#Project Pages

Project Pages is Jekyll Template specifically geared towards collaborative science. For more information, click [here](https://github.com/projectpages/project-pages/wiki/).

# Nav Bar Jumbles

If you have seemingly random pages popping up on your Nav Bar recently, this is due to the fact that GitHub/Jekyll changed a fundemental rule they used to render pages. 

## CAUSE:
It used to be that if a markdown file didn't have `---` frontmatter at the beginning, it wasn't rendered as a page. This was changed very recently (like in the last 2 days) so that every markdown file anywhere no matter what gets rendered as a page.  

## FIX:

1) Go to:

`project-pages/plugin/markdown/` or `yourreponame/plugin/markdown/` and delete `example.html` and `example.md` files. This can be done graphically for the non-Git-savvy by simply going to your:

GitHub account -> Your Profile -> Repositories -> Project-Pages/Your Repo -> Pluging -> Markdown 

and clicking on the files, then clicking on the "thrash can / delete this file" icon on the top right corner of the file.

2) You need to change the `LICENSES.md` at:

GitHub account -> Your Profile -> Repositories -> Project-Pages/Your Repo

to `License.md` by clicking on the file and changing the name.

The fixes are already implemented here so new forks won't have a problem, and old forks should be able merge without conflict if they know how to.
