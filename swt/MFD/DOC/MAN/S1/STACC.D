[cc]mc |
.hd stacc "recursive descent parser generator" 08/27/84
stacc  [ Ratfor | C | Pascal | Pl/1 | Plp ]
[cc]mc
.ds
'Stacc' (STill Another Compiler-Compiler) is a simple parser generator
designed to reduce the effort involved in building recursive-descent
parsers.
Its development was motivated by two things:
(1) the large number of ad-hoc recursive descent parsers constantly
being written and re-written at the Georgia Tech installation;
(2) the desire to quickly generate an SSPL compiler in SSPL for
microprocessor software development work.
Its design was inspired both by 'yacc' (Yet Another Compiler-Compiler)
on Unix and the GTL Syntax Parser on the now defunct Georgia Tech
Burroughs B5500.
.sp 2
.bf
Basic Theory
.sp
Given an LL(1) grammar written in an extended BNF,
'stacc' generates a very simple top-down, recursive-descent parser.
Many excellent references are available on the subject of such parsers;
the following will serve as starting points:
.sp
.in +10
.ti -5
Gries, David,
.ul
Compiler Construction for Digital Computers,
John Wiley & Sons, Inc., New York, 1971
.br
(See chapters 3, 4, 12, and 15)
.sp
.ti -5
Aho, Alfred V., and Jeffrey D. Ullman,
.ul
The Theory of Parsing, Translation, and Compiling,
Prentice-Hall, Inc., Englewood Cliffs, NJ, 1972
.br
(See chapters 1, 3, and 5)
.sp
.ti -5
Georgia Institute of Technology School of Information and Computer Science,
.ul
GTL Programmer's Reference Manual for the Burroughs B5500,
1974
.br
(See chapter 8)
.in -10
.sp 2
.bf
Principles of Operation
.sp
'Stacc' generates a "parser," a program which converts a stream of
"tokens" into a representation of a derivation tree which describes
the production of the input stream from a given grammar.
In practice, the derivation tree exists solely in the call structure
of the subprograms called to parse the input, so the user must supply
"action" routines to produce the output he desires.
.sp
A parser written with 'stacc' also requires a "lexical analyzer,"
a routine that converts the input stream of ASCII characters into the
tokens handled by the parser.
.sp
The operation of a 'stacc' parser is roughly as follows.
In the initialization phase, the lexical analyzer is called to pick up
the first token from the stream of input characters.
An integer assigned to the class of token found is then placed in
a "current symbol" variable by the lexical analyzer.
The parser is then called.
The parser attempts to "match" the current symbol against all
possibilities for the first input symbol;
if a match is found, any actions supplied by the user are performed
and the lexical analyzer is called to fetch the next input token.
This procedure is repeated until either the entire input stream
is recognized as a valid sentence in the input language or an
error (a missing or illegal "current symbol") is detected.
In the event of an error, the user must supply recovery actions
so that the parse can proceed.
.sp
The function of 'stacc' is to convert an extended BNF grammar
into code that checks the current input symbol, calls the lexical
analyzer when appropriate, and performs actions specified by the
user after certain constructs in the input stream are recognized,
thus freeing the user from the bookkeeping details needed to
build a parser.
.sp 2
.bf
Usage Information
.sp
'Stacc' takes input (described in detail below) on its first standard
input port and produces output on its first and second standard
outputs.
The first output is the code that implements the parser.
This code is expressed in the language whose name is given as the
first argument on the command line that invoked 'stacc'.
The second output is a set of macro definitions that establishes
mnemonics for the integer "current symbol"
values supplied by the lexical analyzer.
.sp
.nh
Conventionally, 'stacc' input files have the extension ".stacc",
e.g. "hp.stacc," "sspl.stacc," "stacc.stacc".
The first output of 'stacc' (the parser) is normally placed in
a file with extension ".stacc.<language>", e.g. "hp.stacc.r",
"sspl.stacc.s", "stacc.stacc.r".
The second output of 'stacc' (the macro definitions) is normally
placed in a file with extension ".stacc.defs", e.g.
"hp.stacc.defs", "sspl.stacc.defs", "stacc.stacc.defs".
These files may then be "included" in a source file during compilation.
(Note that slightly different naming conventions are used by
the separate compilation handler 'sep').
.hy
.sp 2
.bf
Input Specifications
.sp
Input to 'stacc' consists of a series of "declarations" and
"productions", separated by semicolons.
There may be any number of either, and they may be mixed in any order.
Input is free-form; whitespace may be inserted where desired to improve
readability.
Ratfor-style comments (beginning with a sharp (#), ending with a
NEWLINE) may be used for documentation.
.sp
Declarations consist of a period (.) followed by a keyword and an
argument list whose format depends on the keyword.
There are seven types of declarations.
.sp
Four declarations are used to select the names of critical
objects used by the parser:
".state <variable>" declares the parser state variable (named
"state" by default), ".scanner <routine>" declares the name of
the lexical analyzer subprogram ("getsym" by default),
".symbol <variable>" declares the "current symbol" variable
(named "symbol" by default),
and ".epsilon <symbol>" declares the symbol to be used to match
the null token (empty string of input symbols).
.sp
One declaration is used only by parsers written in Ratfor:
".common '<filename>'" specifies the name of an include file
containing the declarations of the current symbol variable
and any other variables used for communication between the parser
and the lexical analyzer.
.sp
The final two types of declarations are used to list mnemonics for
terminal symbols recognized by the lexical analyzer.
The first consists of ".ext_term" followed by a list of identifiers
used by the lexical analyzer to identify terminal symbols.
This declaration merely informs 'stacc' that the given names
represent terminal symbols; no macro definitions are generated.
The second type consists of ".terminal" followed by a list of mnemonics.
Each mnemonic is assigned an integer value, and output in a macro
definition to make that value available to the lexical analyzer.
A specific value may be assigned to a terminal symbol by preceding
it with an integer; two terminal symbols may be equated by placing
an equals sign (=) between them.
Otherwise, increasing values (starting from zero) are assigned.
For example, the following declaration
.sp
.nf
.in +10
.cc #
.terminal
         ALTSYM
         DECLSYM = NOADVANCESYM
         100 LETTER_D
         LETTER_E
         ;
#cc
.in -10
.fi
.sp
produces the following Ratfor macro definitions:
.nf
.sp
.in +10
define(ALTSYM,0)
define(DECLSYM,1)
define(NOADVANCESYM,1)
define(LETTER_D,100)
define(LETTER_E,101)
.sp
.in -10
.fi
Productions are written in a language similar to the extended
BNF used throughout the Subsystem.
A production consists of a nonterminal symbol, followed by
the "rewrites as" symbol (->), followed by a right-hand-side
with imbedded semantic actions.
.sp
The right-hand-side allows the usual BNF operators: vertical bar
(|) to indicate a choice, parentheses to nest right-hand-sides,
square brackets ([]) to enclose optional constructs, and
curly braces ({}) to enclose repeated constructs.
.sp
Items in the right-hand-side are nonterminal symbols
(those that appear in the left-hand-side of some production),
terminal symbols (those declared by the ".terminal" and ".ext_term"
declarations),
quoted single characters, or two terminal symbols or quoted
characters separated by a colon (:) (which matches any terminal
symbol or character within the given limits).
In addition, a right-hand-side may be preceded by a dollar sign
($), indicating that it represents a particularly common form
of production:  a number of alternatives, each of which is
distinguished by a single leading terminal symbol.
(This happens, for example, in parsing statements in most
algorithmic languages; each different type of statement is
preceded by a unique key word.)
Recognition of this common case allows much faster special-purpose
code to be generated.
.sp
After any terminal, nonterminal, or special construct in the
right-hand-side there may appear semantic actions.
Actions to be performed after a symbol is successfully matched
are preceded by an exclamation point (!); actions to be performed
after a symbol fails to be matched are preceded by a question
mark (?).
Actions extend from their initial character to the end of the
line on which they appear.
Actions appearing after terminal symbols are executed
.ul
after
a symbol is matched and
.ul
before
the lexical analyzer is called; thus, they may perform
some operation based on characteristics of the symbol matched.
If the terminal symbol or range of terminal symbols being matched
is followed by a period (.), the automatic call of the lexical
analyzer is disabled, allowing the user to substitute his own
scanning actions.
.sp
Actions may appear immediately after the "rewrites as" symbol
(->), in which case they are executed before any code generated
by 'stacc',
or immediately after the production-terminating semicolon (;),
in which case they are executed unconditionally before control
leaves the production.
.sp
A sample production:
.sp
.nf
.in +10
parser ->
   {
      (     declaration
         |  production
         )
      ';'      ? call error ("missing semicolon.")
               ! numprods = numprods + 1
      }
   EOF.        ? call error ("EOF expected.")
               ! call analyze
   ;
.fi
.in -10
.sp 2
.bf
Using 'Stacc' With Ratfor
.sp
Ratfor users of 'stacc' should note that they must declare a
common block "include" file with the ".common" declaration,
so that the lexical analyzer can communicate with the parser.
.sp
The form of a 'stacc' output routine in Ratfor is a subroutine
with one integer argument, which exports the parser state upon
return.
The parser state will either be NOMATCH (1) if the first symbol
failed to match any legal alternative, FAILURE (2) if some
symbols matched but some did not (and no error recovery succeeded),
or ACCEPT (3) if the input was a legal sentence in the language
being processed.
The name of the status argument is presently fixed at "gpst";
this variable is reserved for 'stacc' and should not be used
for any other purpose.
.sp
To use a 'stacc'-generated parser, the Ratfor programmer should
simply call the subroutine whose name corresponds to the start
symbol of his grammar, passing one integer variable as an argument.
That variable will contain the parse state upon completion of the
parse.
.sp
If the user specifies a grammar that is recursive, 'stacc' will
produce recursive output;
it will then be necessary to use Virtual-mode Fortran with the
local-variables-allocated-in-stack-frame option.
(This is the default under the Subsystem.)
.es
.fi
The following sample 'stacc' input will generate a program to
convert infix arithmetic expressions to reverse-Polish.
An expression consists of letters, digits, and operators
arranged in the usual manner.
Multiplication and division have priority over addition and
subtraction.
.sp
.nf
.in +5
.cc #
.scanner "getchar";
.symbol "char";
.common "rpn.com";

expression ->
                  ! integer op
   term
   {
      ($    '+'   ! op = '+'c
         |  '-'   ! op = '-'c
         )
      term        ! call putch (op, STDOUT)
      }
   ;

term ->
                  ! integer op
   factor
   {
      ($    '*'   ! op = '*'c
         |  '/'   ! op = '/'c
         )
      factor      ! call putch (op, STDOUT)
      }
   ;

factor ->
      'a':'z'     ! call putch (char, STDOUT)
   |  '0':'9'     ! call putch (char, STDOUT)
   |  '('
         expression
         ')'
   ;
#cc
.fi
.in -5
.sp 2
'Stacc' produced the following Ratfor output:
.sp 2
.nf
.in +5
define(NOMATCH,1)
define(FAILURE,2)
define(ACCEPT,3)



subroutine expression (gpst)
integer gpst
include 'rpn.com'
integer state
integer op
call term (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      select (char)
      when (171) {
         state = ACCEPT
         op = '+'c
         call getchar
         }
      when (173) {
         state = ACCEPT
         op = '-'c
         call getchar
         }
      if (state == ACCEPT) {
         call term (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call putch (op, STDOUT)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine term (gpst)
integer gpst
include 'rpn.com'
integer state
integer op
call factor (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      select (char)
      when (170) {
         state = ACCEPT
         op = '*'c
         call getchar
         }
      when (175) {
         state = ACCEPT
         op = '/'c
         call getchar
         }
      if (state == ACCEPT) {
         call factor (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call putch (op, STDOUT)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine factor (gpst)
integer gpst
include 'rpn.com'
integer state
state = NOMATCH
if (225 <= char && char <= 250) {
   state = ACCEPT
   call putch (char, STDOUT)
   call getchar
   }
if (state == NOMATCH) {
   if (176 <= char && char <= 185) {
      state = ACCEPT
      call putch (char, STDOUT)
      call getchar
      }
   if (state == NOMATCH) {
      if (char == 168) {
         state = ACCEPT
         call getchar
         }
      if (state == ACCEPT) {
         call expression (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (char == 169) {
            state = ACCEPT
            call getchar
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   }
gpst = state
return
end
.sp 2
.fi
.in -5
The following main program and common block include file were
necessary to finish the implementation:
.sp 2
.in +5
.nf
# rpn --- convert to Reverse Polish

   include "rpn.stacc.defs"

   integer state

   include "rpn.com"

   call getchar
   call expression (state)
   call putch (NEWLINE, STDOUT)
   if (state ~= ACCEPT || char ~= NEWLINE)
      call error ("syntax error.")

   stop
   end

# getchar --- get next character from standard input

   subroutine getchar

   include "rpn.com"

   character getch

   char = getch (char, STDIN)

   return
   end

include "rpn.stacc.r"




# common blocks for 'rpn'

   character char
   common /chcom/ char
.fi
.in -5
.me
(Note that all error messages are preceded by the number of
the line in the input stream being processed at the time of the
detection of the error.)
.sp
.nf
-> symbol is ill-formed
   '-' was seen, but '>' was missing
EOF expected
   there is data after the last legal production
actions are illegal here
   actions are not allowed immediately after '$'
bad symbol
   input string could not be lexically analyzed
error actions illegal here
   error actions not allowed after quick-select terminal
identifier or string expected
   missing declaration parameter
illegal declarator
   keyword after '.' was not recognizable
illegal term/nonterm
   expected a terminal or nonterminal; didn't find one
missing '->'
   should be a '->' after the left-hand-side of a production
missing alternative
   missing or illegal alternative after '|'
missing choice
   missing or illegal quick-select alternative after '|'
missing declarator
   missing keyword after '.'
missing optional rhs
   there should be a right-hand-side within square brackets
missing quote
   obvious, hopefully
missing quote or string too long
   strings have a maximum length of about 100 characters
missing repeated rhs
   there should be a right-hand-side within curly braces
missing rhs in parentheses
   there should be a right-hand-side within parentheses
missing right brace
missing right bracket
missing right parenthesis
missing right-hand-side
   missing entire right-hand-side of production
missing semicolon
missing upper bound
   missing second terminal in range of form 'lower:upper'
not yet available
   the language specified cannot be used with 'stacc' yet
production expected
   input stream contained neither declaration nor production
too many action/erroraction lines
   there are too many lines of code to store internally
too many characters pushed back
   internal error --- see your Subsystem manager
too much action/erraction text
   there is too much code to store internally
unsupported language
   'stacc' doesn't recognize the language name specified
.fi
.sp
(Other messages may occasionally arise from the dynamic storage
routines.
If these occur, see your Subsystem manager for assistance.)
.bu
[cc]mc |
.# The only languages currently supported are Ratfor and C,
.# although adding others should be relatively easy.
.# .sp
[cc]mc
'Stacc' does not optimize its Ratfor output as well as it could;
some redundant code shows up occasionally.
.sp
Error recovery in 'stacc' is still somewhat primitive.
.sp
No check is made to see if the input grammar is LL(1).
.sa
rp (1)
