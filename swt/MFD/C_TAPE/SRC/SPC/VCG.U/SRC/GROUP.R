# group --- group collection routine

   subroutine group (group_data)
   integer group_data (ARB)

   include OTG_COMMON

   integer i, size, ndata

   #  calculate the true size of the group, so we must
   #  include the group control word
   size = mod (group_data (1), BIT8) + 1
DB call print (ERROUT, "group: size = *,-8i*n"s, size)

   if (rs (group_data (1), 8) == DATA_GROUP)
      {
DB    call print (ERROUT, "   data group*n"s)
      # Data_ptr points to the data group control word
      # see if there's room , if not flush it
      if (  Data_ptr == 0 && Block (1) + size + 1 > MAX_BLOCK
         # not enough room for new data block
         || Data_ptr > 0 && Block (1) + size > MAX_BLOCK)
         # not enough room to add another datum
         {
DB       call print (ERROUT, "   no room for data group - flushing buffer*n"s)
         call flush
         Data_ptr = 0
         }

      if (Data_ptr == 0)    # copy entire data group
         {
DB       call print (ERROUT, "   data:*n"s)
         do i = 1, size;
            {
DB          call print (ERROUT, "   *c"s, group_data (i))
            Block (Block (1) + i + 1) = group_data (i)
            }
DB       call print (ERROUT, "*n"s)
         Data_ptr = Block (1) + 1 + 1
         }

      else                 # stick data at end of current group
         {
DB       call print (ERROUT, "   data:*n      "s)
         # get number of data items in data group
         ndata = mod (Block (Data_ptr), BIT8)

         do i = 2, size;
            {
DB          call print (ERROUT, "   *c"s, group_data (i))
            Block (Data_ptr + ndata + i - 1) = group_data (i)
            Block (Data_ptr) += 1
            }
DB       call print (ERROUT, "*n"s)
         size -= 1                     # didn't copy group header
         }
      }

   else
      {
DB    call print (ERROUT, "   non-data group*n"s)
      # reset Data_ptr to 0 so we know we're not in a data group
      # stick the new group into the block as usual
      Data_ptr = 0

      # if the group is too large to add to the current block,
      # write out the current block and reset the block request.
      if ((Block (1) + size + 1) > MAX_BLOCK) {
DB       call print (ERROUT, "   block overflow*n"s)
DB       call print (ERROUT, "   block control word - *,-8i*n"s, Block (2))
         call flush
         }

      # place the group in the current block

DB    call print (ERROUT, "   data:*n"s)
      do i = 1, size; {
DB       call print (ERROUT, "   *,-8i"s, group_data (i))
         Block (Block (1) + i + 1) = group_data (i)
         }
DB    call print (ERROUT, "*n"s)
      }

   # update the block size word
   Block (1) = Block (1) + size
DB call print (ERROUT, "   new block size is *,-8i*n"s, Block (1))
   return
   end
