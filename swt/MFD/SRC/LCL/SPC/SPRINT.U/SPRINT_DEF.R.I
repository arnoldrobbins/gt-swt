# sprint_def.r.i --- definitions for 'sprint'

   include ARGUMENT_DEFS

   define (SPRINT_COMMON,"sprint_com.r.i")

   define (LF,8r012)
   define (NEWLINE,8r212)

   define (TOP_OF_FORM,{
      if(LETTER_OPT){
         if(Outstanding_poll)WAIT_FOR_ACK;Chunk=0;Outstanding_poll=FALSE
         call t1ou(BEL);WAIT_FOR_ACK}})

   define (DEFARG, -1)

   define (SET_HORIZONTAL_SPACING,{
      if (Spacing ~= DEFARG) {
         call t1ou (ESC)
         call t1ou (']'c)
         call t1ou (Spacing)
         Chunk += 3
         }
      })

   define (SET_VERTICAL_SPACING,{
      if (Formadvance ~= DEFARG) {
         call t1ou (ESC)
         call t1ou (']'c)
         call t1ou (Formadvance)
         Chunk += 3
         }
      })

   define (RESTORE_NORMAL_SPACING,{
      call t1ou (ESC)
      call t1ou ('='c)
      Chunk += 2
      SET_HORIZONTAL_SPACING
      SET_VERTICAL_SPACING
      })
   define (OUTCON(c),{call t1ou(c);Chunk+=1})
   define (OUTSCON(c),{call t1ou(SO);call t1ou(c);call t1ou(SI);Chunk+=3})
   define (OUTDCHAR1,{
      call t1ou (ESC)
      call t1ou (']'c)
      call t1ou ('@'c)
      call t1ou (ESC)
      call t1ou (']'c)
      call t1ou ('S'c)
      call t1ou (ESC)
      call t1ou ('9'c)
      })
   define (OUTDCHAR(x,y),{
      OUTDCHAR1
      x
      call t1ou (LF)
      call t1ou (LF)
      y
      call t1ou (ESC)
      call t1ou ('9'c)
      Chunk += 12
      RESTORE_NORMAL_SPACING
      call t1ou (' 'c)
      Chunk += 1
      })
   define (PNCHAR(x),{
      call t1ou (x)
      Chunk += 1
      })
   define (PSCHAR(x),{
      call t1ou (SO)
      call t1ou (x)
      call t1ou (SI)
      Chunk += 3
      })
   define (WAIT_FOR_ACK,{character junk,t1in;while(t1in(junk)~=ACK);})
   define (DISABLE_BREAKS,call break$(DISABLE))
   define (ENABLE_BREAKS,call break$(ENABLE))
   define (START_FORWARD_PRINT,
      {call t1ou(ESC);call t1ou(FWD);Chunk+=2;Direction=FORWARD})
   define (START_BACKWARD_PRINT,
      {call t1ou(ESC);call t1ou(BKWD);Chunk+=2;Direction=REVERSE})
   define (MOVE_TO_COLUMN(c),
      {call position_horizontally(c);Chunk+=3})
   define (MOVE_TO_LINE(l),
      {call position_vertically(l);Chunk+=3})
   define (ENTER_PLOT_MODE,
      {call t1ou(ESC);call t1ou(']'c);call t1ou('P'c)
       call t1ou(ESC);call t1ou(']'c);call t1ou('A'c);Chunk+=6})
   define (EXIT_PLOT_MODE,
      {RESTORE_NORMAL_SPACING;call t1ou(' 'c);Chunk+=1})

   define (LETTER_OPT,ARG_PRESENT(s))
   define (EJECT_OPT,ARG_PRESENT(j))
   define (PAGE_LENGTH,ARG_VALUE(l))
   define (COPIES,ARG_VALUE(c))

   define (MAXCHUNK,72)
   define (BUFLENGTH,1000)
   define (MIN,4)
   define (MAX,180)
   define (SLOPE,90)
   define (FORWARD,0)
   define (REVERSE,1)
   define (FWD,'>'c)
   define (BKWD,'<'c)

   define (alpha,8r141)          # a
   define (ALPHA,8r101)          # A
   define (beta,8r142)           # b
   define (BETA,8r102)           # B
   define (gamma,8r147)          # g
   define (GAMMA,8r107)          # G
   define (delta,8r144)          # d
   define (DELTA,8r104)          # D
   define (epsilon,8r145)        # e
   define (EPSILON,8r105)        # E
   define (zeta,8r172)           # z
   define (ZETA,8r132)           # Z
   define (eta,8r156)            # n
   define (ETA,8r116)            # N
   define (theta,8r150)          # h
   define (THETA,8r110)          # H
   define (iota,8r151)           # i
   define (IOTA,8r111)           # I
   define (kappa,8r153)          # k
   define (KAPPA,8r112)          # J
   define (lambda,8r154)         # l
   define (LAMBDA,8r114)         # L
   define (mu,8r165)             # u
   define (MU,8r125)             # U
   define (nu,8r166)             # v
   define (NU,8r126)             # V
   define (xi,8r170)             # x
   define (XI,8r130)             # X
   define (omicron,8r157)        # o
   define (OMICRON,8r117)        # O
   define (pi,8r063)             # 3
   define (PI,8r064)             # 4
   define (rho,8r162)            # r
   define (RHO,8r122)            # R
   define (sigma,8r163)          # s
   define (SIGMA,8r123)          # S
   define (tau,8r164)            # t
   define (TAU,8r124)            # T
   define (upsilon,8r161)        # q
   define (UPSILON,8r121)        # Q
   define (phi,8r160)            # p
   define (PHI,8r120)            # P
   define (chi,8r143)            # c
   define (CHI,8r103)            # C
   define (psi,8r171)            # y
   define (PSI,8r131)            # Y
   define (omega,8r167)          # w
   define (OMEGA,8r127)          # W

   define (infinity,8r070)       # 8
   define (integral,8r073)       # +
   define (INTEGRAL,8r071)       # 9
   define (nabla,8r136)          # ^
   define (not,8r176)            # ~
   define (partial,8r072)        # -
   define (downarrow,8r067)      # 7
   define (uparrow,8r066)        # 6
   define (backslash,8r065)      # 5
   define (tilde,8r062)          # 2
   define (largerbrace,8r060)    # 0
   define (largelbrace,8r061)    # 1
   define (proportional,8r075)   # =
   define (apeq,8r115)           # M
   define (ge,8r135)             # ]
   define (imp,8r100)            # @
   define (exist,8r133)          # [
   define (AND,8r137)            # _
   define (ne,8r134)             # \
   define (psset,8r074)          # <
   define (sset,8r076)           # >
   define (le,8r077)             # ?
   define (nexist,8r175)         # }
   define (univ,8r140)           # `
   define (OR,8r173)             # {
   define (iso,8r174)            # |
   define (lfloor,8r146)         # f
   define (rfloor,8r152)         # j
   define (lceil,8r155)          # m
   define (rceil,8r106)          # F
   define (small0,8r041)
   define (small1,8r042)
   define (small2,8r043)
   define (small3,8r044)
   define (small4,8r045)
   define (small5,8r046)
   define (small6,8r047)
   define (small7,8r050)
   define (small8,8r051)
   define (small9,8r052)
   define (scolon,8r053)
   define (dquote,8r054)
   define (dollar,8r056)

   define (hlf,8r012)            # line feed
   define (rhlf,8r013)           # vertical tab
   define (rlf,8r113)            # reverse line feed

   define (a_alpha, 16r53)
   define (a_ALPHA, 16r41)
   define (a_beta, 16r26)
   define (a_BETA, 16r42)
   define (a_gamma, 16r47)
   define (a_GAMMA, 16r60)
   define (a_delta, 16r4B)
   define (a_DELTA, 16r41)
   define (a_epsilon, 16r4E)
   define (a_EPSILON, 16r45)
   # zeta --- overstruck pattern
   define (a_ZETA, 16r5A)
   define (a_eta, 16r4C)
   define (a_ETA, 16r48)
   # theta --- overstruck pattern
   # THETA --- overstruck pattern
   # iota --- overstruck pattern
   define (a_IOTA, 16r49)
   # kappa --- overstruck pattern
   define (a_KAPPA, 'K'c)
   define (a_lambda, 16r42)
   # LAMBDA --- overstruck pattern
   define (a_mu, 16r3B)
   define (a_MU, 16r4D)
   # nu --- overstruck pattern
   define (a_NU, 16r4E)
   define (a_xi, 16r44)
   # XI --- overstruck pattern
   define (a_omicron, 16r6F)
   define (a_OMICRON, 16r4F)
   define (a_pi, 16r22)
   # PI --- overstruck pattern
   define (a_rho, 16r46)
   define (a_RHO, 16r50)
   define (a_sigma, 16r56)
   define (a_tSIGMA, 16r7E)
   define (a_bSIGMA, 16r5B)
   define (a_tau, 16r43)
   define (a_TAU, 16r54)
   # upsilon --- overstruck pattern
   # UPSILON --- overstruck pattern
   # phi --- overstruck pattern
   # PHI --- overstruck pattern
   # chi --- overstruck pattern
   define (a_CHI, 16r58)
   # psi --- overstruck pattern
   # PSI --- overstruck pattern
   define (a_omega, 16r58)
   define (a_OMEGA, 16r5C)

   define (a_infinity, 16r5F)
   define (a_integral, 16r24)
   define (a_tintegral, 16r48)
   define (a_bintegral, 16r40)
   define (a_partial, 16r4D)
   define (a_bslash, 16r4A)
   define (a_backslash, 16r4A)
   define (a_brbrace, 16r40)
   define (a_blbrace, 16r3E)
   define (a_trbrace, 16r5E)
   define (a_tlbrace, 16r60)
   define (a_proportional, 16r5D)
   define (a_tilde, 16r3C)
   define (a_uparrow, 16r5A)
   define (a_downarrow, 16r5E)
   define (a_lfloor,16r3e)
   define (a_rfloor,16r40)
   define (a_lceil,16r60)
   define (a_rceil,16r5e)
   define (a_small0,16r50)
   define (a_small1,16r51)
   define (a_small2,16r57)
   define (a_small3,16r45)
   define (a_small4,16r52)
   define (a_small5,16r54)
   define (a_small6,16r59)
   define (a_small7,16r55)
   define (a_small8,16r49)
   define (a_small9,16r4f)

   define (U,8r013)
   define (D,LF)
   define (L,BS)
   define (R,' 'c)
