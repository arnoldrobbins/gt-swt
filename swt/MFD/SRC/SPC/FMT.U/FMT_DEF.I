# fmt_def.i --- definitions for 'fmt'

include ARGUMENT_DEFS

define (FMT_COMMON,"fmt_com.r.i")
define (ON,)
define (OFF,#)
define (div,/)
define (INSIZE,500)
define (MAXLINE,134)       # max number of output columns + 2
define (MAXOUT,1454)       # (4 * OVERSTRIKES + 3) * (MAXLINE - 2) + 2
define (OVERSTRIKES,2)     # number of times to overstrike for boldfacing
define (PAGENUM,'#'c)
define (PAGEWIDTH,60)
define (PAGELEN,66)
define (MARGIN1,3)
define (MARGIN2,2)
define (MARGIN3,2)
define (MARGIN4,3)
define (MAXFILES,100)
define (MACBUFSIZE,50000)
define (MAXMACLVL,100)
define (MAXNAME,41)
define (MACRO,0)
define (FILE,1)
define (ENDOFLIST,-3)
define (FLINK,3)
define (BLINK,4)
define (MACSTART,5)
define (MACRELEASEMARK,0)
define (ARGBUFSIZE,1000)
define (MAXNUMREGS,200)
define (PHANTOMBL,8r40)
define (MEMSIZE,4090)

define (COMMENT,-1)      # must be < 1, differ from UNKNOWN
define (UNKNOWN,-2)      # must be < 1, differ from COMMENT

define (HUGE,10000)
define (BITS_PER_WORD,16)

define (CHECK_PAGE_RANGE,if(Curpag<Start_page||Curpag>End_page)return)
define (SKIPCM(b,i),
{while(b(i)~=' 'c&&b(i)~=TAB&&b(i)~=NEWLINE&&b(i)~=EOS)i+=1;SKIPBL(b,i)})

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
define (integral,8r073)       # ;
define (INTEGRAL,8r071)       # 9
define (nabla,8r136)          # ^
define (not,8r176)            # ~
define (partial,8r072)        # :
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
define (hlf,8r012)            # linefeed
define (hlr,8r013)            # vertical tab
define (lfloor,8r146)         # f
define (rfloor,8r152)         # j
define (lceil,8r155)          # m
define (rceil,8r106)          # F
define (small0,8r041)         # !
define (small1,8r042)         # "
define (small2,8r043)         # #
define (small3,8r044)         # $
define (small4,8r045)         # %
define (small5,8r046)         # &
define (small6,8r047)         # '
define (small7,8r050)         # (
define (small8,8r051)         # )
define (small9,8r052)         # *
define (scolon,8r053)         # +
define (dquote,8r054)         # ,
define (dollar,8r056)         # .

define (ad_REQ,1)
define (bf_REQ,2)
define (bp_REQ,3)
define (br_REQ,4)
define (c2_REQ,5)
define (cc_REQ,6)
define (ce_REQ,7)
define (de_REQ,8)
define (dv_REQ,9)
define (ef_REQ,10)
define (eh_REQ,11)
define (en_REQ,12)
define (er_REQ,13)
define (ex_REQ,14)
define (fi_REQ,15)
define (fo_REQ,16)
define (he_REQ,17)
define (hy_REQ,18)
define (in_REQ,19)
define (lm_REQ,20)
define (ls_REQ,21)
define (lt_REQ,22)
define (m1_REQ,23)
define (m2_REQ,24)
define (m3_REQ,25)
define (m4_REQ,26)
define (mc_REQ,27)
define (mo_REQ,28)
define (na_REQ,29)
define (ne_REQ,30)
define (nf_REQ,31)
define (nh_REQ,32)
define (ns_REQ,33)
define (nx_REQ,34)
define (of_REQ,35)
define (oh_REQ,36)
define (pl_REQ,37)
define (pn_REQ,38)
define (po_REQ,39)
define (rc_REQ,40)
define (rm_REQ,41)
define (rs_REQ,42)
define (sb_REQ,43)
define (so_REQ,44)
define (sp_REQ,45)
define (ta_REQ,46)
define (tc_REQ,47)
define (ti_REQ,48)
define (tl_REQ,49)
define (ul_REQ,50)
define (xb_REQ,51)
define (ps_REQ,52)
define (oo_REQ,53)
define (eo_REQ,54)
define (if_REQ,55)
define (am_REQ,56)
define (it_REQ,57)

define (add_FN,1)
define (c2_FN,2)
define (cc_FN,3)
define (date_FN,4)
define (day_FN,5)
define (in_FN,6)
define (ldate_FN,7)
define (lm_FN,8)
define (ln_FN,9)
define (ls_FN,10)
define (ml_FN,11)
define (num_FN,12)
define (pl_FN,13)
define (pn_FN,14)
define (po_FN,15)
define (rm_FN,16)
define (set_FN,17)
define (tc_FN,18)
define (tcpn_FN,19)
define (ti_FN,20)
define (time_FN,21)
define (rn_FN,22)
define (RN_FN,23)
define (bf_FN,24)
define (ul_FN,25)
define (cu_FN,26)
define (sub_FN,27)
define (sup_FN,28)
define (letter_FN,29)
define (LETTER_FN,30)
define (vertspace_FN,31)
define (m1_FN,33)
define (m2_FN,34)
define (m3_FN,35)
define (m4_FN,36)
define (even_FN,37)
define (odd_FN,38)
define (cap_FN,39)
define (small_FN,40)
define (plus_FN,41)
define (minus_FN,42)
define (header_FN,43)
define (evenheader_FN,44)
define (oddheader_FN,45)
define (footer_FN,46)
define (evenfooter_FN,47)
define (oddfooter_FN,48)
define (cmp_FN,49)
define (bottom_FN,50)
define (top_FN,51)
define (lt_FN,52)
define (icmp_FN,53)
define (ns_FN, 54)
define (it_FN, 55)
