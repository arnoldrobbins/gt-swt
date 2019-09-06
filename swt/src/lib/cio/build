# build --- build the C Standard I/O Library

   declare _search_rule = '^int,^var,=bin=/&,=ebin=/&'

   # build the regular ciolib first

   # first the C files
   files .c$ | _
      change ?* "cc &" | sh

   # then the assembly
   files .s$ | change ?* "pmac &" | sh

   echo >ciolib.b
   file_list> find '%#' -x | _
        change "?*" "INSERT &.b" | _
           { echo edb ciolib.b _ciolib; _
             echo BRIEF; echo RFL; _
             cto; _
             echo SFL; echo QUIT } | x

   >> cto | x
   r lib>libedb
   _ciolib ciolib 0
-EOF

   # now build just the routines that are different
   cc -DSTAND_ALONE ([cat _standalone]).c

   # compile the single ratfor routiine
   rfc getarg.r -a

   echo >nciolib.b
   _standalone> change "?*" "INSERT &.b" | _
        { echo edb nciolib.b _nciolib; _
          echo BRIEF; echo RFL; _
          cto; _
          echo INSERT getarg.b; _
          echo SFL; echo QUIT } | x

   >> cto | x
   r lib>libedb
   _nciolib nciolib 0
-EOF

   del _ciolib _nciolib
