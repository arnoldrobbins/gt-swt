# dologout --- save things when a LOGOUT$ happens

   subroutine dologout (cp)
   long_int cp    # condition pointer, not used

   integer junk

   include SE_COMMON

   call remark ("saving buffer because of pending logout"p)

   call dowrit (1, Lastln, "=home=/se.logout"s, NO, YES)

   call clrbuf

   call duplx$ (Tty_state)   # restore original terminal parameters

   call break$ (ENABLE)       # enable break key

   call cnsig$ (junk)         # continue the signal

   return
   end
