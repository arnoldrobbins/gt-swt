# shtrace_cmd --- interpret and set shell trace flags

   subroutine shtrace_cmd

   include CI_COMMON

   integer trace_value, i, l
   integer getarg, strbsr, gctoi
   character arg (MAXARG)

   string_table trace_pos, trace_text _
      /-1,       "all" _
      /CL_TRACE, "cl" _
      /CN_TRACE, "cn" _
      /CL_TRACE, "command_line" _
      /CN_TRACE, "compound_node" _
      /  8r2011, "debug" _          # SS_TRACE|ND_TRACE|EX_TRACE
      /EX_TRACE, "ex" _
      /EX_TRACE, "execution" _
      /FN_TRACE, "fn" _
      /FN_TRACE, "function" _
      /IT_TRACE, "it" _
      /IT_TRACE, "iteration" _
      /LS_TRACE, "linked_strings" _
      /LO_TRACE, "lo" _
      /LO_TRACE, "location" _
      /LS_TRACE, "ls" _
      /ND_TRACE, "nd" _
      /ND_TRACE, "node" _
      /    8r11, "on" _             # ND_TRACE|EX_TRACE
      /OU_TRACE, "ou" _
      /OU_TRACE, "onunit" _
      /PD_TRACE, "pd" _
      /PD_TRACE, "port_descriptor" _
      /SS_TRACE, "single_step" _
      /SR_TRACE, "sr" _
      /SS_TRACE, "ss" _
      /SV_TRACE, "sv" _
      /SR_TRACE, "sv_restore" _
      /SV_TRACE, "sv_save" _
      /SY_TRACE, "sy" _
      /SY_TRACE, "symbol" _
      /       0, "value"            # just print the current value

   trace_value = Ci_trace

   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
      call mapstr (arg, LOWER)
      l = strbsr (trace_pos, trace_text, 1, arg)
      if (l == EOF) {
         l = 1
         trace_value = gctoi (arg, l, 8)
         if (arg (l) ~= EOS)
            call error ("Usage: shtrace {<octal integer> | <option>}"p)
         }
      else
         trace_value |= trace_text (trace_pos (l))
      }

   if (i == 1)    # no args, turn off tracing
      trace_value = 0

   call print (STDOUT, "*,8j*n"s, Ci_trace)
   Ci_trace = trace_value

   stop
   end
