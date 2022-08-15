build: alex/Alex.hs
	stack build

alex/Alex.hs:
	alex alex/Alex.x -o src/Alex.hs



clean:
	stack clean

