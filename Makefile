all:
	ocamlbuild -use-menhir -use-ocamlfind -pkgs js_of_ocaml,js_of_ocaml.syntax -syntax camlp4o jsbridge.byte
	js_of_ocaml -pretty -noinline _build/jsbridge.byte

clean:
	ocamlbuild -clean
	rm -f *~
