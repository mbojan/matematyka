files:=pierwiastki potegi
md_files=$(files:=.md)

pandoc=pandoc
pandoc_flags=

default:

%.pdf: %.md
	$(pandoc) $(pandoc_flags) $< -o $@

%.pdf: pandoc_flags=-s --metadata=title:Zadania

%.html: %.md
	$(pandoc) $(pandoc_flags) $< -o $@

%.html: pandoc_flags=-s --metadata=title:Zadania --mathjax

zadania.pdf: $(files:=.md)
	$(pandoc) $(pandoc_flags) $^ -o $@

zadania.html: $(files:=.md)
	$(pandoc) $(pandoc_flags) $^ -o $@

zadania.html: pandoc_flags+=--toc -N

zadania.pdf: pandoc_flags+=--toc -N

pdf: zadania.pdf

html: zadania.html

default: zadania.html

.PHONY: pdf html default

