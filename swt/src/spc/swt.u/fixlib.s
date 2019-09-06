* fixlib --- force PFTNLIB link frame templates to be copied into place

            SUBR  FIXLIB

            SEG
            RLIT

FIXLIB      ECB   FIXLIB0

            DYNM  PTR(2)

FIXLIB0     EAL   DYNT1
            SSM
            ANA   =$9FFF
            STL   PTR
            EAL   PTR,*

            EAL   DYNT2
            SSM
            ANA   =$9FFF
            STL   PTR
            EAL   PTR,*
            PRTN

DYNT1       DATA  5
            BCI   'GCHAR'
DYNT2       DATA  6
            BCI   'SPOOL$'

            END
