all: build lint shpec

#paths 
program_name := markdownify
include_paths := -I lib

# scripts
log := "./script/build_log.sh"
shpec := "./script/shpec"

build: 
	$(log) build
	gpp -n +c "#" "\n" +s "\"" "\"" "\\" +s "'" "'" "\\" +s "\`" "\`" "\\" -U "\\" "" "(" "," ")" "(" ")" "#" "\\" -M "\\" "\n" " " " " "\n" "(" ")" ${include_paths} main.sh -o $(program_name)
	awk 'NF' $(program_name) > no_white_space
	mv no_white_space $(program_name)
	chmod 755 $(program_name)

shpec:
	$(log) test
	bash $(shpec) test/*

lint:
	$(log) lint $(program_name) 
	shellcheck -s bash $(program_name)

lint_lib:
	$(log) lint lib
	shellcheck -s bash $(shell find lib -name "*.sh")

clean:
	$(log) clean
	rm $(program_name)

watch:
	find . -name "*.sh" | entr -c make

