# vcg_input --- code generator intermediate form (IMF) input module

# Interface:
#     call get_tree (root); tpointer root
#        reads IMF on input stream, builds tree representation in Tmem
#     word = get (word); integer word
#        reads next word from input stream



# Elements of the IMF operator description table:

define(INT,1)
define(UNS,2)
define(TREE,3)
define(SPECIAL,4)
define(EON,5)
define(STRING,6)



# get_tree --- build internal form of IMF tree in prefix Polish

   subroutine get_tree (root)
   tpointer root

   include VCG_COMMON

   string_table posn, info _
      / ADDAA_OP, 4, INT, TREE, TREE, EON,
      / ADD_OP, 4, INT, TREE, TREE, EON,
      / ANDAA_OP, 4, INT, TREE, TREE, EON,
      / AND_OP, 4, INT, TREE, TREE, EON,
      / ASSIGN_OP, 5, INT, TREE, TREE, INT, EON,
      / BREAK_OP, 2, INT, EON,
      / CASE_OP, 4, TREE, TREE, TREE, EON,
      / COMPL_OP, 3, INT, TREE, EON,
      / CONST_OP, 0, SPECIAL, EON,
      / CONVERT_OP, 4, INT, INT, TREE, EON,
      / DECLARE_STAT_OP, 3, INT, STRING, EON,
      / DEFAULT_OP, 3, TREE, TREE, EON,
      / DEFINE_DYNM_OP, 4, INT, TREE, UNS, EON,
      / DEFINE_STAT_OP, 4, INT, TREE, UNS, EON,
      / DEREF_OP, 3, INT, TREE, EON,
      / DIVAA_OP, 4, INT, TREE, TREE, EON,
      / DIV_OP, 4, INT, TREE, TREE, EON,
      / DO_LOOP_OP, 3, TREE, TREE, EON,
      / EQ_OP, 4, INT, TREE, TREE, EON,
      / FOR_LOOP_OP, 5, TREE, TREE, TREE, TREE, EON,
      / GE_OP, 4, INT, TREE, TREE, EON,
      / GOTO_OP, 2, INT, EON,
      / GT_OP, 4, INT, TREE, TREE, EON,
      / IF_OP, 5, INT, TREE, TREE, TREE, EON,
      / INDEX_OP, 5, INT, TREE, TREE, UNS, EON,
      / INITIALIZER_OP, 4, INT, TREE, TREE, EON,
      / LABEL_OP, 2, INT, EON,
      / LE_OP, 4, INT, TREE, TREE, EON,
      / LSHIFTAA_OP, 4, INT, TREE, TREE, EON,
      / LSHIFT_OP, 4, INT, TREE, TREE, EON,
      / LT_OP, 4, INT, TREE, TREE, EON,
      / MODULE_OP, 1, SPECIAL, EON,
      / MULAA_OP, 4, INT, TREE, TREE, EON,
      / MUL_OP, 4, INT, TREE, TREE, EON,
      / NEG_OP, 3, INT, TREE, EON,
      / NEXT_OP, 2, INT, EON,
      / NE_OP, 4, INT, TREE, TREE, EON,
      / NOT_OP, 3, INT, TREE, EON,
      / NULL_OP, 1, SPECIAL, EON,
      / OBJECT_OP, 3, INT, INT, EON,
      / ORAA_OP, 4, INT, TREE, TREE, EON,
      / OR_OP, 4, INT, TREE, TREE, EON,
      / POSTDEC_OP, 4, INT, TREE, TREE, EON,
      / POSTINC_OP, 4, INT, TREE, TREE, EON,
      / PREDEC_OP, 4, INT, TREE, TREE, EON,
      / PREINC_OP, 4, INT, TREE, TREE, EON,
      / PROC_CALL_ARG_OP, 4, INT, TREE, TREE, EON,
      / PROC_CALL_OP, 4, INT, TREE, TREE, EON,
      / PROC_DEFN_ARG_OP, 6, INT, INT, INT, INT, TREE, EON,
      / PROC_DEFN_OP, 6, INT, INT, STRING, TREE, TREE, EON,
      / REFTO_OP, 3, INT, TREE, EON,
      / REMAA_OP, 4, INT, TREE, TREE, EON,
      / REM_OP, 4, INT, TREE, TREE, EON,
      / RETURN_OP, 2, TREE, EON,
      / RSHIFTAA_OP, 4, INT, TREE, TREE, EON,
      / RSHIFT_OP, 4, INT, TREE, TREE, EON,
      / SAND_OP, 4, INT, TREE, TREE, EON,
      / SELECT_OP, 4, INT, INT, TREE, EON,
      / SEQ_OP, 3, TREE, TREE, EON,
      / SOR_OP, 4, INT, TREE, TREE, EON,
      / SUBAA_OP, 4, INT, TREE, TREE, EON,
      / SUB_OP, 4, INT, TREE, TREE, EON,
      / SWITCH_OP, 4, INT, TREE, TREE, EON,
      / UNDEFINE_DYNM_OP, 2, INT, EON,
      / WHILE_LOOP_OP, 3, TREE, TREE, EON,
      / XORAA_OP, 4, INT, TREE, TREE, EON,
      / XOR_OP, 4, INT, TREE, TREE, EON,
      / ZERO_INITIALIZER_OP, 3, UNS, TREE, EON,
      / FIELD_OP, 5, INT, INT, INT, TREE, EON,
      / CHECK_RANGE_OP, 6, INT, TREE, TREE, TREE, INT, EON,
      / CHECK_UPPER_OP, 5, INT, TREE, TREE, INT, EON,
      / CHECK_LOWER_OP, 5, INT, TREE, TREE, INT, EON

   integer op, p, p2, size, word, sp

   tpointer t
   tpointer talloc

   pointer strsave

   character str (MAXLINE)
   save str

   call get (op)
   if (op < 1 || op > LAST_OPERATOR)
      call panic ("in get_tree:  bad operator (*i)*n"p, op)

   select (op)
      when (CONST_OP) {       # case, to conserve memory and IMF space
         call get (word)
         call get (size)
         t = talloc (3 + size)   # op number, mode, size, constant data
         root = t
         Tmem (t) = CONST_OP
         Tmem (t + 1) = word
         Tmem (t + 2) = size
         for (t += 3; size > 0; {size -= 1; t += 1})
            call get (Tmem (t))
         return
         }

      when (NULL_OP) {        # special case to terminate lists, etc.
         root = 0
         return
         }

   # The general case:  determine size of the operator node,
   #  allocate space for it in tree memory, and fill in its fields:

   p = posn (op + 1)
   if (info (p) ~= op)
      call panic ("in get_tree:  table inconsistency at *i*n"p, op)

   size = info (p + 1)
   t = talloc (size)
   root = t
   Tmem (t) = op
   t += 1

   for (p2 = p + 2; info (p2) ~= EON; p2 += 1)
      select (info (p2))
         when (INT, UNS) {
            call get (Tmem (t))
            t += 1
            }
         when (TREE) {
            call get_tree (Tmem (t))
            t += 1
            }
         when (STRING) {
            call get (size)
            size += 1         # to allow for EOS, just in case
            if (size < 0 || size > MAXLINE)
               call panic ("in get_tree:  string to long to handle*n"p)
            for (sp = 1; sp < size; sp += 1)
               call get (str (sp))
            str (size) = EOS
            Tmem (t) = strsave (str)
            t += 1
            }
      else
         call panic ("bad table element in get_tree*n"p)

   return
   end



# get --- get next word from input stream

   integer function get (word)
   integer word

   include VCG_COMMON

   integer readf

   if (readf (word, 1, Infile) == EOF) {
      call warning ("unexpected EOF in input stream*n"p)
      word = NULL_OP
      return (NULL_OP)
      }

   return (word)
   end



undefine(INT)
undefine(UNS)
undefine(TREE)
undefine(SPECIAL)
undefine(EON)
undefine(STRING)
