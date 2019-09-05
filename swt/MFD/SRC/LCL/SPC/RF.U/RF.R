# rf --- Kernighan and Plauger's Ratfor Preprocessor

# Standard defines for special characters, EOS, etc.
#    Software Tools Subsystem, Version 4
#    All defines for characters have bit 8 set

# Special characters:
define(BLANK,:240)
define(BANG,:241)    # Exclamation point
define(DQUOTE,:242)
define(SHARP,:243)
define(DOLLAR,:244)
define(PERCENT,:245)
define(AMPERSAND,:246)
define(AMPER,AMPERSAND)
define(SQUOTE,:247)
define(LPAREN,:250)
define(RPAREN,:251)
define(STAR,:252)
define(PLUS,:253)
define(COMMA,:254)
define(MINUS,:255)
define(PERIOD,:256)
define(SLASH,:257)
define(COLON,:272)
define(SEMICOL,:273)
define(LESS,:274)
define(EQUALS,:275)
define(GREATER,:276)
define(QMARK,:277)
define(ATSIGN,:300)
define(LBRACK,:333)
define(BACKSLASH,:334)
define(RBRACK,:335)
define(CARET,:336)
define(UNDERLINE,:337)
define(AGRAVE,:340)
define(LBRACE,:373)
define(BAR,:374)
define(RBRACE,:375)
define(TILDE,:376)


# ASCII control characters:

define(NUL,:200)
define(CTRL_A,:201)   define(SOH,:201)
define(CTRL_B,:202)   define(STX,:202)
define(CTRL_C,:203)   define(ETX,:203)
define(CTRL_D,:204)   define(EOT,:204)
define(CTRL_E,:205)   define(ENQ,:205)
define(CTRL_F,:206)   define(ACK,:206)
define(CTRL_G,:207)   define(BEL,:207)
define(CTRL_H,:210)   define(BS,:210)
define(CTRL_I,:211)   define(HT,:211)
define(CTRL_J,:212)   define(LF,:212)
define(CTRL_K,:213)   define(VT,:213)
define(CTRL_L,:214)   define(FF,:214)
define(CTRL_M,:215)   define(CR,:215)
define(CTRL_N,:216)   define(SO,:216)
define(CTRL_O,:217)   define(SI,:217)
define(CTRL_P,:220)   define(DLE,:220)
define(CTRL_Q,:221)   define(DC1,:221)
define(CTRL_R,:222)   define(DC2,:222)
define(CTRL_S,:223)   define(DC3,:223)
define(CTRL_T,:224)   define(DC4,:224)
define(CTRL_U,:225)   define(NAK,:225)
define(CTRL_V,:226)   define(SYN,:226)
define(CTRL_W,:227)   define(ETB,:227)
define(CTRL_X,:230)   define(CAN,:230)
define(CTRL_Y,:231)   define(EM,:231)
define(CTRL_Z,:232)   define(SUB,:232)
define(CTRL_LBRACK,:233)      define(ESC,:233)
define(CTRL_BACKSLASH,:234)   define(FS,:234)
define(CTRL_RBRACK,:235)      define(GS,:235)
define(CTRL_CARET,:236)       define(RS,:236)
define(CTRL_UNDERLINE,:237)   define(US,:237)
define(SP,:240)
define(DEL,:377)

# Important non-printing characters:
define(BACKSPACE,BS)
define(TAB,HT)
define(BELL,BEL)
define(NEWLINE,LF)
define(RHT,DC1)
define(RUBOUT,DEL)

# Miscellaneous defines for Ratfor, etc.:
define(NOT,TILDE)
define(character,integer)
define(pointer,integer)
define(elif,else if)
define(longint,integer*4)
define(floating,real*8)
define(bool,logical)
define(bits,integer)
define(ESCCHAR,ATSIGN)
define(DIGIT,DIG0)
define(LETTER,LETA)
define(MAXCHARS,10)
define(HUGE,10000)

# Status and action symbols:
define(ARB,1)
define(EOF,-1)
define(EOS,0)
define(ERR,-3)
define(MAXARG,128)
define(MAXCARD,101)
define(MAXLINE,102)  # Should be one more than MAXCARD
define(MAXPAT,256)
define(MAXSTR,100)
define(MINFD,4)
define(MAXFD,15)
define(NO,0)
define(OK,-2)
define(NOTOPEN,0)
define(READ,1)
define(READONLY,READ)
define(READWRITE,3)
define(STDIN1,-10)
define(STDOUT1,-11)
define(STDIN2,-12)
define(STDOUT2,-13)
define(STDIN3,-14)
define(STDOUT3,-15)
define(STDIN,STDIN1)
define(STDOUT,STDOUT1)
define(ERRIN,STDIN3)
define(ERROUT,STDOUT3)
define(WRITE,2)
define(YES,1)
define(NOTEXECUTABLE,1)
define(ISCIFILE,-4)
define(NOTFOUND,0)
define(FOUND,1)
define(DAM,1)
define(SAM,0)
define(TTY,1)
define(ABS,0)
define(REL,1)
define(LOWER,1)
define(UPPER,2)
define(BOTH,3)
define(INFOLENGTH,263)
define(IOLENGTH,1244)
define(PROFLENG,54)    # Length of user's saved profile
define(SIGNED_MAGNITUDE,0)
define(RADIX_COMPLEMENT,1)


# Beginning of definitions for Ratfor:

define(ALPHA,10100)
define(ANYWHERE,1)
define(BUFSIZE,402)   # pushback buffer, should be 300 greater than MAXLINE
define(DEFONLY,-1)
define(DISPATCH,10271)
define(LEXANDIF,10273)
define(LEXBREAK,10264)
define(LEXCASE,10274)
define(LEXNONEXECUTABLE,10275)
define(LEXRETURN,10276)
define(LEXSTOP,10277)
define(LEXDIGITS,10260)
define(LEXDO,10266)
define(LEXELSE,10262)
define(LEXFOR,10268)
define(LEXIF,10261)
define(LEXNEXT,10265)
define(LEXORIF,10272)
define(LEXOTHER,10267)
define(LEXREPEAT,10269)
define(LEXSTRING,10280)
define(LEXUNTIL,10270)
define(LEXWHILE,10263)
define(MAXCASELAB,400)     # max pending var's & lab's for case
define(MAXCASENEST,10)     # max nesting of case's
define(MAXCHARS,10)        # characters for outnum
define(MAXDEF,200)         # max chars in a defn
define(MAXFORSTK,200)      # max space for for reinit clauses
define(MAXIDLENG,6)        # maximum length of uniqued name
define(MAXNAME,MAXLINE)    # file name size in gettok
define(MAXSTACK,100)       # max stack depth for parser
define(MAXSTRING,1000)     # max size of string definitions
define(MAXSYM,6000)        # max chars in making unique names
define(MAXTOK,MAXLINE)     # max chars in a token
define(NCHARS,33)          # number of special characters
define(NFILES,5)           # max depth of file inclusion
define(NUMERIC,10101)
define(UFCHAR,DIG0)        # Fill character for making unique names
define(MEMSIZE,13000)      # dynamic storage space, for definitions, etc.
define(MINCHARVAL,NUL)     # integer equivalent of smallest character
define(MAXCHARVAL,DEL)     # integer equivalent of largest character
define(MAXCHARVAL_P_1,256) # one greater than MAXCHARVAL

define(pointer,integer)    # for strong typing purists
define(untyped,integer)    # not for strong typing purists

   character inpf (MAXARG), outf (MAXARG)
   character mapdn
   integer fd, argp, i, j, k, arg_map (26), status
   integer getarg, length, create, open, chkarg

   include "rf_com.r.i"

   string dict "timer_dictionary"

   define(ARG_C,3)
   define(ARG_O,15)
   define(ARG_P,16)
   define(ARG_T,20)

#  call init      #  6/23/82  EOS value change incompatibility

   call initkw
   in_declarations = YES
   call ptoc ("_main_*", STAR, spname, 7)

   do i = 1, 26
      arg_map (i) = -1

   arg_map (ARG_C) = 0   # c option
   arg_map (ARG_O) = 0   # o option
   arg_map (ARG_P) = 0   # p option
   arg_map (ARG_T) = 0   # t option

   k = 1
   status = chkarg (k, arg_map)
   if (status == ERR)
      call error ("Usage: rf [-{c|p|t}] [ [-o outf] inf {inf} ].")

   if (arg_map (ARG_P) > 0) {    # profile option
      dictionary = create (dict, WRITE)
      if (dictionary == ERR)
         call cant (dict)
      time_profile = YES
      spnum = 1
      call print (dictionary, "@.main@.*n.")
      }
   else
      time_profile = NO

   if (arg_map (ARG_T) > 0)      # trace option
      program_trace = YES
   else
      program_trace = NO

   if (arg_map (ARG_C) > 0)
      stc_profile = YES
   else
      stc_profile = NO

   if (status == EOF) {   # no input file names specified, use STDIN
      infile (1) = STDIN
      linect (1) = 0
      outfil = STDOUT
      call parse
      if (time_profile == YES)
         call output_pblocks
      if (stc_profile == YES)
         call out_stcblocks
      call output_names
      }
   else {
      call getarg (k, outf, MAXARG)
      if (arg_map (ARG_O) > 0)   # output file option
         argp = k + 1
      else {
         for (i = length (outf); i >= 1; i = i - 1)
            if (outf (i) == SLASH)
               break

         for (j = i + 1; j < i + 31; j = j + 1) {
            if (outf (j) == EOS)
            orif (outf (j) == PERIOD & mapdn (outf (j + 1)) == LETR &
                  outf (j + 2) == EOS)
               break
            }

         outf (j) = PERIOD
         outf (j + 1) = LETF
         outf (j + 2) = EOS
         argp = k
         }

      outfil = create (outf, WRITE)
      if (outfil == ERR) {
         if (time_profile == YES)   # need to close dictionary file
            call close (dictionary)
         call cant (outf)
         }

      for ( ; getarg (argp, inpf, MAXARG) ~= EOF; argp = argp + 1) {
         fd = open (inpf, READ)
         if (fd ~= ERR) {
            infile (1) = fd
            linect (1) = 0
            level = 1
            call parse
            call close (fd)
            }
         else
            call print (ERROUT, "*s: can't open*n.", inpf)
         }

      if (time_profile == YES) {
         call output_pblocks
         call close (dictionary)
         }

      if (stc_profile == YES)
         call out_stcblocks

      call output_names
      call close (outfil)
      }

   stop
   end

# alldig --- return YES if str is all digits

   integer function alldig (str)
   character str (ARB)
   integer i

   include "rf_com.r.i"

   alldig = NO
   if (str (1) == EOS)
      return
   for (i = 1; str (i) ~= EOS; i = i + 1)
      if (type (str (i) + 1) ~= DIGIT)
         return
   alldig = YES
   return
   end

# andcod --- generate code for andif

   subroutine andcod (lab)
   integer lab

   call stmt_count
   call ifgo (lab)
   return
   end

# balpar --- copy balanced paren string

   subroutine balpar
   character gettok
   character t, token (MAXTOK)
   integer nlpar

   if (gettok (token, MAXTOK) ~= LPAREN) {
      call synerr ("missing left paren.")
      return
      }
   call outstr (token)
   nlpar = 1
   repeat {
      t = gettok (token, MAXTOK)
      if (t==SEMICOL | t==LBRACE | t==RBRACE | t==EOF) {
         call pbstr (token)
         break
         }
      if (t == NEWLINE)      # delete newlines
         token (1) = EOS
      else if (t == LPAREN)
         nlpar = nlpar + 1
      else if (t == RPAREN)
         nlpar = nlpar - 1
      # else nothing special
      call outstr (token)
      } until (nlpar <= 0)
   if (nlpar ~= 0)
      call synerr ("missing parenthesis in condition.")
   return
   end

# brknxt --- generate code for break and next

   subroutine brknxt (sp, lextyp, labval, token)
   integer i, sp, level, token, labval (MAXSTACK), lextyp (MAXSTACK)
   character tokstr (MAXTOK), t
   integer gettok, alldig, ctoi, labgen

   t = gettok (tokstr, MAXTOK)
   if (t == NEWLINE | t == SEMICOL)
      level = 1
   else if (alldig (tokstr) == YES) {
      i = 1
      level = ctoi (tokstr, i)
      if (tokstr (i) ~= EOS)
         level = 0
      }
   else level = 0

   if (level == 0)
      call synerr ("illegal level number.")

   for (i = sp; i > 0; i = i - 1)
      if (lextyp (i) == LEXWHILE | lextyp (i) == LEXDO
        | lextyp (i) == LEXFOR | lextyp (i) == LEXREPEAT) {
         level = level - 1
         if (level <= 0) {
            call stmt_count
            if (token == LEXBREAK)
               call outgo (labval (i)+1)
            else
               call outgo (labval (i))
            call outcon (labgen (1))
            return
            }
         else i = i - 1
         }
   if (token == LEXBREAK)
      call synerr ("illegal break.")
   else
      call synerr ("illegal next.")
   return
   end

# bumpch --- increment character (ASCII)

   integer function bumpch (ch)
   character ch

   if (ch < LETA | ch > LETZ)
      ch = LETA - 1

   if (ch >= LETZ)
      bumpch = NO
   else {
      bumpch = YES
      ch = ch + 1
      }

   return
   end

# casec --- generate inital code for case

   subroutine casec (lab)
   integer lab
   integer str (MAXTOK)
   integer lex, length, labgen
   include "rf_com.r.i"

   if (csp >= MAXCASENEST) {
      call synerr ("case nesting too deep.")
      return
      }
   csp = csp + 1
   cstack (csp) = ctop + 1   # set pointer to label stack
   if (lex (str) ~= LEXOTHER || length (str) > MAXIDLENG
      || type (str (1) + 1) ~= LETTER) {
      call pbstr (str)
      call synerr ("illegal case variable.")
      clab (ctop + 1) = EOS
      ctop = ctop + MAXIDLENG + 1
      return
      }
   if (ctop + 1 + MAXIDLENG + 1 > MAXCASELAB) {
      call synerr ("too many case labels.")
      return
      }
   call scopy (str,1,clab,ctop + 1)
   ctop = ctop + MAXIDLENG + 1
   lab = labgen (3)
   if (lex (str) ~= LBRACE) {
      call synerr ("compound statement must follow case.")
      return
      }
   call pbstr (str)   # put back left brace
   call stmt_count
   call outgo (lab)
   call outcon (lab + 2)
   return
   end

# casei --- generate intermediate code for case

   subroutine casei (lab)
   integer lab
   integer labgen
   include "rf_com.r.i"

   if (ctop + 1 >= MAXCASELAB) {
      call synerr ("too many case labels.")
      return
      }
   ctop = ctop + 1
   clab (ctop) = labgen (1)
   call outgo (lab)
   call outcon (clab (ctop))
   return
   end

# cases --- generate final code for case

   subroutine cases (lab)
   integer i
   include "rf_com.r.i"
   string cgoto "goto ("

   if (csp < 1 | csp > MAXCASENEST) {
      call synerr ("case stack underflow.")
      return
      }
   call outnum (lab)
   call outtab
   call outstr (cgoto)
   for (i = cstack (csp) + 7; i < ctop - 1; i = i + 1) {
      call outnum (clab (i))
      call outch (COMMA)
      }
   call outnum (clab (i))
   call outch (RPAREN)
   call outch (COMMA)
   i = cstack (csp)
   call outstr (clab (i))
   call outdon
   ctop = cstack (csp) - 1   # clean up stacks
   csp = csp - 1
   return
   end

# deftok --- get token; process macro calls and invocations

   character function deftok (token, toksiz)
   character gtok
   integer toksiz

   include "rf_com.r.i"

   character defn (MAXDEF), t, token (toksiz)
   string defnam "define"

   integer defn_text
   integer lookup, equal

   for (t=gtok (token, toksiz); t~=EOF; t=gtok (token, toksiz)) {
      if (t ~= ALPHA)   # non-alpha
         break
      if (equal (token, defnam) == YES) {   # get definition
         call getdef (token, toksiz, defn, MAXDEF)
         call instal (token, defn)
         next
         }
      if (lookup (token, defn_text, def_table) == NO)    # undefined
         break
      call pbstr (mem (defn_text))  # push back replacement (subarray)
      }
   if (t == ALPHA) {    # convert to single case
      call letdig (token)    # 2-27-78 expand LETx, BIGx, and DIGn
      call fold (token)
      call get_spname (token)   # 9/2/77 get subprogram names for trace
      call mkuniq (token)    #  6/8/77  make unique name
      }
   deftok = t
   return
   end

# docode --- generate code for beginning of do

   subroutine docode (lab)
   integer labgen
   integer lab
   # string dostr "DO "
   integer dostr (4)
   data dostr /BIGD, BIGO, BLANK, EOS/

   call outtab
   call outstr (dostr)
   lab = labgen (2)
   call outnum (lab)
   call eatup
   call stmt_count
   return
   end

# dostat --- generate code for end of do statement

   subroutine dostat (lab)
   integer lab

   call outcon (lab)
   call outcon (lab+1)
   return
   end

# eatup --- process rest of statement; interpret continuations

   subroutine eatup
   character gettok
   character ptoken (MAXTOK), t, lastt, token (MAXTOK)
   integer nlpar

   t = EOS
   nlpar = 0
   repeat {
      lastt = t
      t = gettok (token, MAXTOK)
      if (t == SEMICOL)
         break
      if (t == NEWLINE) {
         if (lastt == COMMA | lastt == UNDERLINE | lastt == PLUS
            | lastt == MINUS | lastt == STAR | lastt == BAR
            | lastt == AMPER)
            next
         break
         }
      if (t == RBRACE) {
         call pbstr (token)
         break
         }
      if (t == LBRACE | t == EOF) {
         call synerr ("unexpected brace or EOF.")
         call pbstr (token)
         break
         }
      if (t == UNDERLINE)
         next
      if (t == LPAREN)
         nlpar = nlpar + 1
      else if (t == RPAREN)
         nlpar = nlpar - 1
      call outtab
      call outstr (token)
      } until (nlpar < 0)
   if (nlpar ~= 0)
      call synerr ("unbalanced parentheses.")
   call outdon
   return
   end

# elseif --- generate code for end of if before else

   subroutine elseif (lab)
   integer lab

   call outgo (lab+1)
   call outcon (lab)
   return
   end

# end_stc --- output code to finish up a statement count profile

   subroutine end_stc

   include "rf_com.r.i"

   string scall "call c$end"

   if (stc_profile == YES) {
      call outtab
      call outstr (scall)
      call outdon
      }

   return
   end

# enter_subr --- emit trace/timing code as first executable stmt in subroutine

   subroutine enter_subr

   include "rf_com.r.i"

   integer i
   integer equal
   string enter "call t$entr ("
   string trace "call t$trac ("
   string sinit "call t$init"
   string smain "_main_"
   string scinit "call c$init"

   if (time_profile == YES) {
      if (equal (spname, smain) == YES) {
         call outtab
         call outstr (sinit)
         call outdon
         }
      call outtab
      call outstr (enter)
      call outnum (spnum)
      call outch (RPAREN)
      call outdon
      }

   if (program_trace == YES) {
      if (equal (spname, smain) == YES) {
         call outtab
         call outstr (trace)
         call outch (DIG3)
         call outch (COMMA)
         call outch (DIG0)
         call outch (RPAREN)
         call outdon
         }
      call outtab
      call outstr (trace)
      call outch (DIG1)
      call outch (COMMA)
      call outch (SQUOTE)
      call outstr (spname)
      call outch (PERIOD)
      call outch (SQUOTE)
      call outch (RPAREN)
      call outdon
      }

   if (stc_profile == YES)
   andif (equal (spname, smain) == YES) {
      call outtab
      call outstr (scinit)
      call outdon
      }

   return
   end

# exit_subr --- emit trace/timing code before any "return"

   subroutine exit_subr

   include "rf_com.r.i"

   integer i
   string exit "call t$exit"
   string trace "call t$trac (2, 0)"

   if (time_profile == YES) {
      call outtab
      call outstr (exit)
      call outdon
      }
   if (program_trace == YES) {
      call outtab
      call outstr (trace)
      call outdon
      }

   return
   end

# exit_program --- generate "call swt" and optional trace code for "stop"

   subroutine exit_program

   include "rf_com.r.i"

   string swt "call swt"
   string cleanup "call t$clup"
   string trace_exit "call t$trac (2, 0) "

   if (time_profile == YES) {
      call outtab
      call outstr (cleanup)
      call outdon
      }
   if (program_trace == YES) {
      call outtab
      call outstr (trace_exit)
      call outdon
      }
   call outtab
   call outstr (swt)
   call outdon

   return
   end

# fold --- convert alphabetic token to single case

   subroutine fold (token)
   character token (ARB)
   integer i

   # WARNING - This routine depends heavily on the
   # fact that letters have been mapped into internal
   # right-adjusted ascii.  God help you if you
   # have subverted this mechanism.

   for (i = 1; token (i) ~= EOS; i = i + 1)
      if (token (i) >= BIGA && token (i) <= BIGZ)
         token (i) = token (i) - BIGA + LETA
   return
   end

# forcod --- beginning of for statement

   subroutine forcod (lab)
   character gettok
   character t, token (MAXTOK)
   integer length, labgen
   integer i, j, lab, nlpar
   include "rf_com.r.i"
   # include cfor
   # string ifnot "IF (.NOT. ("
   integer ifnot (10)
   data ifnot /BIGI, BIGF, LPAREN, PERIOD, BIGN, BIGO,
               BIGT, PERIOD, LPAREN, EOS/

   lab = labgen (3)
   call outcon (0)
   if (gettok (token, MAXTOK) ~= LPAREN) {
      call synerr ("missing left paren.")
      return
      }
   call eatup   # get possible init clause
   t = gettok (token, MAXTOK)
   if (t == SEMICOL)    # empty condition
      call outcon (lab)
   else {   # non-empty condition
      call outnum (lab)
      call stmt_count
      call outtab
      call outstr (ifnot)
      nlpar = 0
      while (nlpar >= 0) {
         if (t == SEMICOL)
            break
         if (t == LPAREN)
            nlpar = nlpar + 1
         else if (t == RPAREN)
            nlpar = nlpar - 1
         if (t ~= NEWLINE & t ~= UNDERLINE)
            call outstr (token)
         t = gettok (token, MAXTOK)
         }
      call outch (RPAREN)
      call outch (RPAREN)
      call outgo (lab+2)
      if (nlpar < 0)
         call synerr ("invalid for clause.")
      }
   fordep = fordep + 1   # stack reinit clause
   j = 1
   for (i = 1; i < fordep; i = i + 1)   # find end
      j = j + length (forstk (j)) + 1
   forstk (j) = EOS   # null, in case no reinit
   nlpar = 0
   while (nlpar >= 0) {
      t = gettok (token, MAXTOK)
      if (t == LPAREN)
         nlpar = nlpar + 1
      else if (t == RPAREN)
         nlpar = nlpar - 1
      if (nlpar >= 0 & t ~= NEWLINE & t ~= UNDERLINE) {
         call scopy (token, 1, forstk, j)
         j = j + length (token)
         }
      }
   lab = lab + 1   # label for next's
   return
   end

# fors --- process end of for statement

   subroutine fors (lab)
   integer length
   integer i, j, lab
   include "rf_com.r.i"
   # include cfor

   call outnum (lab)
   j = 1
   for (i = 1; i < fordep; i = i + 1)
      j = j + length (forstk (j)) + 1
   if (length (forstk (j)) > 0) {
      call outtab
      call outstr (forstk (j))
      call outdon
      }
   call outgo (lab-1)
   call outcon (lab+1)
   fordep = fordep - 1
   return
   end

# getdef (for no arguments) --- get name and definition

   subroutine getdef (token, toksiz, defn, defsiz)
   character gtok, ngetch
   integer defsiz, i, nlpar, toksiz
   character c, defn (defsiz), token (toksiz), tok (MAXTOK)

   if (gtok (tok, MAXTOK) ~= LPAREN)
      call synerr ("missing left paren.")
   if (gtok (token, toksiz) ~= ALPHA)
      call synerr ("non-alpha name.")
   else if (gtok (tok, MAXTOK) ~= COMMA)
      call synerr ("missing comma in define.")
   # else got (name,

   nlpar = 0
   for (i = 1; nlpar >= 0; i = i + 1)
      if (i > defsiz) {
         call synerr ("definition too long.")
         return
         }
      else if (ngetch (defn (i)) == EOF) {
         call synerr ("missing right paren.")
         return
         }
      else if (defn (i) == LPAREN)
         nlpar = nlpar + 1
      else if (defn (i) == RPAREN)
         nlpar = nlpar - 1
      # else normal character in defn (i)
   defn (i-1) = EOS
   return
   end

# get_spname --- retrieve subprogram name, for use in tracing operation

   subroutine get_spname (token)
   character token (ARB)

   include "rf_com.r.i"

   integer flag
   integer equal

   string subr "subroutine"
   string func "function"
   data flag /NO/

   if (flag == YES) {    # "subroutine" or "function" was last token
      call scopy (token, 1, spname, 1)
      if (time_profile == YES) {
         call putlin (token, dictionary)
         call putch (NEWLINE, dictionary)
         }
      spnum = spnum + 1
      in_declarations = YES
      flag = NO
      }
   else if (equal (token, subr) == YES | equal (token, func) == YES)
      flag = YES         # subprogram name is next...

   return
   end

# gettok --- get token; handles file inclusion
   character function gettok (token, toksiz)

   integer equal, open, index
   integer junk, toksiz, l, fd
   character deftok
   character name (MAXLINE), token (toksiz)

   include "rf_com.r.i"

   string incl "include"

   for ( ; level > 0; level = level - 1) {
      for (gettok = deftok (token, toksiz); gettok ~= EOF;
               gettok = deftok (token, toksiz)) {
         if (equal (token, incl) == NO)
            return
         junk = deftok (name, MAXLINE)
         if (level >= NFILES)
            call synerr ("includes nested too deeply.")
         else {
            if (junk == SQUOTE | junk == DQUOTE) {
               call scopy (name, 2, name, 1)
               l = index (name, junk)
               name (l) = EOS
               }
            fd = open (name, READ)
            if (fd == ERR) {
               call synerr ("can't open include.")
               call print (ERROUT, "file name: *s*n.", name)
               }
            else
               level = level + 1
            linect (level) = 0
            infile (level) = fd
            }
         }
      if (level > 1)
         call close (infile (level))
      }

   gettok = EOF

   return
   end

# gtok --- get token for Ratfor
   character function gtok (lexstr, toksiz)

   character c, lexstr (ARB)
   character ngetch
   integer i, t, toksiz

   include "rf_com.r.i"

   string orifc "orif ("
   string andifc "andif ("

#  repeat c = ngetch (c)
#     until ((c ~= BLANK & c ~= TAB) | c == EOF)

   # following gross loop turns out to be faster than the original 'repeat'
   #  (all due apologies to the reader)
1
      c = ngetch (c)
      i f (c == BLANK) go to 1   # "i f" gets the 'if' past Ratfor
      i f (c == TAB) go to 1     #     (yecch)

   if (c == EOF)
      t = EOF
   else
      t = type (c + 1)
   lexstr (1) = c
   if (t == LETTER) {
      # following loop changed to allow short-circuit conditional
      #    for faster execution:
      #for(i = 1;t==LETTER|t==DIGIT|t==UNDERLINE|t==DOLLAR;i = i + 1) {
      for (i = 1; ; i = i + 1) {
         if (t ~= LETTER && t ~= UNDERLINE && t ~= DIGIT && t ~= DOLLAR)
            break
         if (c == UNDERLINE)
            i = i - 1
         else if (i < toksiz)
            lexstr (i) = c
         if (ngetch (c) == EOF)
            t = EOF
         else
            t = type (c + 1)
         }
      call putbak (c)
      t = ALPHA
      }
   else if (t == DIGIT) {
      for (i = 1; t == DIGIT; i = i + 1) {
         if (i < toksiz)
            lexstr (i) = c
         if (ngetch (c) == EOF)
            t = EOF
         else
            t = type (c + 1)
         }
      call putbak (c)
      t = NUMERIC
      }
   else if (t == SQUOTE | t == DQUOTE) {
      lexstr (1) = t
      for (i = 2; ngetch (lexstr (i)) ~= t; i = i + 1)
         if (i >= toksiz - 1) {
            call synerr ("missing quote.")
            lexstr (i) = t
            call putbak (NEWLINE)
            break
            }
         else if (lexstr (i) == NEWLINE && lexstr (i-1) == UNDERLINE) {
            i = i - 1
            while (ngetch (lexstr (i)) == BLANK)
               ;
            if (lexstr (i) ~= lexstr (1)) {
               call synerr ("contin of literal must begin with quote.")
               lexstr (i) = lexstr (1)
               call putbak (NEWLINE)
               break
               }
            i = i - 1    # do away with the increment
            }
         else if (lexstr (i) == NEWLINE) {
            call synerr ("missing quote.")
            lexstr (i) = lexstr (1)
            call putbak (NEWLINE)
            break
            }
      i = i + 1
      }
   else if (t == SHARP) {   # strip comments
      while (ngetch (c) ~= NEWLINE)
         ;
      t = NEWLINE
      lexstr (1) = NEWLINE
      i = 2
      }
   else if (t == AMPER) {
      if (ngetch (c) == AMPER) {
         t = RPAREN
         call pbstr (andifc)
         lexstr (1) = RPAREN
         i = 2
         }
      else {
         call putbak (c)
         call relate (lexstr, i)
         }
      }
   else if (t == BAR) {
      if (ngetch (c) == BAR) {
         t = RPAREN
         call pbstr (orifc)
         lexstr (1) = RPAREN
         i = 2
         }
      else {
         call putbak (c)
         call relate (lexstr, i)
         }
      }
   else if (t == GREATER | t == LESS | t == NOT | t == EQUALS | t == BANG)
      call relate (lexstr, i)
   else
      i = 2
   lexstr (i) = EOS

   gtok = t

   return
   end

# hashfn --- hash function for mkuniq

   integer function hashfn (token, toksiz)
   character token (ARB)
   integer toksiz
   character ch

   #  make index in range 1-26 from last letter of token

   ch = token (toksiz)
   if (ch >= BIGA & ch <= BIGZ)
      hashfn = ch - BIGA + 1
   else if (ch >= LETA & ch <= LETZ)
      hashfn = ch - LETA + 1
   else    # shouldn't happen
      hashfn = 26

  return
  end




# ifcode --- generate initial code for if

   subroutine ifcode (lab)
   integer labgen
   integer lab

   call stmt_count
   lab = labgen (2)
   call ifgo (lab)
   return
   end

# ifgo --- generate "if (.not. (...))goto lab"

   subroutine ifgo (lab)
   integer lab

   string ifnot "IF(.NOT."

   call outtab         # get to column 7
   call outstr (ifnot)      # " if (.not. "
   call balpar         # collect and output condition
   call outch (RPAREN)      # " ) "
   call outgo (lab)      # " goto lab "
   return
   end

# initdf --- install def's of long FTN keywords

   subroutine initdf (token)
   character token (ARB), work (20)

   call ptoc (token, PERIOD, work, 20)
   call mkdef (work, work)

   return
   end

# initkw --- initialize macro tables and other things

   subroutine initkw
   integer i

   include "rf_com.r.i"

   pointer mktabl

   character c

   string sstop         "stop"
   string ssubroutine   "subroutine"
   string sfunction     "function"
   string sinteger      "integer"
   string sreal         "real"
   string sdouble       "double"
   string scomplex      "complex"
   string slogical      "logical"
   string sdimension    "dimension"
   string sequivalence  "equivalence"
   string scommon       "common"
   string sparameter    "parameter"
   string sexternal     "external"
   string sdata         "data"
   string strace        "trace"
   string sgo           "goto"
   string srtn          "return"
   string sstring       "string"
   string scase         "case"
   string sfor          "for"
   string srept         "repeat"
   string suntil        "until"
   string sdo           "do"
   string sif           "if"
   string selse         "else"
   string swhile        "while"
   string sbreak        "break"
   string snext         "next"
   string sandif        "andif"
   string sorif         "orif"
   string simplicit     "implicit"
   string ssave         "save"

   # dynamic storage space:
   call dsinit (MEMSIZE)

   # output character pointer:
   outp = 0

   # file control:
   level = 1

   # pushback buffer pointer:
   bp = 0

   # depth of for stack:
   fordep = 0

   # string statement stack pointer:
   strtop = 0

   # character type array:
   for (c = MINCHARVAL; c <= MAXCHARVAL; c = c + 1)
      type (c + 1) = c
   for (c = LETA; c <= LETZ; c = c + 1)
      type (c + 1) = LETTER
   for (c = BIGA; c <= BIGZ; c = c + 1)
      type (c + 1) = LETTER
   for (c = DIG0; c <= DIG9; c = c + 1)
      type (c + 1) = DIGIT

   # Ratfor keywords:
   keyword_table = mktabl (1)

   call enter (sif, LEXIF, keyword_table)
   call enter (selse, LEXELSE, keyword_table)
   call enter (swhile, LEXWHILE, keyword_table)
   call enter (sdo, LEXDO, keyword_table)
   call enter (sbreak, LEXBREAK, keyword_table)
   call enter (snext, LEXNEXT, keyword_table)
   call enter (sfor, LEXFOR, keyword_table)
   call enter (srept, LEXREPEAT, keyword_table)
   call enter (sstring, LEXSTRING, keyword_table)
   call enter (scase, LEXCASE, keyword_table)
   call enter (suntil, LEXUNTIL, keyword_table)
   call enter (sorif, LEXORIF, keyword_table)
   call enter (sandif, LEXANDIF, keyword_table)
   call enter (srtn, LEXRETURN, keyword_table)
   call enter (sgo, DISPATCH, keyword_table)
   call enter (sstop, LEXSTOP, keyword_table)
   call enter (sinteger, LEXNONEXECUTABLE, keyword_table)
   call enter (sreal, LEXNONEXECUTABLE, keyword_table)
   call enter (sdouble, LEXNONEXECUTABLE, keyword_table)
   call enter (scomplex, LEXNONEXECUTABLE, keyword_table)
   call enter (slogical, LEXNONEXECUTABLE, keyword_table)
   call enter (sdimension, LEXNONEXECUTABLE, keyword_table)
   call enter (sequivalence, LEXNONEXECUTABLE, keyword_table)
   call enter (scommon, LEXNONEXECUTABLE, keyword_table)
   call enter (sparameter, LEXNONEXECUTABLE, keyword_table)
   call enter (sexternal, LEXNONEXECUTABLE, keyword_table)
   call enter (sdata, LEXNONEXECUTABLE, keyword_table)
   call enter (strace, LEXNONEXECUTABLE, keyword_table)
   call enter (ssubroutine, LEXNONEXECUTABLE, keyword_table)
   call enter (sfunction, LEXNONEXECUTABLE, keyword_table)
   call enter (simplicit, LEXNONEXECUTABLE, keyword_table)
   call enter (ssave, LEXNONEXECUTABLE, keyword_table)

   # symbol table for defines:
   def_table = mktabl (1)

   # unique name table:
   do i = 1, 26
      symtbl (i) = 0
   nextsy = 27
   call initdf ("continue.")     # put
   call initdf ("complex.")      #  long
   call initdf ("precision.")    #   Fortran
   call initdf ("logical.")      #    symbols
   call initdf ("include.")      #     that
   call initdf ("implicit.")     #      should
   call initdf ("parameter.")    #       not
   call initdf ("external.")     #      be
   call initdf ("dimension.")    #     made
   call initdf ("integer.")      #    unique
   call initdf ("equivalence.")  #   into
   call initdf ("function.")     #  symbol
   call initdf ("subroutine.")   # table

# case stack pointers:
   csp = 0
   ctop = 0

   return
   end

# instal --- add name and definition to table

   subroutine instal (name, defn)
   character name (MAXTOK), defn (MAXDEF)

   include "rf_com.r.i"

   integer length

   pointer defn_text
   pointer dsget

   defn_text = dsget (length (defn) + 1)
   call scopy (defn, 1, mem, defn_text)
   call enter (name, defn_text, def_table)

   return
   end

# labelc --- output statement number

   subroutine labelc (lexstr)
   character lexstr (ARB)
   integer length

   if (length (lexstr) == 5)   # warn about 23xxx labels
      if (lexstr (1) == DIG2 & lexstr (2) == DIG3)
         call synerr ("Warning: possible label conflict.")
   call outstr (lexstr)
   call outtab
   return
   end

# labgen --- generate  n  consecutive labels, return first one

   integer function labgen (n)
   integer n
   integer label
   data label /23000/

   labgen = label
   label = label + n
   return
   end

# letdig --- expand character literals LETx, BIGx, and DIGn

   subroutine letdig (token)
   character token (ARB)
   character c
   integer itoc, length
   integer junk

   if (token (5) ~= EOS)
      return
   if (length (token) ~= 4)
      return
   if (token (1) == BIGL && token (2) == BIGE && token (3) == BIGT
     && token (4) >= BIGA && token (4) <= BIGZ)
      c = LETA - BIGA + token (4)    # depends upon ASCII characteristics
   else if (token (1) == BIGB && token (2) == BIGI && token (3) == BIGG
     && token (4) >= BIGA && token (4) <= BIGZ)
      c = token (4)
   else if (token (1) == BIGD && token (2) == BIGI && token (3) == BIGG
     && token (4) >= DIG0 && token (4) <= DIG9)
      c = token (4)
   else
      return
   junk = itoc (c, token, MAXTOK)
   return
   end

# lex --- return lexical type of token

   integer function lex (lexstr)
   character lexstr (MAXTOK)

   include "rf_com.r.i"

   character gettok

   integer equal, lookup

   repeat lex = gettok (lexstr, MAXTOK)
      until (lex ~= NEWLINE)

   if (lex == EOF | lex == SEMICOL | lex == LBRACE | lex == RBRACE)
      return
   if (lex == NUMERIC)
      lex = LEXDIGITS
   else if (lookup (lexstr, lex, keyword_table) == NO)
      lex = LEXOTHER
   return
   end


# mkdef --- put definition and substitution in table

   subroutine mkdef (token, newtok)
   character token (ARB), newtok (ARB)
   integer hashfn, hash, def, i, lasti
   include "rf_com.r.i"

   if (nextsy + MAXTOK * 2 + 4 > MAXSYM) {
      call synerr ("unique table overflow.")
      return
      }
   hash = hashfn (newtok, length (newtok))  #  put sub at end of chain
   lasti = hash
   for (i = symtbl (hash); i ~= 0; i = symtbl (i))
      lasti = i

   symtbl (nextsy) = 0     # end of chain
   symtbl (nextsy + 1) = 0   # no substitution
   call scopy (newtok, 1, symtbl, nextsy + 2)
   symtbl (lasti) = nextsy
   def = nextsy
   nextsy = nextsy + 2 + length (newtok) + 1

   hash = hashfn (token, length (token))  #  put def at head of chain

   symtbl (nextsy) = symtbl (hash)   # head of chain
   symtbl (nextsy + 1) = def        # put substitution
   call scopy (token, 1, symtbl, nextsy + 2)
   symtbl (hash) = nextsy
   nextsy = nextsy + 2 + length (token) + 1

   return
   end

# mkseen --- make name unique and enter into symbol table

   subroutine mkseen (token, toksiz)
   character token (ARB)
   integer toksiz
   integer newsiz, seen, bumpch, i
   character newtok (MAXTOK), junkc (MAXTOK)

   #  truncate symbol to MAXIDLENG chars with second char = UFCHAR

   for (i = 1; i <= MAXIDLENG; i = i + 1) {
      if (token (i) == EOS) break
      newtok (i) = token (i)
      }

   newtok (i) = EOS
   newsiz = i - 1

   if (newsiz >= 2)
      newtok (2) = UFCHAR

   while (seen (newtok, newsiz, junkc, ANYWHERE) == YES) {
      for ( i = newsiz; i > 2; i = i - 1)
         if (bumpch (newtok (i)) == YES) {
            for (i = i + 1; i <= newsiz; i = i + 1)
               newtok (i) = LETA
            break
            }
      if (i == 2) {
         call synerr ("can't make name unique.")
         break
         }
      }

   call mkdef (token, newtok)
   call scopy (newtok, 1, token, 1)
   return
   end

# mkuniq --- make an arbitrarily long name into a unique 6 char ftn name


# Mkuniq uses a rather odd symbol table;  it is structured as follows:
# (1)  Positions 1 - 26 are pointers into lists in the table.  Identifiers
#       are placed in the lists based on the results of hashfn.
# (2)  The remaining space in the table is used for identifier items:
#            Position 1  -- pointer to next item in the list
#            Position 2  -- if the identifier appeared in the source text,
#                           this position contains a pointer to the identifier
#                           that was substituted for it (may not be in the
#                           same list); otherwise this position contains zero.
#            Position 3- -- The identifier as an unpacked K & P string,
#                           terminated by an EOS.
#
#  The variable 'nextsy' is used to mark the end of the table.  Since no
#  deletions are made on identifiers, all additions are made at the end.
#
#  Mkuniq first sees if a name is in the table as a definition.  If it is,
#  the substitution is made; otherwise, it is entered in the table along with
#  its 'unique' counterpart.  The 'unique' counterpart is created by taking
#  the first six characters of the token and replacing the second character
#  with UFCHAR (the first is left to preserve implicit typing).  If the
#  'unique' is found in the table as either a definition or substitution,
#  the last character is incremented and the search is retried.
#
   subroutine mkuniq (token)
   character token (ARB)
   integer seen, toksiz

#  Please note:  'toksiz' is created here for use in the 'mkuniq' routines.  It
#                is not the 'toksiz' used in the rest of Ratfor.
   toksiz = length (token)
   if (toksiz > MAXIDLENG | toksiz == MAXIDLENG & token (2) == UFCHAR) {
      if (seen (token, toksiz, token, DEFONLY) == NO)
         call mkseen (token, toksiz)
      }
   return
   end

# ngetch --- get a (possibly pushed back) character

   character function ngetch (c)
   character c, line (MAXLINE)
   integer getlin
   integer i, j
   include "rf_com.r.i"

   if (bp <= 0) {
      bp = getlin (line, infile (level))
      linect (level) = linect (level) + 1
      if (bp == EOF) {
         bp = 1
         buf (1) = EOF
         }
      else {
         j = 1
         for (i = bp; i > 0; i = i - 1) {
            buf (j) = line (i)
            j = j + 1
            }
         }
      }
   c = buf (bp)
   bp = bp - 1
   ngetch = c
   return
   end

# orcode --- generate code for orif

   subroutine orcode (labval, lab)
   integer labval, lab
   integer labgen

   lab = labgen (3)
   call outgo (lab + 2)
   call outnum (labval)
   call stmt_count
   call ifgo (lab)
   return
   end

# otherc --- output ordinary Fortran statement

   subroutine otherc (lexstr)
   character lexstr (ARB)

   call outtab
   call outstr (lexstr)
   call eatup
   return
   end

# outch --- put one character into output buffer

   subroutine outch (c)
   character c
   integer i
   include "rf_com.r.i"

   if (outp >= 72) {   # continuation card
      call outdon
      do i = 1, 5
         outbuf (i) = BLANK
      outbuf (6) = STAR
      outp = 6
      }
   outp = outp + 1
   outbuf (outp) = c
   return
   end

# outcon --- output "n   continue"

   subroutine outcon (n)
   integer n
   string contin "CONTINUE"

   if (n > 0)
      call outnum (n)
   call outtab
   call outstr (contin)
   call outdon
   return
   end

# outdon --- finish off an output line

   subroutine outdon
   include "rf_com.r.i"

   if (outp == 0)
      return
   outbuf (outp+1) = NEWLINE
   outbuf (outp+2) = EOS
   call putlin (outbuf, outfil)
   outp = 0
   return
   end

# outgo --- output "goto  n"

   subroutine outgo (n)
   integer n
   string goto "GOTO"

   call outtab
   call outstr (goto)
   call outnum (n)
   call outdon
   return
   end

# outnum --- output decimal number

   subroutine outnum (n)
   character chars (MAXCHARS)
   integer itoc
   integer i, len, n

   len = itoc (n, chars, MAXCHARS)
   do i = 1, len
      call outch (chars (i))
   return
   end

# output_names --- add translated names as comments to Fortran output

   subroutine output_names

   integer i, j, ptr

   include "rf_com.r.i"

   call outch (BIGC)
   call outdon
   for (i = 1; i <= 27; i = i + 1)
      for (ptr = symtbl (i); ptr ~= 0; ptr = symtbl (ptr))
         if (symtbl (ptr + 1) ~= 0) {
            call outch (BIGC)
            call outtab
            call outstr (symtbl (ptr + 2))
            call outch (BLANK)
            j = symtbl (ptr + 1) + 2
            call outstr (symtbl (j))
            call outdon
            }
   return
   end

# output_pblocks --- output profiling common blocks
   subroutine output_pblocks

   include "rf_com.r.i"

   string s1 "subroutine t$init"
   string s2 "integer*2 sp, numrtn"
   string s3 "integer*4 record (4, "
   string s4 "integer*4 stack (4, "
   string s5 "common /t$prof/ numrtn, record"
   string s6 "common /t$stak/ sp, stack"
   string s7 "numrtn = "
   string s8 "return"
   string s9 "end"

   call outtab; call outstr (s1); call outdon
   call outtab; call outstr (s2); call outdon
   call outtab; call outstr (s3); call outnum (spnum)
      call outch (RPAREN); call outdon
   call outtab; call outstr (s4); call outnum (spnum)
      call outch (RPAREN); call outdon
   call outtab; call outstr (s5); call outdon
   call outtab; call outstr (s6); call outdon
   call outtab; call outstr (s7); call outnum (spnum)
      call outdon
   call outtab; call outstr (s8); call outdon
   call outtab
 call outstr (s9)
 call outdon

   return
   end

# out_stcblocks --- output statement count initializations

   subroutine out_stcblocks

   include "rf_com.r.i"

   string line1 "SUBROUTINE C$INIT"
   string line1_5 "INTEGER LIMIT"
   string line2 "INTEGER*4 COUNT("
   string line3 "COMMON /C$STC/ LIMIT, COUNT"
   string line4 "INTEGER I"
   string line5 "DO 1 I=1,"
   string line6 "   COUNT(I)=0"
   string line6_5 "LIMIT = "
   string line7 "RETURN"
   string line8 "END"

   call outtab; call outstr (line1); call outdon
   call outtab; call outstr (line1_5); call outdon
   call outtab; call outstr (line2)
      call outnum (linect (1))
      call outch (RPAREN)
      call outdon
   call outtab; call outstr (line3); call outdon
   call outtab; call outstr (line4); call outdon
   call outtab; call outstr (line5)
      call outnum (linect (1))
      call outdon
   call outnum (1); call outtab; call outstr (line6); call outdon
   call outtab; call outstr (line6_5); call outnum (linect (1)); call outdon
   call outtab; call outstr (line7); call outdon
   call outtab; call outstr (line8); call outdon

   return
   end


# outstr --- output string

   subroutine outstr (str)
   character c, str (ARB)
   character mapup
   integer i, j

   for (i = 1; str (i) ~= EOS; i = i + 1) {
      c = str (i)
      if (c ~= SQUOTE & c ~= DQUOTE)
         call outch (mapup (c))
      else {
         i = i + 1
         for (j = i; str (j) ~= c; j = j + 1)   # find end
            ;
         call outnum (j-i)
         call outch (BIGH)
         for ( ; i < j; i = i + 1)
            call outch (str (i))
         }
      }
   return
   end

# outtab --- get past column 6

   subroutine outtab
   include "rf_com.r.i"

   while (outp < 6) {
      outp = outp + 1
      outbuf (outp) = BLANK
      }
   return
   end

# parse --- parse Ratfor source program

   subroutine parse
   character lexstr (MAXTOK)
   integer lex
   integer lab, labl, labval (MAXSTACK), lextyp (MAXSTACK), sp, token
   integer labgen, lastok

   include "rf_com.r.i"

   sp = 1
   lextyp (1) = EOF
   lastok = EOS
   token = lex (lexstr)
   while (token ~= EOF) {
      if (token == LEXSTRING)
         call stringc
      else if (token ~= LEXNONEXECUTABLE & in_declarations == YES) {
         call strings
         call enter_subr
         in_declarations = NO
         if (sp > 1) {
            call synerr ("Probable unmatched '(' or '{' in last routine.")
            sp = 1
            }
         }
      if (token ~= LEXORIF & token ~= LEXANDIF) {
         labl = labval (sp)
         for ( ; lextyp (sp) == LEXORIF; sp = sp - 1)
            call outcon (labval (sp) + 2)
         labval (sp) = labl
         }
      if (sp > 1)
      andif (lextyp (sp - 1) == LEXCASE & lextyp (sp) == LBRACE &
            lastok ~= LEXDIGITS)
         call casei (labval (sp - 1) + 1)
      if (token == LEXIF)
         call ifcode (lab)
      else if (token == LEXELSE) {
         if (lextyp (sp) == LEXIF)
            call elseif (labval (sp))
         else if (lextyp (sp) ~= LEXCASE)
            call synerr ("illegal else.")
         }
      else if (token == LEXFOR)
         call forcod (lab)
      else if (token == LEXWHILE)
         call whilec (lab)
      else if (token == LEXDO)
         call docode (lab)
      else if (token == LEXREPEAT)
         call repcod (lab)
      else if (token == LEXANDIF) {
         if (lextyp (sp) == LEXIF | lextyp (sp) == LEXORIF) {
            call andcod (labval (sp))
            token = lex (lexstr)
            next
            }
         else
            call synerr ("illegal andif.")
         }
      else if (token == LEXORIF) {
         if (lextyp (sp) == LEXIF | lextyp (sp) == LEXORIF)
            call orcode (labval (sp), lab)
         else
            call synerr ("illegal orif.")
         }
      else if (token == LEXCASE)
         call casec (lab)
      else if (token == LEXDIGITS)
         call labelc (lexstr)

      if (token == LEXIF || token == LEXELSE || token == LEXFOR
        || token == LEXWHILE || token == LEXDO || token == LEXORIF
        || token == LEXREPEAT || token == LEXCASE || token == LEXDIGITS
        || token == LBRACE) {
         sp = sp + 1         # beginning of statement
         if (sp > MAXSTACK)
            call error ("stack overflow in parser.")
         lextyp (sp) = token      # stack type and value
         labval (sp) = lab
         lastok = token    # remember last token
         token = lex (lexstr)
         }
      else {      # end of statement - prepare to unstack
         if (token == LEXNONEXECUTABLE)
            call otherc (lexstr)
         else if (token == LEXOTHER) {
            call stmt_count
            call otherc (lexstr)
            }
         else if (token == RBRACE) {
            if (lextyp (sp) == LBRACE)
               sp = sp - 1
            else
               call synerr ("illegal right brace.")
            }
         else if (token == LEXRETURN) {
            call exit_subr
            call stmt_count
            call otherc (lexstr)
            call outcon (labgen (1))
            }                         # 9/2/77, for trace/timing
         else if (token == LEXBREAK | token == LEXNEXT)
            call brknxt (sp, lextyp, labval, token)
         else if (token == LEXSTOP) {
            call stmt_count
            call end_stc
            call exit_program
            call otherc (lexstr)
            call outcon (labgen (1))   # dispatch
            }
         else if (token == DISPATCH) {
            call stmt_count
            call otherc (lexstr)
            call outcon (labgen (1))
            }

         lastok = token    # remember last token
         token = lex (lexstr)      # peek at next token
         call unstak (sp, lextyp, labval, token)
         }
      }
   if (sp ~= 1)
      call synerr ("unexpected EOF.")
   return
   end

# pbstr --- push string back onto input

   subroutine pbstr (in)
   character in (ARB)
   integer length
   integer i
   include "rf_com.r.i"

   for (i = length (in); i > 0; i = i - 1) {
      bp = bp + 1
      if (bp > BUFSIZE)
         call error ("too many characters pushed back.")
      buf (bp) = in (i)
      }
   return
   end

# putbak --- push character back onto input

   subroutine putbak (c)
   character c
   include "rf_com.r.i"
   # include cdefio

   bp = bp + 1
   if (bp > BUFSIZE) {
      call synerr ("too many characters pushed back.")
      stop
      }
   buf (bp) = c
   return
   end

# relate --- convert relational shorthands into long form

   subroutine relate (token, eostr)
   character ngetch
   character token (ARB)
   integer length
   integer eostr
   string dotge " .GE. "
   string dotgt " .GT. "
   string dotlt " .LT. "
   string dotle " .LE. "
   string dotne " .NE. "
   string doteq " .EQ. "
   string dotor " .OR. "
   string dotand " .AND. "
   string dotnot " .NOT. "

   if (ngetch (token (2)) ~= EQUALS)
      call putbak (token (2))
   if (token (1) == GREATER) {
      if (token (2) == EQUALS)
         call scopy (dotge, 1, token, 1)
      else
         call scopy (dotgt, 1, token, 1)
      }
   else if (token (1) == LESS) {
      if (token (2) == EQUALS)
         call scopy (dotle, 1, token, 1)
      else
         call scopy (dotlt, 1, token, 1)
      }
   else if (token (1) == NOT | token (1) == BANG) {
      if (token (2) == EQUALS)
         call scopy (dotne, 1, token, 1)
      else
         call scopy (dotnot, 1, token, 1)
      }
   else if (token (1) == EQUALS) {
      if (token (2) == EQUALS)
         call scopy (doteq, 1, token, 1)
      else
         token (2) = EOS
      }
   else if (token (1) == AMPER)
      call scopy (dotand, 1, token, 1)
   else if (token (1) == BAR)
      call scopy (dotor, 1, token, 1)
   else   # can't happen
      token (2) = EOS
   eostr = length (token) + 1
   return
   end

# repcod --- generate code for beginning of repeat

   subroutine repcod (lab)
   integer labgen
   integer lab

   call outcon (0)   # in case there was a label
   lab = labgen (3)
   call outcon (lab)
   call stmt_count
   lab = lab + 1   # label to go on next's
   return
   end

# seen --- look up symbol in hash table and make substitution if found

   integer function seen (token, toksiz, newtok, limit)
   character token (ARB), newtok (ARB)
   integer toksiz, limit
   integer hash, hashfn, equal, i
   include "rf_com.r.i"

   hash = hashfn (token, toksiz)

   for (i = symtbl (hash); i ~= 0; i = symtbl (i))
      if (equal (token, symtbl (i + 2)) == YES
         & (symtbl (i + 1) ~= 0 | limit == ANYWHERE)) {
         seen = YES    #  substitute symbol
         call scopy (symtbl, symtbl (i + 1) + 2, newtok, 1)
         return
         }

   seen = NO
   return
   end


# stmt_count --- output code for statement execution counts

   subroutine stmt_count

   string scall "CALL C$INCR ("

   include "rf_com.r.i"

   if (stc_profile == YES) {
      call outtab
      call outstr (scall)
      call outnum (linect (1))
      call outch (RPAREN)
      call outdon
      }

   return
   end

# stringc --- generate inital code for string

   subroutine stringc

   character str (MAXTOK)
   integer size, junk, length

   include "rf_com.r.i"

   string sinteger "integer"

   if (in_declarations == NO) {
      call synerr ("string declared after executable statement.")
      return
      }
   junk = lex (str)
   if (type (str (1) + 1) ~= LETTER) {
      call synerr ("variable must follow string declaration.")
      return
      }

   call outtab
   call outstr (sinteger)
   call outstr (str)
   call outch (LPAREN)

   size = length (str) + 1
   if (strtop + size + 1 > MAXSTRING) {
      call synerr ("too many string definitions.")
      strtop = 0
      return
      }
   call scopy (str, 1, strbuf, strtop + 1)
   strtop = strtop + size

   junk = lex (str)
   if (str (1) ~= SQUOTE & str (1) ~= DQUOTE) {
      call synerr ("quoted string must follow string decl.")
      strtop = strtop + 1
      strbuf (strtop) = EOS
      return
      }
   size = length (str) - 1 # Don't count quotes, allow for EOS
   call outnum (size)
   call outch (RPAREN)
   call outdon

   if (strtop + size + 1 > MAXSTRING) {
      call synerr ("too many string definitions.")
      strtop = 0
      return
      }
   call scopy (str, 2, strbuf, strtop + 1)
   strtop = strtop + size
   strbuf (strtop) = EOS    # Zap ending quote

   return
   end

# strings --- generate DATA statements for string

   subroutine strings

   integer i, length

   include "rf_com.r.i"

   string sdata "data"

   for (i = 1; i <= strtop; ) {
      call outtab
      call outstr (sdata)
      call outstr (strbuf (i))
      i = i + length (strbuf (i)) + 1
      call outch (SLASH)
      for (; strbuf (i) ~= EOS; i = i + 1) {
         call outnum (strbuf (i))
         call outch (COMMA)
         }
      call outnum (EOS)
      call outch (SLASH)
      call outdon
      i = i + 1
      }

   strtop = 0
   return
   end

# synerr --- report Ratfor syntax error
   subroutine synerr (msg)
   integer msg (ARB)

   integer i
   include "rf_com.r.i"

   for (i = 1; i <= level; i = i + 1)
      call putdec (linect (i), 6, ERROUT)

   call print (ERROUT, " (*s): *p*n.", spname, msg)

   return
   end

# unstak --- unstack at end of statement

   subroutine unstak (sp, lextyp, labval, token)
   integer labval (MAXSTACK), lextyp (MAXSTACK), sp, token

   for ( ; sp > 1; sp = sp - 1) {
      if (lextyp (sp) == LBRACE)
         break
      if (lextyp (sp) == LEXIF & token == LEXELSE)
         break
      if (lextyp (sp) == LEXCASE & token == LEXELSE) {
         call cases (labval (sp))
         break
         }
      if (lextyp (sp) == LEXIF)
         call outcon (labval (sp))
      else if (lextyp (sp) == LEXELSE) {
         if (sp > 2)
            sp = sp - 1
         call outcon (labval (sp)+1)
         }
      else if (lextyp (sp) == LEXDO)
         call dostat (labval (sp))
      else if (lextyp (sp) == LEXWHILE)
         call whiles (labval (sp))
      else if (lextyp (sp) == LEXFOR)
         call fors (labval (sp))
      else if (lextyp (sp) == LEXREPEAT)
         call untils (labval (sp), token)
      else if (lextyp (sp) == LEXCASE) {
         call cases (labval (sp))
         call outcon (labval (sp) + 1)
         }
      }
   return
   end

# untils --- generate code for until or end of repeat

   subroutine untils (lab, token)
   integer lex
   integer lab, token

   call outnum (lab)
   if (token == LEXUNTIL) {
      call stmt_count
      call ifgo (lab-1)
      }
   else
      call outgo (lab-1)
   call outcon (lab+1)
   return
   end

# whilec --- generate code for beginning of while

   subroutine whilec (lab)
   integer labgen
   integer lab

   call outcon (0)    # unlabeled continue, in case there was a label
   lab = labgen (2)
   call outnum (lab)
   call stmt_count
   call ifgo (lab+1)
   return
   end

# whiles --- generate code for end of while

   subroutine whiles (lab)
   integer lab

   call outgo (lab)
   call outcon (lab+1)
   return
   end
