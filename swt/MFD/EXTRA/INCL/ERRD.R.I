# errd.r.i --- symbolic error codes for Primos file system (Ratfor version)

   define (EEOF,1)            # end of file                   pe
   define (EBOF,2)            # beginning of file             pg
   define (EUNOP,3)           # unit not open                 pd,sd
   define (EUIUS,4)           # unit in use                   si
   define (EFIUS,5)           # file in use                   si
   define (EBPAR,6)           # bad parameter                 sa
   define (ENATT,7)           # no ufd attached               sl,al
   define (EFDFL,8)           # ufd full                      sk
   define (EDKFL,9)           # disk full                     dj
   define (ENRIT,10)          # no right                      sx
   define (EFDEL,11)          # file open on delete           sd
   define (ENTUD,12)          # not a ufd                     ar
   define (ENTSD,13)          # not a segdir                  --
   define (EDIRE,14)          # is a directory                --
   define (EFNTF,15)          # (file) not found              sh,ah
   define (EFNTS,16)          # (file) not found in segdir    sq
   define (EBNAM,17)          # illegal name                  ca
   define (EEXST,18)          # already exists                cz
   define (EDNTE,19)          # directory not empty           --
   define (ESHUT,20)          # bad shutdn (fam only)         bs
   define (EDISK,21)          # disk i/o error                wb
   define (EBDAM,22)          # bad dam file (fam only)       ss
   define (EPTRM,23)          # ptr mismatch (fam only)       pc,dc,ac
   define (EBPAS,24)          # bad password (fam only)       an
   define (EBCOD,25)          # bad code in errvec            --
   define (EBTRN,26)          # bad truncate of segdir        --
   define (EOLDP,27)          # old partition                 --
   define (EBKEY,28)          # bad key                       --
   define (EBUNT,29)          # bad unit number               --
   define (EBSUN,30)          # bad segdir unit               sa
   define (ESUNO,31)          # segdir unit not open          --
   define (ENMLG,32)          # name too long                 --
   define (ESDER,33)          # segdir error                  sq
   define (EBUFD,34)          # bad ufd                       --
   define (EBFTS,35)          # buffer too small              --
   define (EFITB,36)          # file too big                  --
   define (ENULL,37)          # (null message)                --
   define (EIREM,38)          # ill remote ref                --
   define (EDVIU,39)          # device in use                 --
   define (ERLDN,40)          # remote line down              --
   define (EFUIU,41)          # all remote units in use       --
   define (EDNS,42)           # device not started            --
   define (ETMUL,43)          # too many ufd levels           --
   define (EFBST,44)          # fam - bad startup             --
   define (EBSGN,45)          # bad segment number            --
   define (EFIFC,46)          # invalid fam function code     --
   define (ETMRU,47)          # max remote users exceeded     --
   define (ENASS,48)          # device not assigned           --
   define (EBFSV,49)          # bad fam svc                   --
   define (ESEMO,50)          # sem overflow                  --
   define (ENTIM,51)          # no timer                      --
   define (EFABT,52)          # fam abort                     --
   define (EFONC,53)          # fam op not complete           --
   define (ENPHA,54)          # no phantoms available         -
   define (EROOM,55)          # no room                       --
   define (EWTPR,56)          # disk write-protected          jf
   define (EITRE,57)          # illegal treename              fe
   define (EFAMU,58)          # fam in use                    --
   define (ETMUS,59)          # max users exceeded            --
   define (ENCOM,60)          # null_comline                  --
   define (ENFLT,61)          # no_fault_fr                   --
   define (ESTKF,62)          # bad stack format              --
   define (ESTKS,63)          # bad stack on signal           --
   define (ENOON,64)          # no on unit for condition      --
   define (ECRWL,65)          # bad crawlout                  --
   define (ECROV,66)          # stack ovflo during crawlout   --
   define (ECRUN,67)          # crawlout unwind fail          --
   define (ECMND,68)          # bad command format            --
   define (ERCHR,69)          # reserved character            --
   define (ENEXP,70)          # cannot exit to command proc   --
   define (EBARG,71)          # bad command arg               --
   define (ECSOV,72)          # conc stack overflow           --
   define (ENOSG,73)          # segment does not exist        --
   define (ETRCL,74)          # truncated command line        --
   define (ENDMC,75)          # no smlc dmc channels          --
   define (EDNAV,76)          # device not available         dptx
   define (EDATT,77)          # device not attached           --
   define (EBDAT,78)          # bad data                      --
   define (EBLEN,79)          # bad length                    --
   define (EBDEV,80)          # bad device number             --
   define (EQLEX,81)          # queue length exceeded         --
   define (ENBUF,82)          # no buffer space               --
   define (EINWT,83)          # input waiting                 --
   define (ENINP,84)          # no input available            --
   define (EDFD,85)           # device forcibly detached      --
   define (EDNC,86)           # dptx not configured           --
   define (ESICM,87)          # illegal 3270 command          --
   define (ESBCF,88)          # bad 'from' device             --
   define (EVKBL,89)          # kbd locked                    --
   define (EVIA,90)           # invalid aid byte              --
   define (EVICA,91)          # invalid cursor address        --
   define (EVIF,92)           # invalid field                 --
   define (EVFR,93)           # field required                --
   define (EVFP,94)           # field prohibited              --
   define (EVPFC,95)          # protected field check         --
   define (EVNFC,96)          # numeric field check           --
   define (EVPEF,97)          # past end of field             --
   define (EVIRC,98)          # invalid read mod char         --
   define (EIVCM,99)          # invalid command               --
   define (EDNCT,100)         # device not connected          --
   define (EBNWD,101)         # bad no. of words              --
   define (ESGIU,102)         # segment in use                --
   define (ENESG,103)         # not enough segments (vinit$)  --
   define (ESDUP,104)         # duplicate segments (vinit$)   --
   define (EIVWN,105)         # invalid window number         --
   define (EWAIN,106)         # window already initiated      --
   define (ENMVS,107)         # no more vmfa segments         --
   define (ENMTS,108)         # no more temp segments         --
   define (ENDAM,109)         # not a dam file                --
   define (ENOVA,110)         # not open for vmfa             --
   define (ENECS,111)         # not enough contiguous segments
   define (ENRCV,112)         # requires receive enabled      --
   define (EUNRV,113)         # user not receiving now        --
   define (EUBSY,114)         # user busy, please wait        --
   define (EUDEF,115)         # user unable to receive messages
   define (EUADR,116)         # unknown addressee             --
   define (EPRTL,117)         # operation partially blocked   --
   define (ENSUC,118)         # operation unsuccessful        --
   define (ENROB,119)         # no room in output buffer      --
   define (ENETE,120)         # network error encountered     --
   define (ESHDN,121)         # disk has been shut down       fs
   define (EUNOD,122)         # unknown node name (primenet)
   define (ENDAT,123)         # no data found                 --
   define (EENQD,124)         # enqued only                   --
   define (EPHNA,125)         # protocol handler not avail   dptx
   define (EIWST,126)         # e$inwt enabled by config     dptx
   define (EBKFP,127)         # bad key for this protocol    dptx
   define (EBPRH,128)         # bad protocol handler (tat)   dptx
   define (EABTI,129)         # i/o abort in progress        dptx
   define (EILFF,130)         # illegal dptx file format     dptx
   define (ETMED,131)         # too many emulate devices     dptx
   define (EDANC,132)         # dptx already configured      dptx
   define (ENENB,133)         # remote mode not available     npx
   define (ENSLA,134)         # no npx slaves available       ---
   define (EPNTF,135)         # procedure not found          r$call
   define (ESVAL,136)         # slave validation error       r$call
   define (EIEDI,137)         # i/o error or device interrupt (gppi)
   define (EWMST,138)         # warm start happened (gppi)
   define (EDNSK,139)         # a pio instruction didn't skip (gppi)
   define (ERSNU,140)         # remote system not up         r$call
   define (ES18E,141)         # spare codes for rev18
#                             
#    New error codes added for rev 19 begin here:
#                             
   define (ENFQB,142)         # no free quota blocks          --
   define (EMXQB,143)         # maximum quota exceeded        --
   define (ENOQD,144)         # not a quota disk (run vfixrat)
   define (EQEXC,145)         # setting quota below existing usage
   define (EIMFD,146)         # quota not permitted on mfd
   define (ENACL,147)         # not an acl ufd.
   define (EPNAC,148)         # parent not acl ufd
   define (ENTFD,149)         # not a file or directory
   define (EIACL,150)         # entry is an acl
   define (ENCAT,151)         # not an access category
   define (ELRNA,152)         # like reference not available
   define (ECPMF,153)         # category protects mfd
   define (EACBG,154)         # acl too big
   define (EACNF,155)         # access category not found
   define (ELRNF,156)         # like reference not found
   define (EBACL,157)         # bad acl
   define (EBVER,158)         # bad version
   define (ENINF,159)         # no information
   define (ECATF,160)         # access category found (ac$rvt)
   define (EADRF,161)         # acl directory found (ac$rvt)
   define (ENVAL,162)         # validation error (login)
   define (ELOGO,163)         # logout (code for fatal$)      --
   define (ENUTP,164)         # no unit table availabe.(phant$)
   define (EUTAR,165)         # unit table already returned.(utdalc)
   define (EUNIU,166)         # unit table not in use.(rtutbl)
   define (ENFUT,167)         # no free unit table.(gtutbl)
   define (EUAHU,168)         # user already has unit table.(utaloc)
   define (EPANF,169)         # priority acl not found.
   define (EMISA,170)         # missing argument to command.
   define (ESCCM,171)         # system console command only.
   define (EBRPA,172)         # bad remote password          r$call
   define (EDTNS,173)         # date and time not set yet.
   define (ESPND,174)         # remote procedure call still pending
   define (EBCFG,175)         # network configuration mismatch
   define (EBMOD,176)         # illegal access mode (ac$set)
   define (EBID,177)          # illegal identifer   (ac$set)
   define (EST19,178)         # operation illegal on pre-19 disk
   define (ECTPR,179)         # object is category-protected (ac$chg)
   define (EDFPR,180)         # object is default-protected (ac$chg)
   define (EDLPR,181)         # file is delete-protected (fil$dl)
   define (EBLUE,182)         # bad lutbl entry.   f$io
   define (ENDFD,183)         # no driver for device.  f$io
   define (EWFT,184)          # wrong file type  f$io
   define (EFDMM,185)         # format/data mismatch.  f$io
   define (EFER,186)          # bad format.  f$io
   define (EBDV,187)          # bad dope vector.  f$io
   define (EBFOV,188)         # f$io bf overflow.  f$io
   define (ENFAS,189)         # top-level dir not found or inaccessible
   define (EAPND,190)         # asynchronous procedure still pending
   define (EBVCC,191)         # bad virtual circuit clearing
   define (ERESF,192)         # improper access to restricted file
   define (EMNPX,193)         # illegal multiple hoppings in npx
   define (ESYNT,194)         # syntanx error
   define (EUSTR,195)         # unterminated string
   define (EWNS,196)          # wrong number of subscripts
   define (EIREQ,197)         # integer required
   define (EVNG,198)          # variable not in namelist group
   define (ESOR,199)          # subscript out of range
   define (ETMVV,200)         # too many values for variable
   define (EESV,201)          # expected string value
   define (EVABS,202)         # variable array bounds or size
   define (EBCLC,203)         # bad compiler library call
   define (ENSB,204)          # nsb labelled tape was detected
   define (ELAST,204)         # this ***must*** be last       --
