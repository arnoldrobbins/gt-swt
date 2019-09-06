# sh_cmd --- recursively invoke the shell

   subroutine sh_cmd

   integer shell
   filedes mapsu

   if (shell (mapsu (STDIN)) == ERR)
      call seterr (1000)

   stop
   end
