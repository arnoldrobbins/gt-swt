# qmc - perform Quine-McCluskey tabulation

#      by A. Akin 4/18/77 for ICS 4610 assignment #3

   include "/syscom/defi"     # Software Tools definitions
define(DONTCARE,3)
define(DONTCARES,:37777777777)
define(ENDOFLINE,1)
define(MAXIMPL,100)
define(NOTSYM,2)
define(ORSYM,3)
define(VARIABLE,4)
define(WSPSIZE,100)

   call init
   repeat {
      call input           # read data
      call qmc             # perform Quine-McCluskey tabulation
      call smplfy          # simplify prime implicants
      call output          # output prime implicants
      }

   end



# input - input data for Quine-McCluskey tabulation
   subroutine input

   include qmccom

   character arg (2)
   integer getarg, getvar, getexp

   pflag = YES
   if (getarg (1, arg, 2) ~= EOF)
      andif (arg (1) == MINUS)
         pflag = NO

   if (pflag == YES)
      call instru         # print instructions

   repeat {
      force = YES
      call prompt ("Variables: .")
      } until (getvar (0) ~= ERR)      # get list of variables

   repeat {
      force = YES
      call prompt ("Expression: .")
      } until (getexp (0) ~= ERR)      # get expression to be reduced

   return
   end





# getvar - get list of variables to be used in expression
   integer function getvar (dummy)
   integer dummy

   include qmccom

   character line (MAXLINE)
   integer i, j
   integer getlin, length, type, index

   getvar = ERR
   numvar = 0
   vars (1) = EOS

   if (getlin (line, STDIN) == EOF)
      call swt                        # exit if EOF encountered
   i = length (line)
   line (i) = EOS
   i = i - 1
   if (i == 0)
      call swt                        # exit if null line entered

   for (j = 1; j <= i; j = j + 1) {
      if (type (line (j)) ~= LETTER)
         next                         # ignore non-alpha characters
      if (index (vars, line (j)) ~= 0) {
         call remark ("duplicate variable:.")
         call putch (line (j), ERROUT)
         call putch (NEWLINE, ERROUT)
         return
         }
      if (numvar >= 15) {
         call remark ("number of variables must be <= 15.")
         return
         }
      numvar = numvar + 1
      vars (numvar) = line (j)
      vars (numvar + 1) = EOS
      }

   if (numvar == 0) {
      call remark ("no variables detected.")
      return
      }

   getvar = OK
   return
   end




# getexp - get boolean expression for Quine-McCluskey tabulation
   integer function getexp (dummy)
   integer dummy

   include qmccom

   integer * 4 term
   integer geterm

   curlis = 0                # top of current terms list
   lisend = 1                # end of new list - where items are added
   getexp = ERR
   call getsym

   repeat {
      if (geterm (term) == ERR)
         return
      call enter (term)
      if (symbol ~= ORSYM)
         if (symbol == ENDOFLINE)
            break                         # end of expression
         else {
            call remark ("unrecognized symbol.")
            return
            }
      call getsym
      }

   curlis = 1               # start of current list
   newlis = lisend          # start of next list
   getexp = OK
   return
   end





# geterm - get a term of a boolean expression, for qmc
   integer function geterm (term)
   integer * 4 term

   include qmccom

   integer var, negate
   integer addfac, getvp

   geterm = ERR
   term = DONTCARES
   while (symbol == VARIABLE) {
      if (getvp (var, negate) == ERR)
         break
      if (addfac (var, negate, term) == ERR)
         return
      }
   if (term ~= DONTCARES)
      geterm = OK
   else
      call remark ("missing or illegal term.")

   return
   end





# getvp - get a variable, optionally followed by a negation symbol (')
   integer function getvp (var, negate)
   integer var, negate

   include qmccom

   integer index

   getvp = ERR
   if (symbol ~= VARIABLE)
      return
   var = index (vars, inchar)
   if (var == 0)
      return
   call getsym
   if (symbol == NOTSYM) {
      negate = YES
      call getsym
      }
   else
      negate = NO

   getvp = OK
   return
   end





# addfac - add a factor into a term
   integer function addfac (var, negate, term)
   integer var, negate
   integer * 4 term

   include qmccom

   integer * 4 yn
   integer * 4 and, rs, ls, not, or

   addfac = ERR
   if (and (rs (term, 2 * (var - 1)), 3) ~= DONTCARE) {
      call remark ("same variable appears twice in a term.")
      return
      }
   if (negate == YES)
      yn = 0
   else
      yn = 1

   term = or( ls(yn, 2 *(var - 1)), and(term, not(ls(intl(3), 2*(var-1)))))
   addfac = OK

   return
   end





# getsym - get next symbol in input stream
   subroutine getsym

   include qmccom

   integer ptr
   character buf (MAXLINE)
   integer getlin
   data ptr /MAXLINE/

   if (force == YES | ptr >= MAXLINE) {
      if (getlin (buf, STDIN) == EOF)
         call swt
      force = NO
      ptr = 1
      }
10 while (buf (ptr) == BLANK | buf (ptr) == TAB)
      ptr = ptr + 1

   if (buf (ptr) == NEWLINE)
      symbol = ENDOFLINE
   else if (buf (ptr) == SQUOTE)
      symbol = NOTSYM
   else if (buf (ptr) == PLUS)
      symbol = ORSYM
   else if (buf (ptr) == AMPER) {
      if (getlin (buf, STDIN) == EOF)
         call swt
      ptr = 1
      goto 10
20   continue                       # to fake off fortran
      }
   else {                           # variable, by default
      inchar = buf (ptr)
      symbol = VARIABLE
      }
   ptr = ptr + 1

   return
   end





# qmc - perform Quine-McCluskey tabulation on table worksp
   subroutine qmc

   include qmccom

   integer change, i, j
   integer * 4 newtrm
   integer onedif, deld, next

   nimpl = 0

   repeat {
      change = NO
      for (i = curlis; i ~= newlis; i = next (i))
         for (j = i; j ~= newlis; j = next (j)) {
            if (deld (worksp (j)) == YES)
               next
            if (onedif (worksp (i), worksp (j)) == YES) {
               call combin (worksp (i), worksp (j), newtrm)
               call enter (newtrm)
               change = YES
               call delete (worksp (i))
               call delete (worksp (j))
               break
               }
            }
      for (i = curlis; i ~= newlis; i = next (i))
         if (deld (worksp (i)) == NO) {
            call remem (worksp (i))
            call delete (worksp (i))
            }
      if (change == NO)
         break
      curlis = newlis
      newlis = lisend
      }

   return
   end





# deld - is an element deleted?
   integer function deld (elem)
   integer * 4 elem

   integer * 4 and

   if (and (elem, intl (3)) == intl (2))
      deld = YES
   else
      deld = NO

   return
   end





# delete - flag an element as deleted
   subroutine delete (elem)
   integer * 4 elem

   elem = 2

   return
   end





# onedif - do two elements differ in only one variable position?
   integer function onedif (elt1, elt2)
   integer * 4 elt1, elt2

   integer i
   integer * 4 mask, res
   integer * 4 xor, ls

   mask = 1
   res = xor (elt1, elt2)
   onedif = YES

   for (i = 1; i <= 15; i = i + 1) {
      if (mask == res)
         return
      mask = ls (mask, 2)              # shift mask left two places
      }

   onedif = NO
   return
   end





# combin - combine two elements to form a third with a "don't care" position
   subroutine combin (elt1, elt2, newelt)
   integer * 4 elt1, elt2, newelt

   integer * 4 mask
   integer * 4 xor, or, ls

   mask = xor (elt1, elt2)             # find the bit that differs
   mask = or (mask, ls (mask, 1))      # make a "don't care" mask
   newelt = or (mask, elt1)

   return
   end





# remem - remember prime implicants for later output
   subroutine remem (impl)
   integer * 4 impl

   include qmccom

   if (nimpl >= MAXIMPL)
      call error ("too many prime implicants generated.")
   nimpl = nimpl + 1
   implis (nimpl) = impl

   return
   end





# next - determine the next position in array worksp
   integer function next (pos)
   integer pos

   integer mod

   n e x t = mod (pos + 1, WSPSIZE) + 1

   return
   end





# prompt - print a prompting string if in verbose mode (pflag == YES)
   subroutine prompt (str)
   character str (ARB)

   include qmccom

   if (pflag == YES)
      call putlit (str, PERIOD, ERROUT)

   return
   end




# enter - enter a term into table worksp
   subroutine enter (term)
   integer * 4 term

   include qmccom

   integer next

   if (lisend == curlis)
      call error ("too many temporaries generated in workspace.")

   worksp (lisend) = term
   lisend = next (lisend)

   return
   end





# smplfy - simplify generated prime implicants
   subroutine smplfy

   # do nothing, for the present

   return
   end




# instru - print instructions
   subroutine instru

   integer done
   data done /NO/

   if (done == YES)
      return
   done = YES
   call remark ("Quine-McCluskey tabulation program.")
   call remark ("The response to a request for variables should be.")
   call remark ("a string of alphabetic characters which will be .")
   call remark ("used in your boolean expression; non-alpha characters.")
   call remark ("in this list will be ignored.")
   call remark ("Examples:  xyz.")
   call remark ("           a,b,c,d.")
   call remark (" .")
   call remark ("The response to a request for an expression should be.")
   call remark ("a boolean expression in the variables you listed,.")
   call remark ("in the form of a sum of products.")
   call remark ("The postfix prime (') may be used to negate a variable.")
   call remark ("The operator 'and' is designated by juxtaposition of.")
   call remark ("variables, eg 'x and not y' is entered as xy'.")
   call remark ("The operator 'or' is designated by the plus sign (+);.")
   call remark ("for example 'x or y' is entered as   x + y.")
   call remark ("Examples:  xy + xy'.")
   call remark ("           abc + abc' + ab'c + ab'c' + d.")
   call remark ("Blanks are not significant in expressions; if an expression.")
   call remark ("is too long to fit on a line, terminate each line but the .")
   call remark ("last with an ampersand (&) and more input will be requested.")
   call remark (" .")
   call remark ("To terminate this program, enter a blank line in response.")
   call remark ("to the 'variables' request, or generate EOF by typing.")
   call remark ("control-c in the first position of a line.")
   call remark (" .")
   call remark ("Instructions and prompts will be inhibited if this program.")
   call remark ("is called with a dash (-) as its first argument, eg .")
   call remark ("     qmc -.")
   call remark (" .")

   return
   end





# output - print prime implicants in table implis
   subroutine output

   include qmccom

   integer i, j
   integer * 4 pos
   integer * 4 and, rs

   if (pflag == YES) {
      call putlit ("Prime implicants:.", PERIOD, STDOUT)
      call putch (NEWLINE, STDOUT)
      }
   for (i = 1; i <= nimpl; i = i + 1)  {
      for (j = 1; j <= 15; j = j + 1) {
         pos = and (rs (implis (i), 2 * (j - 1)), intl (3))
         if (pos == intl (0)) {
            call putch (vars (j), STDOUT)
            call putch (SQUOTE, STDOUT)
            }
         else if (pos == intl (1))
            call putch (vars (j), STDOUT)
         }
      call putch (NEWLINE, STDOUT)
      }

   return
   end
