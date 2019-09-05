# speling --- detect possible spelling errors

   declare _search_rule = "^int,=bin=/&,^var"

   find "%[~.]" [args] | tlit A-Z a-z | tlit ~a-z @n | _
      sort | uniq | common -2 =aux=/spelling/words
