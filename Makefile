files:=pierwiastki potegi
md_files=$(files:=.md)

pandoc=pandoc
pandoc_flags=

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

pdf: zadania.pdf

html: zadania.html

.PHONY: all

