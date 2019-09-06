# mklib --- make a compiler binary file into a library file

   declare _search_rule = "^int,^var,=bin=/&"

   >> cto | change FILE [mktree [arg 1] | quote] | x
      edb FILE.b FILE
      BRIEF
      RFL
      COPY ALL
      SFL
      QUIT
-EOF
