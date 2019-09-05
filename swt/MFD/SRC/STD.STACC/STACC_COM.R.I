# include file for 'stacc'

   DS_DECL (mem, MEMSIZE)

   character inbuf (INBUFSIZE)
   integer ibp
   file_des pfd
   common /iocom/ inbuf, ibp, pfd

   character act_text (MAXACTC), erract_text (MAXERRC)
   integer num_actions, num_erractions, act_inx (MAXACT),
      erract_inx (MAXERR), next_act, next_erract
   common /actcom/ num_actions, num_erractions, act_inx, erract_inx,
      next_act, next_erract, act_text, erract_text

   character symboltext (MAXLINE)
   integer symbol
   common /parcom/ symbol, symboltext

   integer next_term_val, last_term_val
   common /termcom/ next_term_val, last_term_val

   integer language, linenumber, indentation, advance, svarval
   common /miscom/ language, linenumber, indentation, advance, svarval

   pointer term_table
   common /tabcom/ term_table

   character common_name (MAXLINE), statevar (MAXLINE),
      scanner (MAXLINE), symbolvar (MAXLINE), epsilon_name (MAXLINE)
   common /namcom/ common_name, statevar, scanner, symbolvar,
      epsilon_name
