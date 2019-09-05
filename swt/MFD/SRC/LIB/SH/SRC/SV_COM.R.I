# svcom --- shell variable common area

   common /svcom/ Sv_ll,
         Sv_tbl (SV_DEPTH, SV_MAXHASH),
         Sv_mem (SV_MEMSIZE),
         Eofsave (SV_DEPTH),
         Esave   (SV_DEPTH),
         Escsave (SV_DEPTH),
         Ksave   (SV_DEPTH),
         Nlsave  (SV_DEPTH),
         Rtsave  (SV_DEPTH),
         Kresp_save (MAXKILLRESP, SV_DEPTH),
         Pdest_save (MAXPRTDEST,  SV_DEPTH),
         Pform_save (MAXPRTFORM,  SV_DEPTH)

   integer  Sv_ll,      # Current scope level
            Sv_tbl,     # Hash table
            Sv_mem,     # Dynamic memory

            Eofsave,    # Save array for the Eofchar
            Esave,      # Save array for the Echar
            Escsave,    # Save array for the Escchar
            Ksave,      # Save array for the Kchar
            Nlsave,     # Save array for the Nlchar
            Rtsave,     # Save array for the Rtchar
            Kresp_save, # Save array for the Kill_resp
            Pdest_save, # Save array for the Prt_dest
            Pform_save  # Save array for the Prt_form
