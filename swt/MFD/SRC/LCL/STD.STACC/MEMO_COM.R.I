# memo_com.r.i --- common block declarations for 'memo'

   character Display_cond (MAXLINE), Erase_cond (MAXLINE),
      Expression (MAXLINE), To_user (MAXLINE)

   integer Stack (MAXSP), Sp, Ep, Symbol, Symval, Operator

   pointer Symtab

   common /memocom/ Display_cond, Erase_cond, Expression, To_user,
      Stack, Sp, Ep, Symbol, Symval, Operator, Symtab


   integer Mem (MEMSIZE)

   common /ds$mem/ Mem
