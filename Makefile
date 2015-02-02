all: elm.html test.html

elm.html: src/*
	elm-make src/Main.elm --output=$@

test.html: test/* src/*
	elm-make test/Tests.elm --output=$@
