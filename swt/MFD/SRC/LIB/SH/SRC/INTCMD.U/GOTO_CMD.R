# goto_cmd --- conditional statement for ci files

   subroutine goto_cmd

   include CI_COMMON

   pointer net
   integer getarg, get_net_label, equal
   character label (MAXLINE), net_label (MAXLINE)

   if (getarg (1, label, MAXLINE) == EOF)
      call error ("Usage: goto <label>"p)

   if (Ci_fd (Ci_file) ~= TTY) {    # back up shell files
      call lsfree (Ci_buf (Ci_file), ALL)
      Ci_buf (Ci_file) = 0          # clobber current line
      call rewind (Ci_fd (Ci_file))
      }

   while (get_net_label (net_label, net) ~= EOF)
      if (net_label (1) ~= EOS && equal (label, net_label (2)) ~= NO) {
         call put_back_command (net)
         stop
         }
      else
         call lsfree (net, ALL)

   call error ("goto could not find target label"p)
   end



# get_net_label --- retrieve next net (and its first label, if any)

   integer function get_net_label (net_label, net)
   character net_label (ARB)
   pointer net

   pointer netrover
   integer status
   integer get_cl

   get_net_label = get_cl (net)
   if (get_net_label == EOF) {
      net_label (1) = EOS
      return
      }

   call eval_netsep (net, status)

   netrover = net
   call get_next_token (netrover, net_label)
   if (net_label (1) ~= ':'c)
      net_label (1) = EOS        # retain only the labels

   return
   end
