let accept_all string = Some string
let accept_empty_suffix = function
   | _::_ -> None
   | x -> Some x


type month_nonterminals =
  | Jan | Feb | March | April | May | June
(* An example grammar.  *)

let month_grammar =
  (Jan,  
   function
     | Jan -> 
         [[N Feb; N March];  
          [N April]]  
     | Feb ->  
         [[N May];  
          [T"February"]]
     | March ->  
         [[T"Spring"];  
          [N June; T"March"]]
     | April ->  
         [[T"April showers bring May flowers"];  
          [N May]]  
     | May ->  
         [[T"May"]]
     | June ->  
         [[T"June"; N Jan];
          [T"Summer"]])
(*Write one good, nontrivial test case for your make_matcher function.
 It should be in the style of the test cases given below, but 
 should cover different problem areas. Your test case should be 
 named make_matcher_test.
 Your test case should test a grammar of your own.*)
let make_matcher_test = 
  ((make_matcher month_grammar accept_all ["Summer"] = Some []))

 
(* write a good test case make_parser_test for your make_parser 
function using your same test grammar. This test should check that
 parse_tree_leaves is in some sense the inverse of make_parser gram,
 in that when make_parser gram frag returns Some tree, then 
  parse_tree_leaves tree equals frag.*)
let small_month_frag =["Spring"; "June"; "May"]

let make_parser_test = 
  match make_parser month_grammar small_month_frag with
      | Some tree -> parse_tree_leaves tree = small_month_frag
      | _ -> false 

