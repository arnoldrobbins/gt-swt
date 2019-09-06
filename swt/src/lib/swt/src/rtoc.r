# rtoc --- convert single precision real to string

   integer function rtoc (val, str, w, d)
   real val
   character str (ARB)
   integer w, d

   integer dtoc
   longreal fval

   fval = val     # convert to double precision
   return (dtoc (fval, str, w, d))

   end
