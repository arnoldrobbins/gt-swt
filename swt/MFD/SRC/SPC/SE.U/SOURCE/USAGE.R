# usage --- print usage diagnostic and die

   subroutine usage

   string  u1 "Usage: se [ -t <term> ] { <pathname> | -<option> }"
   string  u2 "   <term> ::= adm31  | adm3a  | adm42  | adm5   | anp    |"
   string  u3 "              b150   | b200   | bantam | bee2   | cg     |"
   string  u4 "              consul | forsys | fox    | gt40   | h19    |"
   string  u5 "              hp2621 | hp2626 | hp2648 | hp9845 | hz1420 |"
   string  u6 "              hz1421 | hz1510 | ibm    | info   | isc    |"
   string  u7 "              microb | nby    | netron | pst100 | pt45   |"
   string  u8 "              regent | sbee   | sol    | terak  | trs80  |"
   string  u9 "              ts1    | tvi    | tvt    | vc4404 | vi200  |"
   string u10 "              viewpt | view90 | vt100  | z19"

   string u11 "   <opt>  ::= a | c | d[<dir>] | f | g | h[<speed>] |"
   string u12 "              i[a | <indent>] | k | l[<lop>] | lm[<col>] |"
   string u13 "              m[<opts>] | p[<s | u>] | s<lang> | t[<tabs>] |"
   string u14 "              u[<chr>] | v[<col>]  | w[<col>] | -[<row>]"

   call print (ERROUT, "*s*n"p,    u1)
   call print (ERROUT, "*s*n"p,    u2)
   call print (ERROUT, "*s*n"p,    u3)
   call print (ERROUT, "*s*n"p,    u4)
   call print (ERROUT, "*s*n"p,    u5)
   call print (ERROUT, "*s*n"p,    u6)
   call print (ERROUT, "*s*n"p,    u7)
   call print (ERROUT, "*s*n"p,    u8)
   call print (ERROUT, "*s*n"p,    u9)
   call print (ERROUT, "*s*n*n"p, u10)
   call print (ERROUT, "*s*n"p,   u11)
   call print (ERROUT, "*s*n"p,   u12)
   call print (ERROUT, "*s*n"p,   u13)
   call print (ERROUT, "*s*n"p,   u14)
   call error (""p)

   return
   end
