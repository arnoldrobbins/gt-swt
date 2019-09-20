# std_io --- simple standard numeric I/O package


# inp$i --- input an integer from standard input 1, return 0 on EOF

   integer function inp$i (i)
   integer i

   integer j
   integer getlin, gctoi

   character line (MAXLINE)

   # We presume each input integer will be on a separate line:
   if (getlin (line, STDIN) == EOF) {
      i = 0
      return (0)
      }

   j = 1
   i = gctoi (line, j, 10)
   return (1)
   end



# inp$r --- input a "real" from standard input 1, return 0 on EOF

   integer function inp$r (r)
   real r

   integer j
   integer getlin

   real ctor

   character line (MAXLINE)

   # We presume each input real will be on a separate line:
   if (getlin (line, STDIN) == EOF) {
      r = 0.0
      return (0)
      }

   j = 1
   r = ctor (line, j)
   return (1)
   end



# outp$i --- output an integer quantity to standard output 1

   subroutine outp$i (i)
   integer i

   # Since input data is one value per line, output data will be the same:
   call print (STDOUT, "*i*n"s, i)

   return
   end



# outp$r --- output a "real" quantity to standard output 1

   subroutine outp$r (r)
   real r

   # Since input data is one value per line, output data will be the same:
   call print (STDOUT, "*r*n"s, r)

   return
   end
