#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# size --- print out size of text in qda code file

   include PRIMOS_KEYS
   include "as6800_def.r.i"

   define(MOTOROLA_6800,0)
   define(INTEL_8080,1)

   character mach (MAXLINE), arg (MAXLINE)

   longint size

   integer codef, this_size, junk, type, machine
   integer getarg, open, getbyte, equal

   string motorola_6800 "-6800"
   string intel_8080 "-8080"
   string default "l.out"

   if (getarg (1, mach, MAXLINE) == EOF)
      call error ("Usage: size -(6800|8080) [<object_file>].")

   if (equal (mach, motorola_6800) == YES)
      machine = MOTOROLA_6800
   else if (equal (mach, intel_8080) == YES)
      machine = INTEL_8080
   else
      call error ("Usage:  size -(6800|8080) [<object_file>].")

   if (getarg (2, arg, MAXLINE) == EOF)
      call scopy (default, 1, arg, 1)

   codef = open (arg, READ)
   if (codef == ERR)
      call cant (arg)

   size = 0
   while (getbyte (type, codef) == OK)
      if (type ~= TEXTCODE) {
         call getword (this_size, codef, machine)
         for (; this_size > 0; this_size = this_size - 1)
            call getbyte (junk, codef)
         }
      else {
         call getword (this_size, codef, machine)
         size = size + this_size
         for (; this_size > 0; this_size = this_size - 1)
            call getbyte (junk, codef)
         }

   call close (codef)
   call print (STDOUT, "*l*n.", size)
   stop
   end



# getbyte --- read one byte from code file

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


# getword --- read word from object code file

   subroutine getword (w, fd, m)
   integer w, fd, m

   integer hi, lo

   if (m == MOTOROLA_6800) {
      call getbyte (hi, fd)
      call getbyte (lo, fd)
      }
   else if (m == INTEL_8080) {
      call getbyte (lo, fd)
      call getbyte (hi, fd)
      }

   w = or (ls (hi, 8), lo)

   return
   end
