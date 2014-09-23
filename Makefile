all:
	ocamlbuild -use-menhir -use-ocamlfind -pkgs js_of_ocaml,js_of_ocaml.syntax -syntax camlp4o src/jsbridge.byte
	js_of_ocaml -pretty -noinline jsbridge.byte

clean:
	ocamlbuild -clean
	rm -f jsbridge.js *~
