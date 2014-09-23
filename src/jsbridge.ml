(*  interpret : string -> js_string t *)
let interpret s =
  let lexbuf = Lexing.from_string (Js.to_string s) in
  try
    let env = (1,2,3)in
    let exp = Parser.start Lexer.token lexbuf in  (* parse input *)
(*   let () = Pprint.print_exp exp in              (* pretty print *)
     let () = print_newline () in *)
    let v = (Eval.eval_exp exp env)             (* evaluate *)
    in Js.string (string_of_int v)
with
  | Failure msg        -> Js.string ("Failure in " ^ msg)
  | Parser.Error       -> Js.string "Parse error"
  | End_of_file        -> Js.string "Parse error: unexpected end of string"

(* export interpret function to JS's global scope *)
let () = Js.Unsafe.global##interpret <- Js.wrap_callback interpret
