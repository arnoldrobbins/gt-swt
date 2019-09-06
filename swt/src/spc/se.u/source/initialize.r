# initialize --- set up comon blocks, get terminal type

   subroutine initialize

   include SE_COMMON

   integer getarg, decode_mnemonic
   character lin (MAXLINE)

   string default_tabs "+3"

   ### Determine what type of terminal we're on:
   Argno = 1
   if (getarg (Argno, lin, MAXLINE) ~= EOF
         && lin (1) == '-'c
         && (lin (2) == 't'c || lin (2) == 'T'c)
         && lin (3) == EOS) {
      Argno = 2
      if (getarg (Argno, lin, MAXLINE) ~= EOF) {
         Argno = 3
         call mapstr (lin, LOWER)   # map to lower case
         Term_type = decode_mnemonic (lin)
         if (Term_type == ERR)
            call usage
         }
      else
         call usage
      }
   else
      call get_term_type (Term_type)


   ### Initialize the scratch file:

   call setbuf


   ### Initialize screen format parameters:

   call setscreen


   ### Initialize miscellaneous variables:

   Buffer_changed = NO
   Errcode = ENOERR
   Saverrcode = ENOERR
   Probation = NO
   Sav_com (1) = EOS


   ### Initialize the saved pattern and character list arrays:

   Pat (1) = EOS
   Tlpat (1) = EOS
   Subs (1) = EOS


   ### Initialize the saved file name:

   Savfil (1) = EOS


   ### Initialize the saved markname:

   Savknm = DEFAULTNAME


   ### Initialize the saved scan character:

   Last_char_scanned = 0      # an illegal value


   ### Initialize option parameters:

   call scopy (default_tabs, 1, Tabstr, 1)
   call settab (Tabstr)
   Ddir = FORWARD
   Absnos = NO
   Nchoise = EOS        # meaning no display
   Overlay_col = 0      # meaning end of line
   Unprintable = ' 'c
   Warncol = 74
   Firstcol = 1
   Indent = 1
   Tspeed = DEFAULT_TSPEED

   ### Initialze Unix/SWT state:

   Unix_mode = NO
   BACKSCAN = '\'c
   XMARK = '!'c
   NOTINCCL = '~'c
   ESCAPE = '@'c
   call setpat (Unix_mode)  # will be NO, default to SWT

   return
   end
