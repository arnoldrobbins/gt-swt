#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# symbols --- print out symbol information in qda code file

   include PRIMOS_KEYS
   include "as6800_def.r.i"

   define(MOTOROLA_6800,0)
   define(INTEL_8080,1)

   character arg (MAXLINE), mach (MAXLINE)
   character atoc

   integer codef, i, junk, type, machine
   integer getarg, open, getbyte, equal

   string motorola_6800 "-6800"
   string intel_8080 "-8080"
   string default "l.out"

   if (getarg (1, mach, MAXLINE) == EOF)
      call error ("Usage:  symbols -(6800|8080) [<object_file>].")
   if (equal (mach, motorola_6800) == YES)
      machine = MOTOROLA_6800
   else if (equal (mach, intel_8080) == YES)
      machine = INTEL_8080
   else
      call error ("Usage:  symbols -(6800|8080) [<object_file>].")

   if (getarg (2, arg, MAXLINE) == EOF)
      call scopy (default, 1, arg, 1)

   codef = open (arg, READ)
   if (codef == ERR)
      call cant (arg)

   call print (STDOUT, "type   value   name*n.")
   while (getbyte (type, codef) == OK)
      if (type ~= SYMBOLCODE) {
         call getword (i, codef, machine)
         for (; i > 0; i = i - 1)
            call getbyte (junk, codef)
         }
      else {
         call getword (junk, codef, machine)
         call getword (type, codef, machine)
         if (type == ABSOLUTE)
            call print (STDOUT, "abs   .")
         else if (type == RELOCATABLE)
            call print (STDOUT, "rel   .")
         else if (type == EXTERNAL)
            call print (STDOUT, "ext   .")
         else
            call print (STDOUT, " ?    .")
         call getword (type, codef, machine)
         call print (STDOUT, "  *4,16,0j   .", type)
         repeat {
            call getbyte (type, codef)
            if (type == 0) {
               call putch (NEWLINE, STDOUT)
               break
               }
            call putch (atoc (type), STDOUT)
            }
         }

   call close (codef)
   stop
   end



# atoc --- convert real ASCII to Prime ASCII

   character function atoc (i)
   integer i

   atoc = or (i, :200)

   return
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
