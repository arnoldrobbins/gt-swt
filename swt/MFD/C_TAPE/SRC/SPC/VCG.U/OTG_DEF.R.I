#     otg_def.r.i --- definitions for the object text generator
#     Jeff Lee, May, 1982
#     Ed Hunt, May, 1983


   define (DB,#)
   define (OTG_COMMON,"otg_com.r.i")

#     extensions

   define (unsigned,integer)
   define (lpointer,unsigned)

#     limit definitions

   define (MAX_BLOCK,64)
   define (MAX_LAB_MEMORY,8192)     # (1167 labels)
   define (MAX_LIT_MEMORY,4096)     # (372 literals)
   define (MAX_EXT_MEMORY,2048)     # (68 names)
   define (MAX_ENT_MEMORY,4096)     # (60 names)
   define (PMA_NAME_LEN,33)


#     block type definitions

   define (PREFIX_BLOCK,9)
   define (DATA_BLOCK,10)
   define (END_BLOCK,11)

#     procedure block control flags

   define (INIT_PROC,:17)
   define (FIXUP_PROC,:27)
   define (RESET_PROC,:47)


#     group type definitions

   define (ENDBLOCK_GROUP,:00)
   define (SHORTCOM_GROUP,:01)
   define (ABSENT_GROUP,:02)
   define (RELENT_GROUP,:03)
   define (ABSORG_GROUP,:04)
   define (RELORG_GROUP,:05)
   define (ABSSETB_GROUP,:06)
   define (RELSETB_GROUP,:07)
   define (DATA_GROUP,:10)
   define (GENERIC_GROUP,:11)
   define (REPEATDATA_GROUP,:12)
   define (MEMREF_GROUP,:13)
   define (MEMREFCOM_GROUP,:14)
   define (MEMREFEXT_GROUP,:15)
   define (ABSEND_GROUP,:16)
   define (RELEND_GROUP,:17)
   define (SFL_GROUP,:20)
   define (RFL_GROUP,:21)
   define (UIIREQ_GROUP,:30)
   define (UII_GROUP,:31)
   define (COMMONORG_GROUP,:32)
   define (RESOLVFR_GROUP,:33)
   define (LOADIFREQ_GROUP,:34)
   define (SKIP_GROUP,:35)
   define (PROCDEF_GROUP,:36)
   define (ABSENTLB_GROUP,:37)
   define (RELENTLB_GROUP,:40)
   define (ABSORGLB_GROUP,:41)
   define (RELORGLB_GROUP,:42)
   define (IPEXTERN_GROUP,:43)
   define (IPSHORTCOM_GROUP,:44)
   define (ECB_GROUP,:45)
   define (ABSENDLB_GROUP,:46)
   define (IPPROC_GROUP,:47)
   define (IPLINK_GROUP,:50)
   define (LONGCOM_GROUP,:51)
   define (IPLONGCOM_GROUP,:52)
   define (DYNT_GROUP,:53)
   define (SPCOM_GROUP,:54)


#     Bit definitions

   define (BIT1,:100000)
   define (BIT2,:040000)
   define (BIT3,:020000)
   define (BIT4,:010000)
   define (BIT5,:004000)
   define (BIT6,:002000)
   define (BIT7,:001000)
   define (BIT8,:000400)
   define (BIT9,:000200)
   define (BIT10,:000100)
   define (BIT11,:000040)
   define (BIT12,:000020)
   define (BIT13,:000010)
   define (BIT14,:000004)
   define (BIT15,:000002)
   define (BIT16,:000001)


#     Key definitions

   define (S16,:000000)
   define (S32,:002000)
   define (R32,:006000)
   define (R64,:004000)
   define (V64,:014000)
   define (I32,:010000)


#     Hardware definition bits for UII

   define (PRIME_500,:000100)
   define (PRIME_400,:000040)
   define (PRIME_300,:000002)
   define (DPFP_HARDWARE,:000010)
   define (SPFP_HARDWARE,:000004)
   define (HI_SPEED_ARITH,:000001)


#     Memory reference definitions

   define (SHORT_BIT,:100000)
   define (INDIRECT_BIT,:040000)
   define (INDEX_BIT,:020000)
   define (PREINDEX_BIT,:010000)
   define (YINDEX_BIT,:004000)

   define (MR_D,:000000)         define (MR_DS,:100000)
   define (MR_I,:040000)         define (MR_IS,:140000)
   define (MR_X,:020000)         define (MR_XS,:120000)
   define (MR_IX,:060000)        define (MR_IXS,:160000)
   define (MR_XI,:070000)        define (MR_XIS,:170000)
   define (MR_Y,:024000)
   define (MR_IY,:064000)
   define (MR_YI,:074000)



# Machine Registers:

   define(PB_REG,:000000)
   define(SB_REG,:000001)
   define(LB_REG,:000002)
   define(XB_REG,:000003)


#     ap definitions

   define (AP_D,0)
   define (AP_DL,1)
   define (AP_DS,2)
   define (AP_DLS,3)
   define (AP_I,4)
   define (AP_IL,5)
   define (AP_IS,6)
   define (AP_ILS,7)


#     instruction definitions
#     addressing mode change

   define (E16S,:11)
   define (E32S,:13)
   define (E32R,:1013)
   define (E64R,:1011)
   define (E64V,:10)
   define (E32I,:1010)

#     branch instructions

   define (BCLT,:141604)
   define (BCLE,:141600)
   define (BCEQ,:141602)
   define (BCNE,:141603)
   define (BCGE,:141605)
   define (BCGT,:141601)

   define (BMLT,:141707)
   define (BMLE,:141711)
   define (BMEQ,:141602)
   define (BMNE,:141603)
   define (BMGE,:141606)
   define (BMGT,:141710)

   define (BCR,:141705)
   define (BCS,:141704)
   define (BLR,:141707)
   define (BLS,:141706)

   define (BLT,:140614)
   define (BLE,:140610)
   define (BEQ,:140612)
   define (BNE,:140613)
   define (BGE,:140615)
   define (BGT,:140611)

   define (BLLT,:140614)
   define (BLLE,:140700)
   define (BLEQ,:140702)
   define (BLNE,:140703)
   define (BLGE,:140615)
   define (BLGT,:140701)

   define (BFLT,:141614)
   define (BFLE,:141610)
   define (BFEQ,:141612)
   define (BFNE,:141613)
   define (BFGE,:141615)
   define (BFGT,:141611)

   define (BIX,:141334)
   define (BIY,:141324)
   define (BDX,:140734)
   define (BDY,:140724)

   define (CGT,:1314)

#     character instructions

   define (LDC0,:001302)
   define (LDC1,:001312)
   define (STC0,:001322)
   define (STC1,:001332)
   define (ZMC,:001117)
   define (ZED,:001111)
   define (ZFIL,:001116)
   define (ZMV,:001114)
   define (ZMDV,:001115)
   define (ZTRN,:001110)

#     clear register instructions

   define (CAL,:141050)
   define (CAR,:141044)
   define (CRA,:140040)
   define (CRB,:140015)
   define (CRE,:141404)
   define (CRL,:140010)
   define (CRLE,:141410)

#     decimal instructions

   define (XAD,:001100)
   define (XBTD,:001145)
   define (XCM,:001102)
   define (XDTB,:001146)
   define (XDV,:001107)
   define (XED,:001112)
   define (XMP,:001104)
   define (XMV,:001101)

#     field operations

   define (ALFA0,:1301)
   define (ALFA1,:1311)
   define (EAFA0,:1300)
   define (EAFA1,:1310)
   define (LFLI0,:1303)
   define (LFLI1,:1313)
   define (STFA0,:1320)
   define (STFA1,:1330)
   define (TFLL0,:1323)
   define (TFLL1,:1333)
   define (TLFL0,:1321)
   define (TLFL1,:1331)

#     floating point arithmetic

   define (DFAD,:0206)
   define (DFCM,:140574)
   define (DFCS,:0211)
   define (DFDV,:0217)
   define (DFLD,:0202)
   define (DFLX,:1215)
   define (DFMP,:0216)
   define (DFSB,:0207)
   define (DFST,:0204)

   define (FAD,:0106)
   define (FCM,:140574)
   define (FCS,:0111)
   define (FDBL,:140016)
   define (FDV,:0117)
   define (FLD,:0102)
   define (FLTA,:140532)
   define (FLTL,:140535)
   define (FLX,:1115)
   define (FMP,:0116)
   define (FRN,:140534)
   define (FSB,:0107)
   define (FSGT,:140515)
   define (FSLE,:140514)
   define (FSMI,:140512)
   define (FSNZ,:140511)
   define (FSPL,:140513)
   define (FST,:0104)
   define (FSZE,:140510)
   define (INT,:140533)
   define (INTA,:140531)
   define (INTL,:140533)

#     integer arithmetic

   define (A1A,:141206)
   define (A2A,:140304)
   define (ACA,:141216)
   define (ADD,:0006)
   define (ADL,:0306)
   define (ADLL,:141000)
   define (CAS,:0011)
   define (CAZ,:140214)
   define (CHS,:140024)
   define (CLS,:0311)
   define (CSA,:140320)
   define (DIV,:0017)
   define (DVL,:0317)
   define (MPL,:0316)
   define (MPY,:0016)
   define (PIDA,:000115)
   define (PIDL,:000305)
   define (PIMA,:000205)
   define (PIML,:000301)
   define (S1A,:140110)
   define (S2A,:140310)
   define (SBL,:0307)
   define (SSM,:140500)
   define (SSP,:140100)
   define (SUB,:0007)
   define (TCA,:140407)
   define (TCL,:141210)

#     integrity checks

   define (EMCM,:000503)
   define (LMCM,:000501)
   define (MDEI,:001304)
   define (MDII,:001305)
   define (MDIW,:001324)
   define (MDRS,:001306)
   define (MDWC,:001307)
   define (RMC,:000021)
   define (SMRC,:100200)
   define (SMCS,:101200)
   define (VIRY,:000311)
   define (XVRY,:001113)

#     i/o instructions

   define (CAI,:000411)
   define (EIO,:0114)
   define (ENB,:000401)
   define (ESIM,:000415)
   define (EVIM,:000417)
   define (INH,:001001)

#     key manipulation

   define (RCB,:140200)
   define (SCB,:140600)
   define (TAK,:001015)
   define (TKA,:001005)

#     logical operations

   define (ANA,:0003)
   define (ANL,:0303)
   define (CMA,:140401)
   define (ERA,:0005)
   define (ERL,:0305)
   define (ORA,:0203)

#     logical test and sets

   define (LLT,:140410)
   define (LLE,:140411)
   define (LEQ,:140413)
   define (LNE,:140412)
   define (LGE,:140414)
   define (LGT,:140415)

   define (LCLT,:141500)
   define (LCLE,:141501)
   define (LCEQ,:141503)
   define (LCNE,:141502)
   define (LCGE,:141504)
   define (LCGT,:141505)

   define (LLLT,:140410)
   define (LLLE,:141511)
   define (LLEQ,:141513)
   define (LLNE,:141512)
   define (LLGE,:140414)
   define (LLGT,:141515)

   define (LFLT,:141110)
   define (LFLE,:141111)
   define (LFEQ,:141113)
   define (LFNE,:141112)
   define (LFGE,:141114)
   define (LFGT,:141115)

   define (LTA,:140417)
   define (LFA,:140416)

#     machine control

   define (CXCS,:001714)
   define (HLT,:000000)
   define (ITLB,:000615)
   define (LIOT,:000044)
   define (LPID,:000617)
   define (LPWS,:000711)
   define (LWCS,:001710)
   define (MIA,:0112)
   define (MIB,:0113)
   define (NOP,:000001)
   define (PTLB,:000064)
   define (RRST,:000717)
   define (RSAV,:000715)
   define (STPM,:000024)
   define (SVC,:000505)
   define (WCS,:001600)

#     move data

# for mr instructions:
#
#     if 1st octal digit is 1 then it's a special mr instr -
#        no indexing allowed
#     next digit defines mr opcode extension (rightmost 2 bits)
#     next 2 digits are the opcode (rightmost 4 bits)
#
   define (IAB,:000201)
   define (ICA,:141340)
   define (ICL,:141140)
   define (ICR,:141240)
   define (ILE,:141414)
   define (IMA,:0013)
   define (LDA,:0002)
   define (LDL,:0302)
   define (LDLR,:0105)
   define (LDX,:1035)
   define (LDY,:1135)
   define (STA,:0004)
   define (STAC,:001200)
   define (STL,:0304)
   define (STLC,:001204)
   define (STLR,:0103)
   define (STX,:1015)
   define (STY,:1235)
   define (TAB,:140314)
   define (TAX,:140504)
   define (TAY,:140505)
   define (TBA,:140604)
   define (TXA,:141034)
   define (TYA,:141124)
   define (XCA,:140104)
   define (XCB,:140204)

#     program control and jump

   define (ARGT,:000605)
   define (EAL,:0101)
   define (EALB,:0213)
   define (EAXB,:0212)
   define (JMP,:0001)
   define (JST,:0010)
   define (JSX,:1335)
   define (JSXB,:0214)
   define (JSY,:0014)
   define (PCL,:0210)
   define (PRTN,:000611)
   define (STEX,:001315)
   define (XEC,:0201)

#     process exchange

   define (INBC,:001217)
   define (INBN,:001215)
   define (INEC,:001216)
   define (INEN,:001214)
   define (NFYB,:001211)
   define (NFYE,:001210)
   define (WAIT,:000315)

#     queue managemet

   define (ABQ,:141716)
   define (ATQ,:141717)
   define (RBQ,:141715)
   define (RTQ,:141714)
   define (TSTQ,:141757)

#     shift

   define (ALL,:041400)
   define (ALR,:041600)
   define (ALS,:041500)
   define (ARL,:040400)
   define (ARR,:040600)
   define (ARS,:040500)
   define (LLL,:041000)
   define (LLR,:041200)
   define (LLS,:041100)
   define (LRL,:040000)
   define (LRR,:040200)
   define (LRS,:040100)

#     skip

   define (DRX,:140210)
   define (IRS,:0012)
   define (IRX,:140114)
   define (SAR,:100260)
   define (SAS,:101260)
   define (SGT,:100220)
   define (SLE,:101220)
   define (SLN,:101100)
   define (SLZ,:100100)
   define (SMI,:101400)
   define (SNR,:100240)
   define (SNS,:101240)
   define (SNZ,:101040)
   define (SPL,:100400)
   define (SRC,:100001)
   define (SSC,:101001)
   define (SZE,:100040)

# Global macro definitions for code generator


# Assorted flags

define (LONG,:777)
define (SHORT,:111)
define (EXTERNAL,:707)
define (INTERNAL,:7070)


# Address descriptor structure definition:

define (ADDR_DESC_SIZE, 5)          # size of an address descriptor
define (AD_MODE(ad),ad(1))
   define (DIRECT_AM,1)
   define (INDEXED_AM,2)
   define (INDIRECT_AM,3)
   define (INDIRECT_POSTX_AM,4)
   define (PREX_INDIRECT_AM,5)
   define (ILIT_AM,6)
   define (LLIT_AM,7)
   define (FLIT_AM,8)
   define (DLIT_AM,9)
   define (LABELED_AM,10)
define (AD_BASE(ad),ad(2))
define (AD_OFFSET(ad),ad(3))
define (AD_LABEL(ad),ad(3))
define (AD_RESOLVED(ad),ad(4))
define (AD_APMODE(ad),ad(4))
define (AD_LIT1(ad),ad(2))
define (AD_LIT2(ad),ad(3))
define (AD_LIT3(ad),ad(4))
define (AD_LIT4(ad),ad(5))




# Machine instruction classes:

define(BRANCH_INSTRUCTION,1)
define(MR_INSTRUCTION,2)
define(LABEL_INSTRUCTION,3)
define(GENERIC_INSTRUCTION,4)
define(MISC_INSTRUCTION,5)
define(PSEUDO_INSTRUCTION,6)



# Pseudo_ops not included below:

define (LINK_INS,1)
define (PROC_INS,2)
define (FIN_INS,3)
define (END_INS,4)
define (MODULE_INS,5)
define (END_PREFIX_INS,6)



# Miscellaneous instructions and pseudo_ops:

define(ENT_INS,1)
define(ECB_INS,2)
define(ALL_INS,3)
define(IP_INS,4)
define(EXT_INS,5)
define(DATA_INS,6)
define(BSZ_INS,7)
define(LLL_INS,8)
define(ARL_INS,9)
define(LRL_INS,10)
define(AP_INS,11)
define(SHORT_JUMP_AHEAD_INS,12)
define(SHORT_JUMP_LABEL_INS,13)
define(DAC_INS,14)
define(ARS_INS,15)
define(LRS_INS,16)
define(SETUP_OWNER_INS,17)
define(JSXB_EXT_INS,18)
define(EXT_RTR_INS,19)
define(IP_RTR_INS,20)
