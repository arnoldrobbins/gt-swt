# gettxt --- locate text for line, copy to txt

   integer function gettxt (line)
   integer line

   pointer k
   pointer getind

   k = getind (line)
   call gtxt (k)

   return (k)

   end
