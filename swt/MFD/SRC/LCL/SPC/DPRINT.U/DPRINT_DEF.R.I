# dprint_def.r.i --- definitions for 'dprint'

   include ARGUMENT_DEFS

   define (DPRINT_COMMON,"dprint_com.r.i")

   define (TOP_OF_FORM,{
    if(LETTER_OPT){
     if(Outstanding_poll)WAIT_FOR_ACK;Chunk=0;Outstanding_poll=FALSE
     call t1ou(BEL);WAIT_FOR_ACK}})
   define (OUTCON(c),{call t1ou(c);Chunk+=1})
   define (WAIT_FOR_ACK,{character junk,t1in;while(t1in(junk)~=ACK);})
   define (DISABLE_BREAKS,call break$(DISABLE))
   define (ENABLE_BREAKS,call break$(ENABLE))
   define (START_FORWARD_PRINT,
      {call t1ou(ESC);call t1ou('5'c);Chunk+=2;Direction=FORWARD})
   define (START_BACKWARD_PRINT,
      {call t1ou(ESC);call t1ou('6'c);Chunk+=2;Direction=REVERSE})
   define (MOVE_TO_COLUMN(c),
      {call t1ou(ESC);call t1ou(HT);call t1ou(c);Chunk+=3})
   define (MOVE_TO_LINE(l),
      {call t1ou(ESC);call t1ou(VT);call t1ou(l);Chunk+=3})
   define (ENTER_PLOT_MODE,
      {call t1ou(ESC);call t1ou('3'c);Chunk+=2})
   define (EXIT_PLOT_MODE,
      {call t1ou(ESC);call t1ou('4'c);call t1ou(' 'c);Chunk+=3})

   define (LETTER_OPT,ARG_PRESENT(s))
   define (EJECT_OPT,ARG_PRESENT(j))
   define (PAGE_LENGTH,ARG_VALUE(l))
   define (COPIES,ARG_VALUE(c))

   define (MAXCHUNK,72)
   define (BUFLENGTH,1000)
   define (MIN,4)
   define (MAX,180)
   define (SLOPE,90)
   define (FORWARD, 0)
   define (REVERSE, 1)

   define (alpha,8r141)          # a
   define (beta,8r142)           # b
   define (delta,8r144)          # d
   define (DELTA,8r104)          # D
   define (epsilon,8r145)        # e
   define (eta,8r156)            # n
   define (gamma,8r147)          # g
   define (GAMMA,8r107)          # G
   define (infinity,8r070)       # 8
   define (integral,8r053)       # +
   define (lambda,8r154)         # l
   define (LAMBDA,8r114)         # L
   define (mu,8r165)             # u
   define (nabla,8r136)          # ^
   define (not,8r176)            # ~
   define (nu,8r166)             # v
   define (omega,8r167)          # w
   define (OMEGA,8r127)          # W
   define (partial,8r055)        # -
   define (phi,8r160)            # p
   define (PHI,8r120)            # P
   define (psi,8r171)            # y
   define (PSI,8r131)            # Y
   define (pi,8r063)             # 3
   define (PI,8r064)             # 4
   define (rho,8r162)            # r
   define (sigma,8r163)          # s
   define (SIGMA,8r123)          # S
   define (tau,8r164)            # t
   define (theta,8r150)          # h
   define (THETA,8r110)          # H
   define (xi,8r170)             # x
   define (zeta,8r172)           # z
   define (hlf,8r012)            # line feed
   define (rhlf,8r013)           # vertical tab

   define (U,8r013)
   define (D,8r012)
   define (L,8r010)
   define (R,8r040)
