# clock --- running time-of-day clock

   logical flag
   logical tquit$
   character time (9), prev
   character backup (9)
   data backup / 8 * BS, EOS /

   call break$ (DISABLE)               # disable break key
   prev = ' 'c                         # not a digit

   repeat {
      repeat {
         call date (SYS_TIME, time)
         if (time (8) ~= prev)         # seconds' ones position
            break
         call sleep$ (intl (100))      # minimal interval
         }
      prev = time (8)
      call putlin (time, ERROUT)
      call sleep$ (intl (900))         # milliseconds
      if (tquit$ (flag))
         break
      call putlin (backup, ERROUT)
      }

   call break$ (ENABLE)                # enable break key

   stop
   end
