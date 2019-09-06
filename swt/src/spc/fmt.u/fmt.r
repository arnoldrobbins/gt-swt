# fmt --- text formatter main program

   include FMT_COMMON

   integer readln
   character inbuf (MAXOUT)

   call initialize

   while (readln (inbuf, MAXOUT) ~= EOF)
      call processline (inbuf)

   call reset_files

   stop
   end



# options --- process options, if any

   subroutine options

   include FMT_COMMON

   ARG_DECL
   integer i
   integer ctoi
   character arg (30)
   string usage "Usage: fmt [-s] [-p first[-last]] {pathname}"

   PARSE_COMMAND_LINE ("sp<rs>"s, usage)
   if (ARG_PRESENT (s))
      Stop_mode = YES
   if (ARG_PRESENT (p)) {
      call ctoc (ARG_TEXT (p), arg, 30)
      i = 1
      Start_page = ctoi (arg, i)
      if (arg (i) == '-'c) {
         i += 1
         End_page = ctoi (arg, i)
         }
      if (arg (i) ~= EOS)
         call error (usage)
      }

   return
   end



# initialize --- set parameters to default values

   subroutine initialize

   include FMT_COMMON

   integer i
   integer getarg
   pointer mktabl

   string_table req_pos, req_text _
      /fi_REQ, "fi" _      # fill
      /nf_REQ, "nf" _      # no-fill
      /br_REQ, "br" _      # break
      /ls_REQ, "ls" _      # line spacing
      /bp_REQ, "bp" _      # begin page
      /sp_REQ, "sp" _      # space
      /in_REQ, "in" _      # indent
      /rm_REQ, "rm" _      # right margin
      /ti_REQ, "ti" _      # temporary indent
      /ce_REQ, "ce" _      # center
      /ul_REQ, "ul" _      # underline
      /he_REQ, "he" _      # three-part header
      /fo_REQ, "fo" _      # three-part footer
      /pl_REQ, "pl" _      # page length
      /bf_REQ, "bf" _      # boldface
      /so_REQ, "so" _      # source
      /de_REQ, "de" _      # define
      /en_REQ, "en" _      # end macro definition
      /ta_REQ, "ta" _      # tab stops
      /tc_REQ, "tc" _      # tab character
      /cc_REQ, "cc" _      # control character
      /c2_REQ, "c2" _      # no-break control character
      /hy_REQ, "hy" _      # hyphenation on
      /nh_REQ, "nh" _      # hyphenation off
      /ne_REQ, "ne" _      # need
      /po_REQ, "po" _      # page offset
      /lm_REQ, "lm" _      # left margin
      /er_REQ, "er" _      # error message
      /lt_REQ, "lt" _      # length of titles
      /tl_REQ, "tl" _      # three-part title
      /rc_REQ, "rc" _      # replacement character
      /ad_REQ, "ad" _      # adjust
      /na_REQ, "na" _      # no-adjust
      /ns_REQ, "ns" _      # no-space
      /rs_REQ, "rs" _      # restore spacing
      /pn_REQ, "pn" _      # page number
      /ex_REQ, "ex" _      # exit
      /nx_REQ, "nx" _      # next file
      /xb_REQ, "xb" _      # extra blank mode
      /sb_REQ, "sb" _      # single blank mode
      /m1_REQ, "m1" _      # top margin, incl. header
      /m2_REQ, "m2" _      # margin after header
      /m3_REQ, "m3" _      # margin before footer
      /m4_REQ, "m4" _      # bottom margin, incl. footer
      /dv_REQ, "dv" _      # divert unformatted output
      /mc_REQ, "mc" _      # insert marginal character
      /mo_REQ, "mo" _      # set marginal character output margin
      /eh_REQ, "eh" _      # set header for even pages
      /ef_REQ, "ef" _      # set footer for even pages
      /oh_REQ, "oh" _      # set header for odd pages
      /of_REQ, "of" _      # set footer for odd pages
      /ps_REQ, "ps" _      # skip pages
      /oo_REQ, "oo" _      # set odd page offset
      /eo_REQ, "eo" _      # set even page offset
      /if_REQ, "if" _      # conditional macro execution
      /am_REQ, "am" _      # append to a macro
      /it_REQ, "it"        # italicize

   string_table fn_pos, fn_text _
      /ns_FN, "ns" _       # no space flag
      /pl_FN, "pl" _       # page length
      /pn_FN, "pn" _       # page number
      /ln_FN, "ln" _       # line number
      /po_FN, "po" _       # page offset
      /ls_FN, "ls" _       # line spacing
      /in_FN, "in" _       # indentation
      /rm_FN, "rm" _       # right margin
      /ti_FN, "ti" _       # temporary indentation
      /lm_FN, "lm" _       # left margin
      /cc_FN, "cc" _       # control character
      /c2_FN, "c2" _       # no-break control character
      /tc_FN, "tc" _       # tab character
      /ml_FN, "ml" _       # macro level
      /m1_FN, "m1" _       # margin 1
      /m2_FN, "m2" _       # margin 2
      /m3_FN, "m3" _       # margin 3
      /m4_FN, "m4" _       # margin 4
      /lt_FN, "lt"_        # title width
      /day_FN, "day" _     # day of the week
      /date_FN, "date" _   # mm/dd/yy
      /time_FN, "time" _   # hh:mm:ss
      /tcpn_FN, "tcpn" _   # page number, rt. justified in 4-char field
      /num_FN, "num" _     # fetch value of number register
      /set_FN, "set" _     # set value of number register
      /add_FN, "add" _     # add quantity to number register
      /ldate_FN, "ldate" _ # long date (e.g., January 31, 1966)
      /rn_FN,    "rn" _    # convert to lower-case Roman numerals
      /RN_FN,    "RN" _    # convert to upper-case Roman numerals
      /letter_FN, "letter" _ # convert to lower-case letter equiv.
      /LETTER_FN, "LETTER" _ # convert to upper-case letter equiv.
      /vertspace_FN, "vertspace" _ # change vert space on spinwriter
      /even_FN, "even" _   # test if number is even
      /odd_FN, "odd" _     # test if number is odd
      /cap_FN, "cap" _     # capitalize text
      /small_FN, "small" _    # map all characters of text to lower case
      /plus_FN, "plus" _   # add 2 numbers
      /minus_FN, "minus" _ # subtract arg2 from arg1
      /header_FN, "header" _           # return header
      /evenheader_FN, "evenheader" _   # return even page header
      /oddheader_FN, "oddheader" _     # return odd page header
      /footer_FN, "footer" _           # return footer
      /evenfooter_FN, "evenfooter" _   # return even page footer
      /oddfooter_FN, "oddfooter" _     # return odd page footer
      /cmp_FN, "cmp" _     # perform string comparison and return 1 (true) or 0 (false)
      /icmp_FN, "icmp" _   # perform integer comparison and return 1 (true) or 0 (false)
      /bottom_FN, "bottom" _  # return the number of the last printed line
      /top_FN, "top" _  # return the number of the first printed line
      /bf_FN, "bf" _       # boldface text
      /ul_FN, "ul" _       # selectively underline text
      /cu_FN, "cu" _       # continuously underline text
      /sub_FN, "sub" _     # generate a subscript
      /sup_FN, "sup" _     # generate a superscript
      /it_FN, "it"         # italicize text

   string_table spchar_pos, spchar_text _
      /alpha,        "alpha" _
      /ALPHA,        "ALPHA" _
      /beta,         "beta" _
      /BETA,         "BETA" _
      /gamma,        "gamma" _
      /GAMMA,        "GAMMA" _
      /delta,        "delta" _
      /DELTA,        "DELTA" _
      /epsilon,      "epsilon" _
      /EPSILON,      "EPSILON" _
      /zeta,         "zeta" _
      /ZETA,         "ZETA" _
      /eta,          "eta" _
      /ETA,          "ETA" _
      /theta,        "theta" _
      /THETA,        "THETA" _
      /iota,         "iota" _
      /IOTA,         "IOTA" _
      /kappa,        "kappa" _
      /KAPPA,        "KAPPA" _
      /lambda,       "lambda" _
      /LAMBDA,       "LAMBDA" _
      /mu,           "mu" _
      /MU,           "MU" _
      /nu,           "nu" _
      /NU,           "NU" _
      /xi,           "xi" _
      /XI,           "XI" _
      /omicron,      "omicron" _
      /OMICRON,      "OMICRON" _
      /pi,           "pi" _
      /PI,           "PI" _
      /rho,          "rho" _
      /RHO,          "RHO" _
      /sigma,        "sigma" _
      /SIGMA,        "SIGMA" _
      /tau,          "tau" _
      /TAU,          "TAU" _
      /upsilon,      "upsilon" _
      /UPSILON,      "UPSILON" _
      /phi,          "phi" _
      /PHI,          "PHI" _
      /chi,          "chi" _
      /CHI,          "CHI" _
      /psi,          "psi" _
      /PSI,          "PSI" _
      /omega,        "omega" _
      /OMEGA,        "OMEGA" _
      /infinity,     "infinity" _
      /integral,     "integral" _
      /INTEGRAL,     "INTEGRAL" _
      /largerbrace,  "largerbrace" _
      /largelbrace,  "largelbrace" _
      /tilde,        "tilde" _
      /backslash,    "backslash" _
      /uparrow,      "uparrow" _
      /downarrow,    "downarrow" _
      /nabla,        "nabla" _
      /not,          "not" _
      /partial,      "partial" _
      /proportional, "proportional" _
      /BACKSPACE,    "bs" _
      /BACKSPACE,    "BS" _
      /PHANTOMBL,    "bl" _
      /hlf,          "hlf" _
      /hlr,          "hlr" _
      /psset,        "psset" _
      /sset,         "sset" _
      /le,           "le" _
      /ge,           "ge" _
      /imp,          "imp" _
      /exist,        "exist" _
      /nexist,       "nexist" _
      /univ,         "univ" _
      /OR,           "or" _
      /AND,          "and" _
      /ne,           "ne" _
      /iso,          "iso" _
      /apeq,         "apeq" _
      /lfloor,       "lfloor" _
      /rfloor,       "rfloor" _
      /lceil,        "lceil" _
      /rceil,        "rceil" _
      /small0,       "small0" _
      /small1,       "small1" _
      /small2,       "small2" _
      /small3,       "small3" _
      /small4,       "small4" _
      /small5,       "small5" _
      /small6,       "small6" _
      /small7,       "small7" _
      /small8,       "small8" _
      /small9,       "small9" _
      /scolon,       "scolon" _
      /dquote,       "dquote" _
      /dollar,       "dollar"

   call dsinit (MEMSIZE)

   Com_table = mktabl (1)
   Fn_table = mktabl (1)
   Spchar_table = mktabl (1)

   for (i = 1; i <= req_pos (1); i += 1)
      call enter (req_text (req_pos (i + 1) + 1),
               req_text (req_pos (i + 1)), Com_table)

   for (i = 1; i <= fn_pos (1); i += 1)
      call enter (fn_text (fn_pos (i + 1) + 1),
               fn_text (fn_pos (i + 1)), Fn_table)

   for (i = 1; i <= spchar_pos (1); i += 1)
      call enter (spchar_text (spchar_pos (i + 1) + 1),
               spchar_text (spchar_pos (i + 1)), Spchar_table)

   Nospace = YES
   Adjust = 'b'c
   Cmdch = '.'c
   Nbcch = '`'c   # no-break control character
   Hyphenation = YES
   Extra_blank_mode = YES
   Dvflag = NO
   Inval = 0
   Lmval = 1
   Rmval = PAGEWIDTH
   Tiwidth = PAGEWIDTH
   Tival = 0
   Poval = 0
   Ooval = 0
   Eoval = 0
   Lsval = 1
   Fill = YES
   Ceval = 0
   Itval = 0
   Ulval = 0
   Bfval = 0
   Lineno = 0
   Curpag = 0
   Newpag = 1
   Start_page = 0
   End_page = HUGE
   Plval = PAGELEN
   M1val = MARGIN1; M2val = MARGIN2; M3val = MARGIN3; M4val = MARGIN4
   Bottom = Plval - M3val - M4val
   Even_header (1) = EOS   # initial titles
   Odd_header (1) = EOS
   Even_footer (1) = EOS
   Odd_footer (1) = EOS
   Outp = 1
   Outw = 0
   Outwds = 0

   do i = 1, MAXNUMREGS
      Numreg (i) = 0
   do i = 1, MAXLINE
      if (mod (i, 8) == 1)
         Tabs (i) = YES
      else
         Tabs (i) = NO

   Tabch = TAB
   Replch = PHANTOMBL
   Word_last = NO
   Mcch = ' 'c
   Tmcch = ' 'c
   Moval = 0
   Mcout = YES

   # initial option settings:
   Stop_mode = NO

   # macro-related initializations:
   Mactop = 1
   First_macro = ENDOFLIST
   Argtop = 1
   Maclvl = 1
   Argv (1) = 1

   # output file list
   Out_file = STDOUT
   do i = 1, MAXFILES
      O_list (i) = ERR

   # command line options and file names:
   F_ptr = 0
   Next_arg = 1
   call options        # check for any options
   if (getarg (Next_arg, File_name, MAXPATH) == EOF) {
      F_ptr += 1
      F_list (F_ptr) = STDIN
      F_type (F_ptr) = FILE
      }
   else {
      Next_arg += 1
      call newinp (File_name)
      }

   return
   end
