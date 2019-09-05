# invoke_int --- invoke an internal command

   include INTCMD_DEFINES

   integer function invoke_int (icmd, subclass)
   character icmd (ARB), subclass (ARB)

# Rules for internal commands:
#
#  1. A 'define'd symbol consisting of the command name (in
#     upper case) followed by "_CMD" should be added to the
#     internal command definitions, and the replacement value
#     should be chosen to be one greater than the last previously
#     used value.
#  2. The 'define'd symbol, the internal command subclass character,
#     and the associated command name (in lower case) should be
#     added to the string table at the appropriate position such
#     that the command names remain in ascending alphabetical
#     order.
#  3. A 'when' alternative should be added to the 'select'
#     statement to invoke the subroutine that implements
#     the internal command.
#  4. The command may reference arguments and standard input
#     and output.  It should not change the status of the
#     shell's private common blocks.

   include SWT_COMMON

   character cmd (MAXLINE)
   integer i, status
   integer state (MAXFILESTATE)
   integer strbsr, index
   floating rtn, oldrtn

   shortcall mkonu$ (18)
   external onany$
   equivalence (rtn, Rtlabel)

   string_table position, command _
      /ARG_CMD,            'a'c,    "arg" _
      /ARGS_CMD,           'a'c,    "args" _
      /ARGSTO_CMD,         'a'c,    "argsto" _
      /CASE_CMD,           'c'c,    "case" _
      /CD_CMD,             'd'c,    "cd" _
      /DATE_CMD,           'h'c,    "date" _
      /DAY_CMD,            'h'c,    "day" _
      /DBG_CMD,            'x'c,    "dbg" _
      /DECLARE_CMD,        'v'c,    "declare" _
      /DECLARED_CMD,       'v'c,    "declared" _
      /DROP_CMD,           'm'c,    "drop" _
      /DUMP_CMD,           'b'c,    "dump" _
      /ECHO_CMD,           'h'c,    "echo" _
      /ELIF_CMD,           'c'c,    "elif" _
      /ELSE_CMD,           'c'c,    "else" _
      /ESAC_CMD,           'c'c,    "esac" _
      /EVAL_CMD,           'h'c,    "eval" _
      /EXIT_CMD,           'c'c,    "exit" _
      /FI_CMD,             'c'c,    "fi" _
      /FORGET_CMD,         's'c,    "forget" _
      /GOTO_CMD,           'c'c,    "goto" _
      /HIST_CMD,           'h'c,    "hist" _
      /IF_CMD,             'c'c,    "if" _
      /INDEX_CMD,          'm'c,    "index" _
      /INSTALLATION_CMD,   'h'c,    "installation" _
      /LABEL_CMD,          'c'c,    "label" _
      /LINE_CMD,           'h'c,    "line" _
      /LOGIN_NAME_CMD,     'h'c,    "login_name" _
      /NARGS_CMD,          'a'c,    "nargs" _
      /OUT_CMD,            'c'c,    "out" _
      /PRIMOS_CMD,         'x'c,    "primos" _
      /QUOTE_CMD,          'a'c,    "quote" _
      /REPEAT_CMD,         'c'c,    "repeat" _
      /SET_CMD,            's'c,    "set" _
      /SH_CMD,             's'c,    "sh" _
      /SHTRACE_CMD,        'b'c,    "shtrace" _
      /STOP_CMD,           'q'c,    "stop" _
      /SUBSTR_CMD,         'm'c,    "substr" _
      /TAKE_CMD,           'm'c,    "take" _
      /THEN_CMD,           'c'c,    "then" _
      /TIME_CMD,           'h'c,    "time" _
      /UNTIL_CMD,          'c'c,    "until" _
      /VARS_CMD,           'v'c,    "vars" _
      /VPSD_CMD,           'x'c,    "vpsd" _
      /WHEN_CMD,           'c'c,    "when" _
      /X_CMD,              'x'c,    "x"

   call ctoc (icmd, cmd, MAXLINE)     # copy to avoid changing argument
   call mapstr (cmd, LOWER)

   i = strbsr (position, command, 2, cmd)
   if (i == EOF)
      return (EOF)
   if (subclass (1) == '/'c           # check the command subclass
         && index (subclass (2), command (position (i) + 1)) ~= 0)
      return (EOF)

   status = OK

   call break$ (DISABLE)
   if (Cmdstat ~= 0) {
      call break$ (ENABLE)
      return (ERR)
      }
   call iofl$ (state)      # mark file descriptors
   oldrtn = rtn            # save current Rtlabel value locally
   call mklb$f ($1, Rt_label)
   call mkonu$ ("ANY$"v, loc (onany$))
   call break$ (ENABLE)

   select (command (position (i)))
      when (ARG_CMD)          call arg_cmd
      when (ARGS_CMD)         call args_cmd
      when (ARGSTO_CMD)       call argsto_cmd
      when (CASE_CMD)         call case_cmd
      when (CD_CMD)           call cd_cmd
      when (DATE_CMD)         call date_cmd
      when (DAY_CMD)          call day_cmd
      when (DBG_CMD)          call dbg_cmd
      when (DECLARE_CMD)      call declare_cmd
      when (DECLARED_CMD)     call declared_cmd
      when (DROP_CMD)         call drop_cmd
      when (DUMP_CMD)         call dump_cmd
      when (ECHO_CMD)         call echo_cmd
      when (ELIF_CMD)         call else_cmd
      when (ELSE_CMD)         call else_cmd
      when (ESAC_CMD)         ;
      when (EVAL_CMD)         call eval_cmd
      when (EXIT_CMD)         call exit_cmd
      when (FI_CMD)           ;
      when (FORGET_CMD)       call forget_cmd
      when (GOTO_CMD)         call goto_cmd
      when (HIST_CMD)         call hist_cmd
      when (IF_CMD)           call if_cmd
      when (INDEX_CMD)        call index_cmd
      when (INSTALLATION_CMD) call installation_cmd
      when (LABEL_CMD)        ;
      when (LINE_CMD)         call line_cmd
      when (LOGIN_NAME_CMD)   call login_name_cmd
      when (NARGS_CMD)        call nargs_cmd
      when (OUT_CMD)          call out_cmd
      when (PRIMOS_CMD)       call primos_cmd
      when (QUOTE_CMD)        call quote_cmd
      when (REPEAT_CMD)       call repeat_cmd
      when (SET_CMD)          call set_cmd
      when (SH_CMD)           call sh_cmd
      when (SHTRACE_CMD)      call shtrace_cmd
      when (STOP_CMD)         call stop_cmd
      when (SUBSTR_CMD)       call substr_cmd
      when (TAKE_CMD)         call take_cmd
      when (THEN_CMD)         ;
      when (TIME_CMD)         call time_cmd
      when (UNTIL_CMD)        ;
      when (VARS_CMD)         call vars_cmd
      when (VPSD_CMD)         call vpsd_cmd
      when (WHEN_CMD)         call when_cmd
      when (X_CMD)            call x_cmd
   else {
      call remark ("no subroutine for internal command!!"p)
      status = ERR
      }
1;
   call break$ (DISABLE)
   call rvonu$ ("ANY$"v)
   rtn = oldrtn   # restore previous contents of Rt_label
   call cof$ (state)     # close files opened by the command
   call break$ (ENABLE)

   if (command (position (i)) == STOP_CMD)
      stop

   return (status)
   end
