# gtxt --- retrieve a line from the scratch file

   integer function gtxt (ptr)
   pointer ptr

   include SE_COMMON

   integer readf

   call seekf (Seekaddr (ptr), Scr)       # position to start of line

   return (readf (Txt, Lineleng (ptr), Scr) - 1)

   end
