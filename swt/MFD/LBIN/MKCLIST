# mkclist --- make command list for the backstop process

   declare _search_rule = "^int,=bin=/&,=lbin=/&,&"

   case [arg 1]

      when -s
         lf -c =bin= =lbin= |MERGE _
         files .r$ =src=/lib/sh/src/intcmd.u | change _cmd.r$ |MERGE _
         :MERGE cat -1 -2 | sort | uniq | =ebin=/mkcl -s

      when
         lf -c =ubin= =bin= =lbin= |MERGE _
         files .r$ =src=/lib/sh/src/intcmd.u | change _cmd.r$ |MERGE _
         :MERGE cat -1 -2 | sort | uniq | =ebin=/mkcl

      out
         error "Usage: "[arg 0]" [-s]"
   esac
