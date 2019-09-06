#  hist_com.r.i --- common block for the history mechanism

#  H_buf --- queue which holds the actual history commands
#  H_ptr --- queue of pointers into H_buf
#  H_bf  --- FIRST pointer into the H_buf queue
#  H_pf  --- FIRST pointer into the H_ptr queue
#  H_bl  --- LAST pointer into the H_buf queue
#  H_pl  --- LAST pointer into the H_ptr queue
#  H_line -- the number of the command pointed to by H_ptr(H_pl)

   pointer H_ptr(MAXHIST)
   character H_buf(HISTSIZE)
   integer H_bf, H_bl, H_pf, H_pl, H_line, H_on

   common /histcm/ H_bf, H_bl, H_pf, H_pl, H_line, H_ptr, H_buf, H_on
