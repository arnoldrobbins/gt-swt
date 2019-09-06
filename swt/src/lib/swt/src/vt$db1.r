# vt$db1 --- print mnemonics for special character sequence

   subroutine vt$db1 (title, seq)
   character title (ARB), seq (ARB)

   integer i
   character str (MAXLINE)

   call print (ERROUT, "*s="s, title)
   for (i = 1; seq (i) ~= EOS; i += 1) {
      call ctomn (seq (i), str)
      call print (ERROUT, "*s "s, str)
      }
   call print (ERROUT, "EOS*n"s)

   return
   end
