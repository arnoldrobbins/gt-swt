# sep --- seperate compilation of a source module
#
#         Usage: sep <prog> {<module>}
#                              (<module> may be "" for main program)
#                           -all
#                           -print <other files>
#                           -link
#                           -cat
#                           -stacc
#                           -xref
#                           -names
#                           -mklink
#         Names must conform to the following conventions:
#              main program      <prog>.r
#              Stacc parser      <prog>_stacc.r   (optional)
#              definitions       <prog>_def.i
#              linkage file      <prog>_link.i
#              modules           <prog>_<module>.r
#              'ld' options      <prog>.ldopts    (optional)
#              'ld' procedure    <prog>.ldproc    (optional)
#              'rp' options      <prog>.rpopts    (optional)
#              'fc' options      <prog>.fcopts    (optional)

   declare _search_rule = "^int,=bin=/&,=lbin=/&,^var,&"

   if [arg 1]
   else
      error "Usage:  sep <prog> {<module>}"
   fi

   declare pn = [arg 1]
   case [arg 2]

      when -print
         { _
            echo [pn](_def.i _link.i .r); _
            if [file [pn]_com.i]; _
               echo [pn]_com.i; _
            fi; _
            if [file [pn]_com.r.i]; _
               echo [pn]_com.r.i; _
            fi; _
            lf -c | find %[pn]_?*.r$ _
            } | change "_stacc.r$" ".stacc" | _
               sort | uniq | pr -n / [args 3]
         exit        # don't link!!

      when -cat
         { _
            echo [pn](_def.i _link.i .r); _
            if [file [pn]_com.i]; _
               echo [pn]_com.i; _
            fi; _
            if [file [pn]_com.r.i]; _
               echo [pn]_com.r.i; _
            fi; _
            lf -c | find %[pn]_?*.r$ _
            } | change "_stacc.r$" ".stacc" | _
               sort | uniq | cat -s -n
         exit        # don't link!!

      when -xref
         { _
            echo [pn](_def.i _link.i .r); _
            if [file [pn]_com.i]; _
               echo [pn]_com.i; _
            fi; _
            if [file [pn]_com.r.i]; _
               echo [pn]_com.r.i; _
            fi; _
            lf -c | find %[pn]_?*.r$ _
            } | change "_stacc.r$" ".stacc" | _
               sort | uniq | xref -n
         exit

      when -names
         { _
            echo [pn](_def.i _link.i .r); _
            if [file [pn]_com.i]; _
               echo [pn]_com.i; _
            fi; _
            if [file [pn]_com.r.i]; _
               echo [pn]_com.r.i; _
            fi; _
            lf -c | find %[pn]_?*.r$ _
            } | change "_stacc.r$" ".stacc" | _
               sort | uniq
         exit

      when -stacc
         [pn].stacc> stacc >[pn]_stacc.r >[pn]_def.stacc.i
         exit

      when -link
         # don't do anything

      when -all
         if [file [pn].stacc]
            [pn].stacc> stacc >[pn]_stacc.r >[pn]_def.stacc.i
         fi
         { _
            rp -o ([args]).f [pn]_link.i [pn]_def.i ([args]).r _
                  [cat -s [pn].rpopts]; _
            fc ([args]).f [cat -s [pn].fcopts] _
            }  [  echo [pn]; _
                  lf -c | find %[pn]_?*.r$ | change .r$  _
                  ]

      when -mklink
         if [file [pn].stacc]
            [pn].stacc> stacc >[pn]_stacc.r >[pn]_def.stacc.i
         fi
         lf -c | find %[pn]_?*.r$ | link [pn]_def.i [pn].r -n >[pn]_link.i
         exit

      out
         { _
            rp -o ([args]).f [pn]_link.i [pn]_def.i ([args]).r _
                     [cat -s [pn].rpopts]; _
            fc ([args]).f [cat -s [pn].fcopts] _
            }  [  args 2 99 1 | change .r$ | change % [pn]_ | _
                  change %[pn]_$ [pn]  _
                  ]
   esac

   if [file [pn].ldproc]
      [pn].ldproc
   else
      ld -u [pn].b [lf -c | find %[pn]_?*.b$] -o [pn] [cat -s [pn].ldopts]
   fi
