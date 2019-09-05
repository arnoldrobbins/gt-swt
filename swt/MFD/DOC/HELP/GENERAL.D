




            Software Tools Subsystem

            You are using the Software Tools Subsystem, developed as a human-
            engineered alternative to Primos.

            Commands are of the form:

                 command parameter ...

            where  "command" is the name of a program, and "parameter" is any
            string of characters.  Each individual command defines the syntax
            of any parameters it may allow or require.

            Program names are specified by 'pathnames', which describe  paths
            through  directories  and  subdirectories  to  particular  files.
            Pathnames have the form:

                 /packname/directory:password/.../file

            where most components are optional.  Examples:

                 //src/std.r
                 /system_pack/lib:secret/ftnlib
                 myprog
                 subdir/myfile

            Complete information on pathnames and other aspects of  the  file
            system  may  be  found  in  the  _U_s_e_r_'_s  _G_u_i_d_e _t_o _t_h_e _P_r_i_m_o_s _F_i_l_e
            _S_y_s_t_e_m.  You can read this guide by typing the command:

                 guide fs

            A copy will be printed, one page at a time, on your terminal.

            Similarly, you can get quick information  about  any  command  by
            using the 'help' command; simply type:

                 help command_name

            and  information on the specified command will be printed on your
            terminal.  Typing "help" alone produces this documentation.   For
            an  index of the standard commands and library subprograms with a
            brief description of each, type:

                 help -i

            For a description of  the  meta-language  used  to  describe  the
            syntax of commands, type:

                 help -g bnf

            'Help'   prints   out   a   page   at   a   time  and  then  asks
            "<name> [<number>+] more ? ", where <name> is the  name  of  your
            request  to 'help' and <number> is the number of the pageful that
            'help' has printed to you for that request.  If you want  to  see
            another  screenful,  simply  type a carriage return.  If you lose










            interest in what 'help' is telling you, type "n"  followed  by  a
            carriage return.

            When you are ready to end your terminal session, simply type

                 bye

            after the "]" prompt and wait for the LOGOUT message to appear.





















































