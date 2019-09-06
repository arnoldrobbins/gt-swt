#  otg$blk --- initilize for a certain block type

   subroutine otg$blk (block_type)
   integer block_type

   include OTG_COMMON


   call flush
   Block (1) = 1

   select (block_type)
   when (PREFIX_BLOCK)
      {
      Block (2) = PREFIX_BLOCK * BIT4
DB    call print (ERROUT, "otg$blk: prefix block*n"s)
      }
   when (DATA_BLOCK)
      {
      Block (2) = DATA_BLOCK * BIT4
DB    call print (ERROUT, "otg$blk: data block*n"s)
      }
   when (END_BLOCK)
      {
      Block (2) = END_BLOCK * BIT4
DB    call print (ERROUT, "otg$blk: end block*n"s)
      }
   else
      call error ("Illegal block type (blk_type)"p)

   return
   end
