#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# lib --- concatenate object files

include PRIMOS_KEYS

   character arg(MAXARG)
   integer unit, fout
   integer open, create, getnext

   string outfile "lib.out"

   fout = create (outfile, WRITE)
   if (fout == ERR)
      call cant (outfile)

   while (getnext (arg) ~= EOF) {
      unit = open(arg, READ)
      if (unit == ERR)
         call cant (arg)
      call fcopy(unit, fout)
      call close(unit)
      }

   call close (fout)
   call swt
   end

# getnext --- get next argument, either from STDIN or arg list
#           returns length of argument or EOF

   integer function getnext (arg)

   character arg (ARB)

   integer getarg, getlin

   integer count, len
   data count /0/

   if (getarg (1, arg, MAXARG) ~= EOF) {
      count = count + 1
      getnext = getarg (count, arg, MAXARG)
      }
   else {
      len = getlin (arg, STDIN, MAXARG)
      if (len == EOF)
         getnext = EOF
      else {
         arg (len) = EOS
         getnext = len - 1
         }
      }

   return
   end



# fcopy --- copy fin to fout
   subroutine fcopy(fin, fout)
   integer fin, fout

   integer getbyte

   integer b

   while (getbyte (b, fin) == OK)
      call putbyte (b, fout)

   return
   end


# getbyte --- read one byte from object file

   integer function getbyte (b, fd)
   integer b, fd

   integer junk, rc
   integer mapfd

   call prwf$$ (KREAD, mapfd (fd), loc (b), 1, intl (0), junk, rc)
   if (rc == 0)
      getbyte = OK
   else
      getbyte = ERR

   return
   end


# putbyte --- write given byte onto Outfile file

   subroutine putbyte (b, fd)
   integer b, fd

   integer w, junk
   integer mapfd

   w = rt (b, 8)
   call prwf$$ (KWRIT, mapfd (fd), loc (w), 1, intl (0), junk, junk)

   return
   end
