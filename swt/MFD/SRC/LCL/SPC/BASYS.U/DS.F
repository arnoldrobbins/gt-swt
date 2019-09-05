      INTEGER FUNCTION ALLOC(W)
      INTEGER W
      INTEGER MEM(1)
      COMMON /DSMEM$/MEM
      INTEGER P,Q,L
      INTEGER N,K
      INTEGER C
      N=W+2
      Q=2
10000   P=MEM(Q+0)
        IF((P.NE.0))GOTO 10001
          CALL REMARK('in alloc: out of storage space.')
          CALL REMARK('type ''c'' or ''i'' for char or integer dump.')
          CALL GETCH(C,-14)
          IF(((C.NE.227).AND.(C.NE.195)))GOTO 10002
            CALL DSDUMP(225)
            GOTO 10003
10002       IF(((C.NE.233).AND.(C.NE.201)))GOTO 10004
              CALL DSDUMP(176)
10004     CONTINUE
10003     CALL ERROR('program terminated.')
10001   IF((MEM(P+1).LT.N))GOTO 10005
          GOTO 10006
10005   Q=P
      GOTO 10000
10006 K=MEM(P+1)-N
      IF((K.GE.8))GOTO 10007
        MEM(Q+0)=MEM(P+0)
        L=P
        GOTO 10008
10007   MEM(P+1)=K
        L=P+K
        MEM(L+1)=N
10008 ALLOC=L+2
      RETURN
      END
      SUBROUTINE FREE(BLOCK)
      INTEGER BLOCK
      INTEGER MEM(1)
      COMMON /DSMEM$/MEM
      INTEGER P0,P,Q
      INTEGER N
      P0=BLOCK-2
      N=MEM(P0+1)
      Q=2
10009   P=MEM(Q+0)
        IF(((P.NE.0).AND.(P.LE.P0)))GOTO 10010
          GOTO 10011
10010   Q=P
      GOTO 10009
10011 IF(((P0+N.NE.P).OR.(P.EQ.0)))GOTO 10012
        N=N+MEM(P+1)
        MEM(P0+0)=MEM(P+0)
        GOTO 10013
10012   MEM(P0+0)=P
10013 IF((Q+MEM(Q+1).NE.P0))GOTO 10014
        MEM(Q+1)=MEM(Q+1)+N
        MEM(Q+0)=MEM(P0+0)
        GOTO 10015
10014   MEM(Q+0)=P0
        MEM(P0+1)=N
10015 RETURN
      END
      SUBROUTINE DSDUMP(FORM)
      INTEGER FORM
      INTEGER MEM(1)
      COMMON /DSMEM$/MEM
      INTEGER P,T,Q
      T=2
      CALL PRINT(-15,'** DYNAMIC STORAGE DUMP ***n.')
      CALL PRINT(-15,'*5i   *i words in use*n.',1,2+1)
      P=MEM(T+0)
10016 IF((P.EQ.0))GOTO 10017
        CALL PRINT(-15,'*5i   *i words available*n.',P,MEM(P+1))
        Q=P+MEM(P+1)
10018   IF(((Q.EQ.MEM(P+0)).OR.(Q.GE.MEM(1))))GOTO 10019
          CALL DSDBIU(Q,FORM)
        GOTO 10018
10019   P=MEM(P+0)
      GOTO 10016
10017 CALL PRINT(-15,'** END DUMP ***n.')
      RETURN
      END
      SUBROUTINE DSDBIU(B,FORM)
      INTEGER B
      INTEGER FORM
      INTEGER MEM(1)
      COMMON /DSMEM$/MEM
      INTEGER L,S,LMAX
      CALL PRINT(-15,'*5i   *i words in use*n.',B,MEM(B+1))
      L=0
      S=B+MEM(B+1)
      IF((FORM.NE.176))GOTO 10020
        LMAX=5
        GOTO 10021
10020   LMAX=50
10021 B=B+2
      GOTO 10024
10022 B=B+1
10024 IF((B.GE.S))GOTO 10023
        IF((L.NE.0))GOTO 10025
          CALL PRINT(-15,'          .')
10025   IF((FORM.NE.176))GOTO 10026
          CALL PRINT(-15,' *10i.',MEM(B))
          GOTO 10027
10026     IF((FORM.NE.225))GOTO 10028
            CALL PRINT(-15,'*c.',MEM(B))
10028   CONTINUE
10027   L=L+1
        IF((L.LT.LMAX))GOTO 10029
          L=0
          CALL PRINT(-15,'*n.')
10029 GOTO 10022
10023 IF((L.EQ.0))GOTO 10030
        CALL PRINT(-15,'*n.')
10030 RETURN
      END
      SUBROUTINE DSINIT(W)
      INTEGER W
      INTEGER MEM(1)
      COMMON /DSMEM$/MEM
      INTEGER T
      IF((W.GE.2*2+2))GOTO 10031
        CALL ERROR('in dsinit: unreasonably small memory size.')
10031 T=2
      MEM(T+1)=0
      MEM(T+0)=2+2
      T=2+2
      MEM(T+1)=W-2-1
      MEM(T+0)=0
      MEM(1)=W
      RETURN
      END
C ---- Long Name Map ----
