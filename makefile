#----Markdown to HTML via pandoc----
#
#	Warning: NEVER USE WHITESPACES IN YOUR FILENAMES,
#	MAKE DOES NOT HANDLE THEM WELL
#	Just don't do it
#
#vimwiki config:
#let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.wiki'}]
#let g:vimwiki_markdown_link_ext = 1
#
#When using a different file extension:
#  * Change extension Variable in makefile
#  * Change extension in linkFilter.lua
#
#Julian Dangelmaier 2020 nach Christus



.PHONY = build clean 
EXT := .wiki
SRC := $(shell find -name '*$(EXT)')
TAR := $(addsuffix .html, $(basename $(SRC)))
build : $(TAR) 

clean : 
	rm *.html
%.html : %$(EXT)
	pandoc -f markdown -t html5 -s -c markup.css --mathjax -o $(@) $(<) --lua-filter linkFilter.lua

