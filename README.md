A js_of_ocaml example
=====================

This is a simple example of how a language processor written in OCaml
with ocamllex and [menhir](http://gallium.inria.fr/~fpottier/menhir/)
can be compiled to a client-side JavaScript application with
[js_of_ocaml](http://ocsigen.org/js_of_ocaml/).

Internally, it builds and processes an abstract syntax tree (AST) for
a simple language of arithmetic expressions. The AST is defined in
ast.ml. It is built recursively in the action statements of each
grammar production in parser.mly, and it is interpreted in eval.ml.

The supported syntax is:

    exp ::=  x  |  y  |  z
         |  exp + exp
         |  exp - exp
         |  exp * exp
         |  exp / exp
         |  ( exp )


Requirements: ocaml, ocamlfind, menhir, js_of_ocaml


To build:
---------

    $ make


To run:
-------

Open index.html in a browser


Example 1:

    - Press 'Evaluate' (with '(x + y) * z' still in the text area)

    - the result 9 appears

      (hence '(x + y) * z' evaluates to 9 when x=1, y=2, and z=3)


Example 2:

    - Enter 'x + y--' (without the quotes) in the text area

    - Press 'Evaluate'

    - the result 'Parser.Error' appears

      (hence the string 'x + y--' is rejected by the parser)


Example 3:

    - Enter '2 + 2' (without the quotes) in the text area

    - Press 'Evaluate'

    - the result 'Failure in lexing: empty token' appears

      (hence the string '2 + 2' is rejected by the scanner)
