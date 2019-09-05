# arg_def.r.i --- defines for use with the command line parser

   define (ARG_NOT_ALLOWED,1)
   define (ARG_FLAG,2)
   define (ARG_OPT_INT,3)
   define (ARG_REQ_INT,4)
   define (ARG_OPT_STR,5)
   define (ARG_REQ_STR,6)
   define (ARG_IGNORED,7)

   define (ARG_NOT_SEEN,0)
   define (ARG_LETTER_SEEN,1)
   define (ARG_VALUE_SEEN,2)

   define (MAXARGBUF, 200)
   define (ARG_BUF, a$buf)
   define (ARG_DECL, integer ARG_BUF (MAXARGBUF))

   define (ARG_BPTR, ARG_BUF (53))
   define (ARG_VALUE (ch), ARG_BUF ('ch'c - 'a'c + 27))
   define (ARG_VALUE_I (i), ARG_BUF (i + 26))
   define (ARG_TEXT (ch), ARG_BUF (ARG_BUF ('ch'c - 'a'c + 27)))
   define (ARG_TEXT_I (i), ARG_BUF (ARG_BUF (i + 26)))

   define (ARG_PRESENT (ch), (ARG_BUF ('ch'c - 'a'c + 1) ~= ARG_NOT_SEEN))
   define (ARG_PRESENT_I (i), (ARG_BUF (i) ~= ARG_NOT_SEEN))

   define (ARG_DEFAULT_INT (ch, val), {
      if (ARG_BUF ('ch'c - 'a'c + 1) ~= ARG_VALUE_SEEN)
         ARG_VALUE (ch) = val
      })
   define (ARG_DEFAULT_INT_I (i, val), {
      if (ARG_BUF (i) ~= ARG_VALUE_SEEN)
         ARG_VALUE_I (i) = val
      })

   define (ARG_DEFAULT_STR (ch, str),{
         integer ctoc
         if (ARG_BUF ('ch'c - 'a'c + 1) ~= ARG_VALUE_SEEN) {
            ARG_VALUE (ch) = ARG_BPTR
            ARG_BPTR += 1 + ctoc (str, ARG_BUF (ARG_BPTR), MAXARGBUF)
            }
         })
   define (ARG_DEFAULT_STR_I (i, str),{
         integer ctoc
         if (ARG_BUF (i) ~= ARG_VALUE_SEEN) {
            ARG_VALUE_I (i) = ARG_BPTR
            ARG_BPTR += 1 + ctoc (str, ARG_BUF (ARG_BPTR), MAXARGBUF)
            }
         })

   define (PARSE_COMMAND_LINE (str, msg), {
         integer parscl
         if (parscl (str, ARG_BUF) == ERR)
            call error (_msg)})
