# stacc --- still another compiler-compiler
#           (a recursive descent parser generator)

define(DEBUG,#)

define(COMMONBLOCKS,"stacc_com.r.i")

define(INDENT,call tab_over)
define(STEP_IN,indentation += 1)
define(STEP_OUT,indentation -= 1)

define(INBUFSIZE,200)   # must be > MAXLINE
define(PBLIMIT,95)      # max no. chars pushed back before full line
define(MEMSIZE,4000)    # for symbol tables
define(TABSETTING,3)    # tab width for indentation of output
define(UNKNOWN,4)       # fourth possible value of state variable
                        #  (in addition to NOMATCH, FAILURE, ACCEPT)
define(MAXACTC,5000)    # max characters in actions
define(MAXACT,200)      # max lines of actions
define(MAXERRC,5000)    # max characters in error actions
define(MAXERR,200)      # max lines of error actions

define(RATFOR,1)
define(PASCAL,2)
define(PL1,3)
define(C,4)
define(PLP,5)

define(TERMINAL_DECL,1)
define(COMMON_DECL,2)
define(STATE_DECL,3)
define(SCANNER_DECL,4)
define(SYMBOL_DECL,5)
define(EXTTERM_DECL,6)
define(EPSILON_DECL,7)

include "stacc.stacc.defs"

   integer pstate

   call initialize
   call rdp (pstate)
   call cleanup
   stop
   end



include "stacc.stacc.r"



# actions --- gather up accept and error actions

   subroutine actions (gpst)
   integer gpst

   include COMMONBLOCKS

   num_actions = 0
   num_erractions = 0
   next_act = 1
   next_erract = 1

   repeat
      if (symbol == '!'c) {
         # note use of secret knowledge of 'ngetch's buffer structure:
         call addtext (inbuf (ibp), act_text, next_act, MAXACTC,
            num_actions, MAXACT, act_inx)
         inbuf (ibp) = EOS
         linenumber += 1
         call getsym
         }
      else if (symbol == '?'c) {
         # note use of secret knowledge of 'ngetch's buffer structure:
         call addtext (inbuf (ibp), erract_text, next_erract, MAXERRC,
            num_erractions, MAXERR, erract_inx)
         inbuf (ibp) = EOS
         linenumber += 1
         call getsym
         }
      else
         break

   gpst = ACCEPT
   return
   end



# addtext --- add line of text to store, update index, check for errs

   subroutine addtext (text, store, avail, maxavail, entries, maxent, inx)
   character text (ARB), store (ARB)
   integer avail, maxavail, entries, maxent, inx (ARB)

   integer l, junk
   integer length

   entries += 1
   if (entries > maxent) {
      call errmsg ("too many action/erroraction lines"s, junk)
      call error ("stacc processing terminated"p)
      }
   inx (entries) = avail

   l = length (text)
   if (avail + l + 1 > maxavail) {
      call errmsg ("too much action/erraction text"s, junk)
      call error ("stacc processing terminated"p)
      }

   call scopy (text, 1, store, avail)
   avail += l + 1

   return
   end



# cleanup --- finish up stacc's processing

   subroutine cleanup

   include COMMONBLOCKS

   if (language == PASCAL) {
      call rewind (pfd)
      call fcopy (pfd, STDOUT)
      call rmtemp (pfd)
      }

   return
   end



# decl_common --- fetch name of include file holding Ratfor common blocks

   subroutine decl_common

   include COMMONBLOCKS

   call get_string
   call scopy (symboltext, 1, common_name, 1)
   call getsym

   return
   end



# decl_epsilon --- fetch name of symbol used to represent "empty"

   subroutine decl_epsilon

   include COMMONBLOCKS

   call get_string
   call scopy (symboltext, 1, epsilon_name, 1)
   call getsym

   return
   end



# decl_scanner --- fetch name of lexical analyzer

   subroutine decl_scanner

   include COMMONBLOCKS

   call get_string
   call scopy (symboltext, 1, scanner, 1)
   call getsym

   return
   end



# decl_statevar --- get name of parser state variable

   subroutine decl_statevar

   include COMMONBLOCKS

   call get_string
   call scopy (symboltext, 1, statevar, 1)
   call getsym

   return
   end



# decl_symvar --- fetch name of "current symbol" variable

   subroutine decl_symvar

   include COMMONBLOCKS

   call get_string
   call scopy (symboltext, 1, symbolvar, 1)
   call getsym

   return
   end



# decl_tail --- handle tail end (after the dot) of a declaration

   subroutine decl_tail (gpst)
   integer gpst

   include COMMONBLOCKS

   integer i
   integer strlsr

   string_table decpos, dectab _
      /  TERMINAL_DECL, "terminal" _
      /  COMMON_DECL, "common" _
      /  STATE_DECL, "state" _
      /  SCANNER_DECL, "scanner" _
      /  SYMBOL_DECL, "symbol" _
      /  EXTTERM_DECL, "ext_term" _
      /  EPSILON_DECL, "epsilon"

   i = strlsr (decpos, dectab, 1, symboltext)
   if (i == EOF)
      call errmsg ("illegal declarator"s, gpst)
   else
      select (dectab (decpos (i)))
         when (TERMINAL_DECL) {
            call getsym
            call termlist (gpst)          # declare terminal symbols
            }
         when (COMMON_DECL)
            call decl_common              # declare Ratfor common blocks
         when (STATE_DECL)
            call decl_statevar            # declare parse state variable
         when (SCANNER_DECL)
            call decl_scanner             # declare scanner routine
         when (SYMBOL_DECL)
            call decl_symvar              # declare "current symbol" var
         when (EXTTERM_DECL) {
            call getsym
            call extlist (gpst)           # acknowledge external terminals
            }
         when (EPSILON_DECL)              # declare "empty" symbol
            call decl_epsilon

   gpst = ACCEPT
   return
   end



# emit_statedefs --- emit defines for parser states

   subroutine emit_statedefs

   include COMMONBLOCKS

   select (language)

      when (RATFOR, PL1, PASCAL, C, PLP) {
         call o_defn ("NOMATCH"s, 1)
         call o_defn ("FAILURE"s, 2)
         call o_defn ("ACCEPT"s, 3)
         }

   return
   end



# errmsg --- print error message, attempt to recover parse

   subroutine errmsg (msg, svar)
   character msg (ARB)
   integer svar

   include COMMONBLOCKS

   call print (ERROUT, "*i:  *s*n"s, linenumber, msg)

   repeat {    # skip symbols up to a convenient stopping point
      if (symbol == ';'c || symbol == ')'c || symbol == ']'c
        || symbol == '}'c || symbol == EOF)
         break
      if (symbol == '!'c || symbol == '?'c) {
         # secret knowledge of 'ngetch's input buffer:
         inbuf (ibp) = EOS
         }
      call getsym
      }

   svar = ACCEPT

   return
   end



# get_string --- get (possibly quoted) character string from input

   subroutine get_string

   include COMMONBLOCKS

   character c, quote
   character ngetch

   integer i, junk

   repeat {
      c = ngetch (c)
      if (c == NEWLINE)
         linenumber += 1
      } until (c ~= ' 'c && c ~= TAB && c ~= NEWLINE)

   if (IS_LETTER (c) || c == '_'c) {
      call putback (c)
      call scan_id
      }
   else if (c == "'"c || c == '"'c) {
      quote = c
      i = 0
      repeat {
         i += 1
         symboltext (i) = ngetch (c)
         } until (c == quote || c == EOF || i >= MAXLINE)
      if (c == EOF)
         call errmsg ("missing quote or string too long"s, junk)
      symboltext (i) = EOS
      }
   else
      call errmsg ("identifier or string expected"s, junk)

   return
   end



# getsym --- get next symbol from input stream

   subroutine getsym

   include COMMONBLOCKS

   character c
   character ngetch

   integer junk
   integer lookup, equal

   repeat {                # until a symbol is found
      repeat {
         c = ngetch (c)
         if (c == NEWLINE)
            linenumber += 1
         } until (c ~= ' 'c && c ~= TAB && c ~= NEWLINE)

      select (c)
         when ('.'c, '='c, ';'c, '|'c, ':'c, '$'c, '('c, ')'c,
          '['c, ']'c, '{'c, '}'c, '!'c, '?'c, EOF)
            symbol = c
         when (SET_OF_LETTERS) {
            call putback (c)
            call scan_id
            if (equal (symboltext, epsilon_name) == YES)
               symbol = EPSILONSYM
            else if (lookup (symboltext, junk, term_table) == YES)
               symbol = TERMIDSYM
            else
               symbol = NONTERMIDSYM
            }
         when (SET_OF_DIGITS) {
            call putback (c)
            call scan_int
            }
         when ('"'c, "'"c) {
            call putback (c)
            call scan_char
            }
         when ('-'c)
            call scan_is
         when ('#'c) {        # (comment)
            # secret knowledge, used to throw away the input buffer:
            inbuf (ibp) = EOS
            next
            }
      else {
         call print (ERROUT, "*i:  bad symbol*n"s, linenumber)
         next
         }
      return
      }

   end




# get_language --- determine language to be used for actions

   subroutine get_language

   include COMMONBLOCKS

   character arg (MAXLINE)

   integer i
   integer getarg, strlsr

   string_table langpos, langtab _
      /  RATFOR, "ratfor" _
      /  PL1, "pl1" _
      /  PL1, "pl/1" _
      /  PL1, "pl/i" _
      /  PASCAL, "pascal" _
      /  C, "c" _
      /  PLP, "plp"

   if (getarg (1, arg, MAXLINE) == EOF)
      language = RATFOR
   else {
      call mapstr (arg, LOWER)
      i = strlsr (langpos, langtab, 1, arg)
      if (i == EOF) {
         call print (ERROUT, "*s:  unsupported language*n"s, arg)
         stop
         }
      else
         language = langtab (langpos (i))
      }

   return
   end



# initialize --- initialize everything

   subroutine initialize

   include COMMONBLOCKS

   file_des mktemp
   pointer mktabl

   call dsinit (MEMSIZE)

   term_table = mktabl (0)

   num_actions = 0
   num_erractions = 0
   svarval = UNKNOWN
   ibp = PBLIMIT
   inbuf (ibp) = EOS
   next_term_val = 0
   last_term_val = 0
   linenumber = 1
   indentation = 0

   call get_language
   call ctoc ("rdp.com"s, common_name, MAXLINE)
   call ctoc ("getsym"s, scanner, MAXLINE)
   call ctoc ("state"s, statevar, MAXLINE)
   call ctoc ("symbol"s, symbolvar, MAXLINE)
   call ctoc ("epsilon"s, epsilon_name, MAXLINE)

   if (language == PASCAL) {
      pfd = mktemp (READWRITE)
      if (pfd == ERR)
         call error ("can't open Pascal temporary file"p)
      }

   call emit_statedefs

   call getsym
   return
   end



# ngetch --- get a (possibly pushed back) input character

   character function ngetch (c)
   character c

   include COMMONBLOCKS

   integer getlin

   if (inbuf (ibp) == EOS) {
      ibp = PBLIMIT
      if (getlin (inbuf (ibp), STDIN) == EOF) {
         ngetch = EOF
         return
         }
      }

   c = inbuf (ibp)
   ibp += 1

   ngetch = c

   return
   end



# o_accept_actions --- output accept actions, properly indented

   subroutine o_accept_actions

   include COMMONBLOCKS

   integer l, i
   file_des fd

   fd = STDOUT
   if (language == PASCAL)
      fd = pfd

   for (l = 1; l <= num_actions; l += 1) {
      INDENT
      i = act_inx (l)
      if (act_text (i) == ' 'c)
         call putlin (act_text (i + 1), fd)
      else
         call putlin (act_text (i), fd)
      }

   return
   end



# o_alt --- output code to check one of several alternatives

   subroutine o_alt

   include COMMONBLOCKS

   select (language)

      when (RATFOR, C) {
         INDENT
         call print (STDOUT, "if (*s == NOMATCH) {*n"s, statevar)
         svarval = NOMATCH
         STEP_IN
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "if (*s = NOMATCH) then do;*n"s, statevar)
         svarval = NOMATCH
         STEP_IN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "if (*s = NOMATCH) then begin*n"s, statevar)
         svarval = NOMATCH
         STEP_IN
         }

   return
   end



# o_begin_rept --- begin repeated rhs

   subroutine o_begin_rept

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT
         call print (STDOUT, "repeat {*n"s)
         STEP_IN
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "do while (*s = ACCEPT);*n"s, statevar)
         STEP_IN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "repeat*n"s)
         STEP_IN
         }

      when (C) {
         INDENT
         call print (STDOUT, "do {*n"s)
         STEP_IN
         }

   return
   end



# o_begin_routine --- output subroutine header information

   subroutine o_begin_routine (name)
   character name (ARB)

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         call print (STDOUT, "*n*n*nsubroutine *s (gpst)*n"s, name)
         call print (STDOUT, "integer gpst*n"s)
         call print (STDOUT, "include '*s'*n"s, common_name)
         call print (STDOUT, "integer *s*n"s, statevar)
         call o_error_actions
         call o_accept_actions
         svarval = UNKNOWN
         }

      when (PL1) {
         call print (STDOUT, "*n*n*n*s : procedure (gpst) recursive;*n"s, name)
         STEP_IN
         INDENT; call print (STDOUT, "declare gpst fixed binary;*n*n"s)
         INDENT; call print (STDOUT, "declare *s fixed binary;*n"s, statevar)
         call o_error_actions
         call o_accept_actions
         svarval = UNKNOWN
         }

      when (PASCAL) {
         call print (STDOUT, "procedure *s (var gpst : integer); forward;*n"s,
               name)
         call print (pfd, "*n*n*nprocedure *s;*n"s, name)
         call print (pfd, "*nlabel 99;*n"s)
         call o_error_actions
         call print (pfd, "*nvar *s : integer;*n"s, statevar)
         STEP_IN
         call o_accept_actions
         STEP_OUT
         call print (pfd, "*nbegin*n"s)
         STEP_IN
         svarval = UNKNOWN
         }

      when (C) {
         call print (STDOUT, "*n*n*n*s (gpst)*n"s, name)
         call print (STDOUT, "int **gpst;*n"s)
         call print (STDOUT, "{*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "extern int *s;*n"s, symbolvar)
         INDENT; call print (STDOUT, "int *s();*n"s, scanner)
         INDENT; call print (STDOUT, "int *s;*n"s, statevar)
         call o_error_actions
         call o_accept_actions
         svarval = UNKNOWN
         }

      when (PLP) {
         call print (STDOUT, "*n*n*n*s : procedure (gpst);*n"s, name)
         STEP_IN
         INDENT; call print (STDOUT, "declare gpst fixed binary;*n*n"s)
         INDENT; call print (STDOUT, "declare *s fixed binary;*n"s, statevar)
         call o_error_actions
         call o_accept_actions
         svarval = UNKNOWN
         }

   return
   end



# o_begin_seq --- output first test in a sequence of elements

   subroutine o_begin_seq

   include COMMONBLOCKS

   select (language)

      when (RATFOR, C) {
         INDENT
         call print (STDOUT, "if (*s == ACCEPT) {*n"s, statevar)
         svarval = ACCEPT
         STEP_IN
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "if (*s = ACCEPT) then do;*n"s, statevar)
         svarval = ACCEPT
         STEP_IN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "if (*s = ACCEPT) then begin*n"s, statevar)
         svarval = ACCEPT
         STEP_IN
         }

   return
   end



# o_call_nonterm ---- call nonterminal parsing routine

   subroutine o_call_nonterm (name)
   character name (ARB)

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT
         call print (STDOUT, "call *s (*s)*n"s, name, statevar)
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "call *s (*s);*n"s, name, statevar)
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "*s (*s);*n"s, name, statevar)
         svarval = UNKNOWN
         }

      when (C) {
         INDENT
         call print (STDOUT, "*s (&*s);*n"s, name, statevar)
         svarval = UNKNOWN
         }

   return
   end


# o_choice_actions --- cleanup and action code after a "quick select" choice

   subroutine o_choice_actions

   include COMMON_BLOCKS

   call o_accept_actions

   if (advance == YES) {
      select (language)

         when (RATFOR) {
            INDENT; call print (STDOUT, "call *s*n"s, scanner)
            }

         when (PL1, PLP) {
            INDENT; call print (STDOUT, "call *s;*n"s, scanner)
            }

         when (PASCAL) {
            INDENT; call print (pfd, "*s*n"s, scanner)
            }

         when (C) {
            INDENT; call print (STDOUT, "*s ();*n"s, scanner)
            }

      }

   if (num_erractions > 0)
      call print (ERROUT, "*i:  error actions illegal here*n"s,
         linenumber)

   return
   end



# o_choice_end --- output cleanup code after a "quick select" choice

   subroutine o_choice_end

   include COMMON_BLOCKS

   select (language)

      when (RATFOR) {
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT; call print (pfd, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         INDENT; call print (STDOUT, "break;*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end



# o_choice_start --- output header for beginning of "quick select" choice

   subroutine o_choice_start (val)
   character val (ARB)

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT; call print (STDOUT, "when (*s) {*n"s, val)
         STEP_IN
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT*n"s, statevar)
            }
         svarval = ACCEPT
         }

      when (PL1) {
         INDENT; call print (STDOUT, "else if (*s = *s) then do;*n"s,
                        symbolvar, val)
         STEP_IN
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
            }
         svarval = ACCEPT
         }

      when (PASCAL) {
         INDENT; call print (pfd, "*s: begin*n"s, val)
         STEP_IN
         if (svarval ~= ACCEPT) {
            INDENT; call print (pfd, "*s := ACCEPT;*n"s, statevar)
            }
         svarval = ACCEPT
         }

      when (C) {
         INDENT; call print (STDOUT, "case *s: {*n"s, val)
         STEP_IN
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
            }
         svarval = ACCEPT
         }

      when (PLP) {
         INDENT; call print (STDOUT, "when (*s) do;*n"s, val)
         STEP_IN
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
            }
         svarval = ACCEPT
         }

   return
   end



# o_defn --- output definition for a terminal symbol

   subroutine o_defn (sym, val)
   character sym (ARB)
   integer val

   include COMMONBLOCKS

   select (language)

      when (RATFOR)
         call print (STDOUT2, "define(*s,*i)*n"s, sym, val)

      when (PL1, PLP)
         call print (STDOUT2, "%replace *s by *i;*n"s, sym, val)

      when (PASCAL)
         call print (STDOUT2, "*s = *i;*n"s, sym, val)

      when (C)
         call print (STDOUT2, "#define *s *i*n"s, sym, val)

   return
   end



# o_endalt --- close the test for one of many alternatives

   subroutine o_endalt

   include COMMONBLOCKS

   select (language)

      when (RATFOR, C) {
         INDENT
         call print (STDOUT, "}*n"s)
         svarval = UNKNOWN
         STEP_OUT
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "end;*n"s)
         svarval = UNKNOWN
         STEP_OUT
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "end;*n"s)
         svarval = UNKNOWN
         STEP_OUT
         }

   return
   end



# o_end_nonterm --- perform actions after nonterminal symbol

   subroutine o_end_nonterm

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT; call print (STDOUT, "select (*s)*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "when (FAILURE) {*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "gpst = FAILURE*n"s)
         INDENT; call print (STDOUT, "return*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         if (num_erractions > 0) {
            INDENT; call print (STDOUT, "when (NOMATCH) {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "when (ACCEPT) {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1) {
         INDENT; call print (STDOUT, "if (*s = FAILURE) then do;*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "gpst = FAILURE;*n"s)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         if (num_erractions > 0) {
            INDENT; call print (STDOUT, "else if (*s = NOMATCH) then do;*n"s,statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "else if (*s = ACCEPT) then do;*n"s,statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT; call print (pfd, "case *s of*n"s, statevar)
         STEP_IN
         INDENT; call print (pfd, "FAILURE: begin*n"s)
         STEP_IN
         INDENT; call print (pfd, "gpst := FAILURE;*n"s)
         INDENT; call print (pfd, "goto 99*n"s)
         INDENT; call print (pfd, "end;*n"s)
         STEP_OUT
         if (num_erractions > 0) {
            INDENT; call print (pfd, "NOMATCH: begin*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            }
         if (num_actions > 0) {
            INDENT; call print (pfd, "ACCEPT: begin*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            }
         INDENT; call print (pfd, "otherwise end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         INDENT; call print (STDOUT, "switch (*s) {*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "case FAILURE: {*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "**gpst = FAILURE;*n"s)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         if (num_erractions > 0) {
            INDENT; call print (STDOUT, "case NOMATCH: {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "break;*n"s)
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "case ACCEPT: {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "break;*n"s)
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PLP) {
         INDENT; call print (STDOUT, "select (*s);*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "when (FAILURE) do;*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "gpst = FAILURE;*n"s)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         if (num_erractions > 0) {
            INDENT; call print (STDOUT, "when (NOMATCH) do;*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "when (ACCEPT) do;*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end



# o_end_opt --- actions at end of optional rhs

   subroutine o_end_opt

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT; call print (STDOUT, "select (*s)*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "when (NOMATCH)"s)
         if (num_erractions > 0)
            call print (STDOUT, " {*n"s)
         else
            call print (STDOUT, "*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT*n"s, statevar)
         if (num_erractions > 0) {
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            }
         STEP_OUT
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "when (ACCEPT) {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1) {
         INDENT; call print (STDOUT, "if (*s = NOMATCH) then"s, statevar)
         if (num_erractions > 0)
            call print (STDOUT, " do;*n"s)
         else
            call print (STDOUT, "*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         if (num_erractions > 0) {
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            }
         STEP_OUT
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "else if (*s = ACCEPT) then do;*n"s,
                           statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT; call print (pfd, "case *s of*n"s, statevar)
         STEP_IN
         INDENT; call print (pfd, "NOMATCH:"s)
         if (num_erractions > 0)
            call print (pfd, " begin*n"s)
         else
            call print (pfd, "*n"s)
         STEP_IN
         INDENT; call print (pfd, "*s := ACCEPT;*n"s, statevar)
         if (num_erractions > 0) {
            call o_error_actions
            INDENT; call print (pfd, "end;*n"s)
            }
         STEP_OUT
         if (num_actions > 0) {
            INDENT; call print (pfd, "ACCEPT: begin*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            }
         INDENT; call print (pfd, "otherwise end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         INDENT; call print (STDOUT, "switch (*s) {*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "case NOMATCH: {*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         if (num_erractions > 0)
            call o_error_actions
         INDENT; call print (STDOUT, "break;*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "case ACCEPT: {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "break;*n"s)
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PLP) {
         INDENT; call print (STDOUT, "select (*s);*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "when (NOMATCH)"s)
         if (num_erractions > 0)
            call print (STDOUT, " do;*n"s)
         else
            call print (STDOUT, "*n"s)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         if (num_erractions > 0) {
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            }
         STEP_OUT
         if (num_actions > 0) {
            INDENT; call print (STDOUT, "when (ACCEPT) do;*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end



# o_end_par --- terminate parenthesized rhs

   subroutine o_end_par

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         if (num_actions > 0 && num_erractions <= 0) {
            INDENT; call print (STDOUT, "if (*s == ACCEPT) {*n"s, statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions > 0) {
            INDENT; call print (STDOUT, "if (*s == NOMATCH) {*n"s, statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions <= 0)
            ;  # do nothing
         else {
            INDENT; call print (STDOUT, "select (*s)*n"s, statevar)
            STEP_IN
            INDENT; call print (STDOUT, "when (NOMATCH) {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "when (ACCEPT) {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (PL1) {
         if (num_actions > 0 && num_erractions <= 0) {
            INDENT
            call print (STDOUT, "if (*s = ACCEPT) then do;*n"s, statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions > 0) {
            INDENT
            call print (STDOUT, "if (*s = NOMATCH) then do;*n"s, statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions <= 0)
            ;  # do nothing
         else {
            INDENT; call print (STDOUT, "if (*s = NOMATCH) then do;*n"s, statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "else if (*s = ACCEPT) then do;*n"s,
                           statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (PASCAL) {
         if (num_actions > 0 && num_erractions <= 0) {
            INDENT
            call print (pfd, "if (*s = ACCEPT) then begin*n"s, statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions > 0) {
            INDENT
            call print (pfd,"if (*s = NOMATCH) then begin*n"s,statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions <= 0)
            ;  # do nothing
         else {
            INDENT; call print (pfd, "case *s of*n"s, statevar)
            STEP_IN
            INDENT; call print (pfd, "NOMATCH: begin*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            INDENT; call print (pfd, "ACCEPT: begin*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (pfd, "end;*n"s)
            STEP_OUT
            INDENT; call print (pfd, "otherwise end;*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (C) {
         if (num_actions > 0 && num_erractions <= 0) {
            INDENT; call print (STDOUT, "if (*s == ACCEPT) {*n"s, statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions > 0) {
            INDENT; call print (STDOUT, "if (*s == NOMATCH) {*n"s, statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions <= 0)
            ;  # do nothing
         else {
            INDENT; call print (STDOUT, "switch (*s) {*n"s, statevar)
            STEP_IN
            INDENT; call print (STDOUT, "case NOMATCH: {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "break;*n"s)
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "case ACCEPT: {*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "break;*n"s)
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "}*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

      when (PLP) {
         if (num_actions > 0 && num_erractions <= 0) {
            INDENT
            call print (STDOUT, "if (*s = ACCEPT) then do;*n"s, statevar)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions > 0) {
            INDENT
            call print (STDOUT, "if (*s = NOMATCH) then do;*n"s, statevar)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         else if (num_actions <= 0 && num_erractions <= 0)
            ;  # do nothing
         else {
            INDENT; call print (STDOUT, "select (*s);*n"s, statevar)
            STEP_IN
            INDENT; call print (STDOUT, "when (NOMATCH) do;*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "when (ACCEPT) do;*n"s)
            STEP_IN
            call o_accept_actions
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            INDENT; call print (STDOUT, "end;*n"s)
            STEP_OUT
            }
         svarval = UNKNOWN
         }

   return
   end



# o_end_rept --- terminate repeated rhs

   subroutine o_end_rept

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT
         call print (STDOUT, "} until (*s ~= ACCEPT)*n"s, statevar)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "until (*s <> ACCEPT);*n"s, statevar)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         INDENT
         call print (STDOUT, "} while (*s == ACCEPT);*n"s, statevar)
         STEP_OUT
         svarval = UNKNOWN
         }

   call o_end_opt
   return
   end



# o_end_routine ---  output cleanup code for a parsing routine

   subroutine o_end_routine

   include COMMONBLOCKS


   select (language)

      when (RATFOR) {
         call print (STDOUT, "gpst = *s*n"s, statevar)
         call print (STDOUT, "return*n"s)
         call print (STDOUT, "end*n"s)
         }

      when (PL1, PLP) {
         INDENT; call print (STDOUT, "gpst = *s;*n"s, statevar)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         }

      when (PASCAL) {
         INDENT; call print (pfd, "gpst := *s;*n"s, statevar)
         INDENT; call print (pfd, "99:*n"s)
         STEP_OUT
         call print (pfd, "end;*n"s)
         }

      when (C) {
         INDENT; call print (STDOUT, "**gpst = *s;*n"s, statevar)
         STEP_OUT
         call print (STDOUT, "}*n"s)
         }

   return
   end



# o_end_seq --- output code to terminate the test for a sequence

   subroutine o_end_seq

   include COMMONBLOCKS

   select (language)

      when (RATFOR, C) {
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT; call print (pfd, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end



# o_end_term --- output cleanup and action code after a terminal

   subroutine o_end_term

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         call o_accept_actions
         if (advance == YES) {
            INDENT; call print (STDOUT, "call *s*n"s, scanner)
            }
         INDENT; call print (STDOUT, "}*n"s)
         if (num_erractions > 0) {
            STEP_OUT
            INDENT; call print (STDOUT, "else {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            }
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         call o_accept_actions
         if (advance == YES) {
            INDENT; call print (STDOUT, "call *s;*n"s, scanner)
            }
         INDENT; call print (STDOUT, "end;*n"s)
         if (num_erractions > 0) {
            STEP_OUT
            INDENT; call print (STDOUT, "else do;*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "end;*n"s)
            }
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PASCAL) {
         call o_accept_actions
         if (advance == YES) {
            INDENT; call print (pfd, "*s*n"s, scanner)
            }
         INDENT; call print (pfd, "end"s)
         if (num_erractions > 0) {
            STEP_OUT
            call print (pfd, "*n"s)
            INDENT; call print (pfd, "else begin*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (pfd, "end;*n"s)
            }
         else
            call print (pfd, ";*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         call o_accept_actions
         if (advance == YES) {
            INDENT; call print (STDOUT, "*s ();*n"s, scanner)
            }
         INDENT; call print (STDOUT, "}*n"s)
         if (num_erractions > 0) {
            STEP_OUT
            INDENT; call print (STDOUT, "else {*n"s)
            STEP_IN
            call o_error_actions
            INDENT; call print (STDOUT, "}*n"s)
            }
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end



# o_epsilon --- output "empty" match

   subroutine o_epsilon

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT*n"s, statevar)
            svarval = ACCEPT
            }
         }

      when (PL1, C, PLP) {
         if (svarval ~= ACCEPT) {
            INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
            svarval = ACCEPT
            }
         }

      when (PASCAL) {
         if (svarval ~= ACCEPT) {
            INDENT; call print (pfd, "*s := ACCEPT;*n"s, statevar)
            svarval = ACCEPT
            }
         }

   return
   end



# o_error_actions --- output error actions, properly indented

   subroutine o_error_actions

   include COMMONBLOCKS

   integer i, l
   file_des fd

   fd = STDOUT
   if (language == PASCAL)
      fd = pfd

   for (l = 1; l <= num_erractions; l += 1) {
      INDENT
      i = erract_inx (l)
      if (erract_text (i) == ' 'c)
         call putlin (erract_text (i + 1), fd)
      else
         call putlin (erract_text (i), fd)
      }

   return
   end



# o_match --- see if current symbol matches a terminal symbol

   subroutine o_match (sym)
   character sym (ARB)

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH*n"s, statevar)
            }
         INDENT; call print (STDOUT, "if (*s == *s) {*n"s, symbolvar, sym)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT*n"s, statevar)
         svarval = ACCEPT
         }

      when (PL1, PLP) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            }
         INDENT
         call print (STDOUT, "if (*s = *s) then do;*n"s, symbolvar, sym)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

      when (PASCAL) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (pfd, "*s := NOMATCH;*n"s, statevar)
            }
         INDENT
         call print (pfd, "if (*s = *s) then begin*n"s, symbolvar, sym)
         STEP_IN
         INDENT; call print (pfd, "*s := ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

      when (C) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            }
         INDENT; call print (STDOUT, "if (*s == *s) {*n"s, symbolvar, sym)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

   return
   end



# o_match_range --- see if current symbol is within a range of terminals

   subroutine o_match_range (from, to)
   character from (ARB), to (ARB)

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH*n"s, statevar)
            }
         INDENT; call print (STDOUT, "if (*s <= *s && *s <= *s) {*n"s,
            from, symbolvar, symbolvar, to)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT*n"s, statevar)
         svarval = ACCEPT
         }

      when (PL1, PLP) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            }
         INDENT; call print (STDOUT, "if ((*s <= *s) & (*s <= *s)) then do;*n"s,
            from, symbolvar, symbolvar, to)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

      when (PASCAL) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (pfd, "*s := NOMATCH;*n"s, statevar)
            }
         INDENT; call print (pfd, "if ((*s <= *s) AND (*s <= *s)) then begin*n"s,
            from, symbolvar, symbolvar, to)
         STEP_IN
         INDENT; call print (pfd, "*s := ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

      when (C) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            }
         INDENT; call print (STDOUT, "if (*s <= *s && *s <= *s) {*n"s,
            from, symbolvar, symbolvar, to)
         STEP_IN
         INDENT; call print (STDOUT, "*s = ACCEPT;*n"s, statevar)
         svarval = ACCEPT
         }

   return
   end



# o_selection_start --- output start of a "quick select" sequence

   subroutine o_selection_start

   include COMMON_BLOCKS

   select (language)

      when (RATFOR) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH*n"s, statevar)
            svarval = NOMATCH
            }
         INDENT; call print (STDOUT, "select (*s)*n"s, symbolvar)
         STEP_IN
         }

      when (PL1) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            svarval = NOMATCH
            }
         INDENT; call print (STDOUT, "if ('0'b) then*n"s)
         STEP_IN
         INDENT; call print (STDOUT, ";*n"s)
         STEP_OUT
         }

      when (PASCAL) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (pfd, "*s := NOMATCH;*n"s, statevar)
            svarval = NOMATCH
            }
         INDENT; call print (pfd, "case *s of*n"s, symbolvar)
         STEP_IN
         }

      when (C) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            svarval = NOMATCH
            }
         INDENT; call print (STDOUT, "switch (*s) {*n"s, symbolvar)
         STEP_IN
         }

      when (PLP) {
         if (svarval ~= NOMATCH) {
            INDENT; call print (STDOUT, "*s = NOMATCH;*n"s, statevar)
            svarval = NOMATCH
            }
         INDENT; call print (STDOUT, "select (*s);*n"s, symbolvar)
         STEP_IN
         }

   return
   end



# o_selection_end --- output end of a "quick select" sequence

   subroutine o_selection_end

   include COMMONBLOCKS

   select (language)

      when (RATFOR)
         STEP_OUT

      when (C) {
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         }

      when (PASCAL) {
         INDENT; call print (pfd, "otherwise end;*n"s)
         STEP_OUT
         }

      when (PLP) {
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         }

   return
   end



# o_test_seq_failure --- output code to check for incomplete sequence

   subroutine o_test_seq_failure

   include COMMONBLOCKS

   select (language)

      when (RATFOR) {
         INDENT
         call print (STDOUT, "if (*s ~= ACCEPT) {*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "gpst = FAILURE*n"s)
         INDENT; call print (STDOUT, "return*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PL1, PLP) {
         INDENT
         call print (STDOUT, "if (*s ^= ACCEPT) then do;*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "gpst = FAILURE;*n"s)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (PASCAL) {
         INDENT
         call print (pfd, "if (*s <> ACCEPT) then begin*n"s, statevar)
         STEP_IN
         INDENT; call print (pfd, "gpst := FAILURE;*n"s)
         INDENT; call print (pfd, "goto 99*n"s)
         INDENT; call print (pfd, "end;*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

      when (C) {
         INDENT
         call print (STDOUT, "if (*s != ACCEPT) {*n"s, statevar)
         STEP_IN
         INDENT; call print (STDOUT, "**gpst = FAILURE;*n"s)
         INDENT; call print (STDOUT, "return;*n"s)
         INDENT; call print (STDOUT, "}*n"s)
         STEP_OUT
         svarval = UNKNOWN
         }

   return
   end


# putback --- push character back onto input

   subroutine putback (c)
   character c

   include COMMONBLOCKS

   ibp -= 1
   if (ibp < 1)
      call print (ERROUT, "*i: too many characters pushed back*n"s,
         linenumber)
   else
      inbuf (ibp) = c

   return
   end



# scan_char --- read a quoted character, convert to integer

   subroutine scan_char

   include COMMONBLOCKS

   character c, quote
   character ngetch

   quote = ngetch (quote)
   c = ngetch (c)

   select (language)

      when (RATFOR) {
         symboltext (1) = "'"c
         symboltext (2) = c
         symboltext (3) = "'"c
         symboltext (4) = 'c'c
         symboltext (5) = EOS
         }

      when (C) {
         symboltext (1) = "'"c
         symboltext (2) = c
         symboltext (3) = "'"c
         symboltext (4) = EOS
         }

      when (PASCAL, PL1, PLP)
         call itoc (c, symboltext, MAXLINE)

   if (ngetch (c) ~= quote)
      call print (ERROUT, "*i:  missing quote*n"s, linenumber)

   symbol = TERMIDSYM
   return
   end



# scan_id --- get next identifier from input stream

   subroutine scan_id

   include COMMONBLOCKS

   character c
   character ngetch

   integer i

   i = 1
   for (c = ngetch (c); IS_LETTER (c) || IS_DIGIT (c) || c == '_'c;
     c = ngetch (c)) {
      symboltext (i) = c
      i += 1
      }
   call putback (c)

   symboltext (i) = EOS
   return
   end



# scan_int --- scan integer present in input stream

   subroutine scan_int

   include COMMONBLOCKS

   character c
   character ngetch

   integer i

   i = 1
   for (c = ngetch (c); IS_DIGIT (c); c = ngetch (c)) {
      symboltext (i) = c
      i += 1
      }
   symboltext (i) = EOS
   call putback (c)

   symbol = INTSYM
   return
   end



# scan_is --- get "->" symbol from input stream

   subroutine scan_is

   include COMMONBLOCKS

   character c
   character ngetch

   if (ngetch (c) ~= '>'c)
      call print (ERROUT, "*i:  -> symbol is ill-formed*n"s, linenumber)
   symbol = ISSYM

   return
   end



# tab_over --- output spaces 'til we reach an appropriate column

   subroutine tab_over

   include COMMONBLOCKS

   integer i
   file_des fd

   character blanks (MAXLINE)
   data blanks /MAXCARD * ' 'c, EOS/

   fd = STDOUT
   if (language == PASCAL)
      fd = pfd

   i = max0 (70, MAXLINE - indentation * TABSETTING)
   call putlin (blanks (i), fd)

   return
   end
