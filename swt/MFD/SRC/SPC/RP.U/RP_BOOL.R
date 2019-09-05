# simple_bool_expr --- pass through simple conditions

   subroutine simple_bool_expr (state)
   integer state

   include "rp_com.i"

   pointer head, tail
   pointer make_tree_node

   head = 0
   tail = 0

   call collect_balanced_string (head, tail)

   call expr_stack_push (make_tree_node (0, 0, IDSYM, head))

   state = ACCEPT

   return
   end



# check_last_for_boolean --- see if the pathological case
#                            "(<ae>)<op><ae>" has thrown off the parser
#                            and rectify the situation

   subroutine check_last_for_boolean

   include "rp_com.i"

   pointer head, tail, q, p, r
   pointer expr_stack_pop, dsget

   q = expr_stack_pop (q)
   call expr_stack_push (q)

   if (Mem (q + TREETYPE) ~= IDSYM)    # We can't do anything
      return

   head = Mem (q + TREEVALUE)
   for (r = head; r ~= 0; r = Mem (r + SAVELINK))  # find the tail
      tail = r

   p = dsget (1 + SAVESIZE)           # replace the "("
   Mem (p + SAVELINK) = head
   Mem (p + SAVETYPE) = '('c
   Mem (p + SAVETEXT) = '('c
   Mem (p + SAVETEXT + 1) = EOS
   head = p

   Mem (q + TREEVALUE) = p

   p = dsget (1 + SAVESIZE)           # replace the ")"
   Mem (p + SAVELINK) = 0
   Mem (p + SAVETYPE) = ')'c
   Mem (p + SAVETEXT) = ')'c
   Mem (p + SAVETEXT + 1) = EOS
   Mem (tail + SAVELINK) = p
   tail = p

   call collect_balanced_string (head, tail)    # get the rest

DEBUG for (q = head; q ~= 0; q = Mem (q + SAVELINK))
DEBUG    call print (ERROUT, "save=*i *i '*s'*n"p, Mem (q + SAVETYPE),
DEBUG       Mem (q + SAVETYPE), Mem (q + SAVETEXT))
DEBUG call dsdump

   return
   end



# collect_balanced_string --- collect a string of non-operators
#                             containing balanced parentheses

   subroutine collect_balanced_string (head, tail)
   pointer head, tail

   include "rp_com.i"

   integer nlpar
   pointer save_sym
   nlpar = 0

   repeat {    # handle simple boolean expressions

      while (Symbol == NEWLINE)
         call getsym

      select (Symbol)
      when (ORIFSYM, ANDIFSYM, '|'c, '&'c, ','c, NOTSYM,
            EQSYM, NESYM, GTSYM, LTSYM, GESYM, LESYM)
         if (nlpar == 0)
            break
      when (';'c, EOF, '{'c, '}'c) {
         if (nlpar ~= 0)
            SYNERR ("missing right parenthesis"p)
         break
         }
      when ('('c)
         nlpar += 1
      when (')'c) {
         nlpar -= 1
         if (nlpar < 0)
            break
         }

      tail = save_sym (tail)   # Stuff the symbol off somewhere
      if (head == 0)
         head = tail

      call getsym

      } until (nlpar < 0)     # end boolean expression repeat

   return
   end



# generate_expr_code --- generate IF statements for an expression

   subroutine generate_expr_code (fb)
   integer fb

   include "rp_com.i"

   pointer p
   pointer expr_stack_pop

   call enter_operator (NOTSYM)
   p = expr_stack_pop (p)

   call gen_if (p, fb)

   return
   end



# gen_if --- generate code for ORIF and ANDIF

   subroutine gen_if (p, fb)
   pointer p
   integer fb

   include "rp_com.i"

   integer l
   integer labgen

   DEBUG call print (ERROUT, "in gen_if: op=*i*n"p, Mem (p + TREETYPE))

   call propagate_nots (p)

   select (Mem (p + TREETYPE))
   when (ORIFSYM) {
      call gen_if (Mem (p + TREELEFT), fb)
      call gen_if (Mem (p + TREERIGHT), fb)
      call dsfree (p)
      }
   when (ANDIFSYM) {
      call negate_children (p)
      l = labgen (1)
      call gen_if (Mem (p + TREELEFT), l)
      call gen_if (Mem (p + TREERIGHT), l)
      call outgo (fb)
      call outnum (l, CODE)
      call dsfree (p)
      }
   else {
      call outtab (CODE)
      call outstr ("IF("s, CODE)
      call gen_expr (p)
      call outstr (")GOTO "s, CODE)
      call outgolab (fb)
      call outdon (CODE)
      }

   return
   end



# gen_expr --- generate an IF statement for a boolean expression

   subroutine gen_expr (p)
   pointer p

   include "rp_com.i"

   integer t
   integer restore_sym
   pointer q
   character buf (MAXTOK)

   integer length

   DEBUG call print (ERROUT, "gen_expr: op=*i*n"p, Mem (p + TREETYPE))

   call propagate_nots (p)

   select (Mem (p + TREETYPE))
   when (ORIFSYM) {
      SYNERR ("|| appears within argument of & or |"p)
      Mem (p + TREETYPE) = '|'c
      }
   when (ANDIFSYM) {
      SYNERR ("&& appears within argument of & or |"p)
      Mem (p + TREETYPE) = '&'c
      }
   when (IDSYM) {                      # No parens around id's
      q = Mem (p + TREEVALUE)
      while (restore_sym (q, buf, t) ~= EOF)
         if (t == STRCONSTANTSYM)
            call outlit (buf, length (buf), CODE)
         else
            call outstr (buf, CODE)

      call dsfree (p)
      return
      }
   when (NOTSYM) {
      call outch ('('c, CODE)
      call outstr (".NOT."s, CODE)
      call gen_expr (Mem (p + TREELEFT))
      call outch (')'c, CODE)
      call dsfree (p)
      return
      }

   call outch ('('c, CODE)
   call gen_expr (Mem (p + TREELEFT))

   select (Mem (p + TREETYPE))
   when ('|'c)
      call outstr (".OR."s, CODE)
   when ('&'c)
      call outstr (".AND."s, CODE)
   when (EQSYM)
      call outstr (".EQ."s, CODE)
   when (NESYM)
      call outstr (".NE."s, CODE)
   when (GESYM)
      call outstr (".GE."s, CODE)
   when (LESYM)
      call outstr (".LE."s, CODE)
   when (GTSYM)
      call outstr (".GT."s, CODE)
   when (LTSYM)
      call outstr (".LT."s, CODE)
   else
      FATAL ("in gen_expr: can't happen"p)

   call gen_expr (Mem (p + TREERIGHT))
   call outch (')'c, CODE)     # Don't forget to update special cases
                           # at the head of this procedure

   call dsfree (p)

   return
   end



# propagate_nots --- propagate a NOT down one level

   subroutine propagate_nots (p)
   pointer p

   include "rp_com.i"

   pointer q, r

   DEBUG call print (ERROUT, "propagate_nots: op=*i*n"p,
   DEBUG                      Mem (p + TREETYPE))

   repeat {
      if (Mem (p + TREETYPE) ~= NOTSYM)    # we can't do anything here
         return
      q = Mem (p + TREELEFT)
      if (Mem (q + TREETYPE) ~= NOTSYM)
         break
      r = Mem (q + TREELEFT)
      call copy_tree_node (r, p)
      call dsfree (q)
      call dsfree (r)
      }

   select (Mem (q + TREETYPE))
   when (ORIFSYM) {
      call replace_tree_node (p, q, ANDIFSYM)
      call negate_children (p)
      }
   when (ANDIFSYM) {
      call replace_tree_node (p, q, ORIFSYM)
      call negate_children (p)
      }
   when ('|'c) {
      call replace_tree_node (p, q, '&'c)
      call negate_children (p)
      }
   when ('&'c) {
      call replace_tree_node (p, q, '|'c)
      call negate_children (p)
      }
   when (EQSYM)
      call replace_tree_node (p, q, NESYM)
   when (NESYM)
      call replace_tree_node (p, q, EQSYM)
   when (LTSYM)
      call replace_tree_node (p, q, GESYM)
   when (GTSYM)
      call replace_tree_node (p, q, LESYM)
   when (GESYM)
      call replace_tree_node (p, q, LTSYM)
   when (LESYM)
      call replace_tree_node (p, q, GTSYM)

   return
   end



# replace_tree_node --- replace one tree node with another, change the operator

   subroutine replace_tree_node (p, q, op)
   pointer p, q
   integer op

   include "rp_com.i"

   call copy_tree_node (q, p)
   call dsfree (q)

   Mem (p + TREETYPE) = op

   return
   end



# negate_children --- add "not" to the children of p

   subroutine negate_children (p)
   pointer p

   include "rp_com.i"

   pointer make_tree_node

   Mem (p + TREELEFT) = make_tree_node (Mem (p + TREELEFT), 0, NOTSYM, 0)
   Mem (p + TREERIGHT) = make_tree_node (Mem (p + TREERIGHT), 0, NOTSYM, 0)

   return
   end



# copy_tree_node --- make a copy of a tree node at q from p

   subroutine copy_tree_node (p, q)
   pointer p, q

   include "rp_com.i"

   Mem (q + TREELEFT) = Mem (p + TREELEFT)
   Mem (q + TREERIGHT) = Mem (p + TREERIGHT)
   Mem (q + TREETYPE) = Mem (p + TREETYPE)
   Mem (q + TREEVALUE) = Mem (p + TREEVALUE)

   return
   end


# enter_operator --- push an operator onto the expression stack

   subroutine enter_operator (op)
   integer op

   include "rp_com.i"

   pointer p, q
   pointer make_tree_node, expr_stack_pop

   if (op == NOTSYM) {      # unary operators
      p = expr_stack_pop (p)
      q = 0
      }
   else {                  # binary operators
      q = expr_stack_pop (q)
      p = expr_stack_pop (p)
      }
   call expr_stack_push (make_tree_node (p, q, op, 0))

   return
   end



# expr_stack_push --- push an element on the expression stack

   subroutine expr_stack_push (p)
   pointer p

   include "rp_com.i"

   if (Expr_stack_ptr >= MAXEXPR)
      FATAL ("expr stack overflow"p)

   DEBUG call print (ERROUT, "expr_stack_push: op=*i*n"p,
   DEBUG                Mem (p + TREETYPE))

   Expr_stack_ptr += 1
   Expr_stack (Expr_stack_ptr) = p

   return
   end



# expr_stack_pop --- grab an element off the expression stack

   pointer function expr_stack_pop (p)
   pointer p

   include "rp_com.i"

   if (Expr_stack_ptr <= 0)
      FATAL ("expr stack underflow"p)

   p = Expr_stack (Expr_stack_ptr)
   Expr_stack_ptr -= 1

   DEBUG call print (ERROUT, "expr_stack_pop: op=*i*n"p,
   DEBUG                      Mem (p + TREETYPE))

   expr_stack_pop = p
   return
   end


# save_sym --- copy a symbol off into dynamic storage, return a pointer

   pointer function save_sym (p)
   pointer p

   include "rp_com.i"

   integer length
   pointer dsget

   save_sym = dsget (length (Symtext) + SAVESIZE)  # for link, value, EOS
   Mem (save_sym + SAVELINK) = 0
   Mem (save_sym + SAVETYPE) = Symbol
   call scopy (Symtext, 1, Mem, save_sym + SAVETEXT)

   if (p ~= 0)                         # fill in the last link
      Mem (p + SAVELINK) = save_sym

   DEBUG call print (ERROUT, "save_sym: text=*s*n"p, Symtext)

   return
   end



# restore_sym --- recover a symbol from dynamic storage

   integer function restore_sym (p, buf, t)
   pointer p
   character buf (ARB)
   integer t

   include "rp_com.i"

   pointer q
   integer scopy

   if (p == 0)
      restore_sym = EOF
   else {
      call scopy (Mem (p + SAVETEXT), 1, buf, 1)
      t = Mem (p + SAVETYPE)
      q = p
      p = Mem (p + SAVELINK)
      call dsfree (q)
      restore_sym = OK
      }

   DEBUG call print (ERROUT, "restore_sym:  text=*s*n"p, buf)

   return
   end



# make_tree_node --- make a node in the tree format

   pointer function make_tree_node (left, right, type, value)
   pointer left, right, value
   integer type

   include "rp_com.i"

   pointer p
   pointer dsget

   p = dsget (TREESIZE)
   Mem (p + TREELEFT) = left
   Mem (p + TREERIGHT) = right
   Mem (p + TREETYPE) = type
   Mem (p + TREEVALUE) = value

   make_tree_node = p
   return
   end



