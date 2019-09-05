# get_term_type --- force user to divulge terminal type

   subroutine get_term_type (term_type)
   integer term_type

   integer gttype, gtattr, decode_mnemonic
   character ttype (MAXTERMTYPE)

   if (gttype (ttype) == NO)
      call error ("I'm sorry, but you must supply a terminal type."p)

   if (gtattr (TA_SE_USEABLE) == NO) {
      call print (ERROUT, "I'm sorry, but I can't support a *s terminal."s,
                     ttype)
      call error (""p)
      }

   term_type = decode_mnemonic (ttype)
   if (term_type == ERR) {
      call print (ERROUT, "Contrary to the setting of the 'se' terminal*n"s)
      call print (ERROUT, "option, I cannot support a *s terminal."s, ttype)
      call error (""p)
      }

   return
   end
