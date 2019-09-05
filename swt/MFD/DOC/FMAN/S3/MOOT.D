

            moot (3) --- teleconference manager                      01/15/83


            _U_s_a_g_e

                 moot [-a <user>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Moot'  is  a  teleconference management program.  It allows
                 users to send messages to one another or to a group of users
                 participating in  a  "conference".   Messages  may  then  be
                 received  automatically  and  reviewed  at will.  Authorized
                 users may create and destroy conferences, add users to  con-
                 ferences,  etc.   'Moot'  is  conversationally  oriented, to
                 reduce learning time.

                 To participate in any of the active teleconferences, type

                           moot

                 'Moot' will then ask you for your name.  Respond  by  typing
                 whatever  variant of your name you prefer, but don't use any
                 semicolons.  We recommend using your calling name  and  your
                 last  name,  to prevent conflicts.  'Moot' will then ask you
                 for a password, which you must cite whenever you reenter the
                 teleconference.  (Note that the password is never printed on
                 the terminal.)

                 If you want to see if a  particular  user  is  currently  in
                 'moot'  without  getting  in  yourself,  you can use the "-a
                 <user>" option to check.

                 'Moot' allows you to abbreviate anything (user  names,  con-
                 ference  names,  commands); simply use initial substrings of
                 each word in the item to be abbreviated.  For  example,  the
                 command  "add  member" can be abbreviated (unambiguously) as
                 "a m", "add m", "a memb", etc.  (However, _d_o _n_o_t  abbreviate
                 your name the first time you enter the teleconference.)

                 If  at  any time you are unsure how to proceed, enter a line
                 consisting only of a question mark; 'moot' will  attempt  to
                 elaborate  on  the  input  it  expects.   Ambiguous  command
                 abbreviations will also provoke further information.

                 Once you have entered the  conference  successfully,  'moot'
                 will prompt you for a command by printing the character ".".
                 You may enter any of the following commands:

                 add conference
                           This  command  is used to create a new conference.
                           'Moot' will  request  a  conference  title  and  a
                           status  (open  or closed, presently ignored), then
                           prompt for the names  of  files  to  be  used  for
                           storage  of  the  conference.  The file names sup-
                           plied should be full pathnames, with passwords  as
                           necessary.



            moot (3)                      - 1 -                      moot (3)




            moot (3) --- teleconference manager                      01/15/83


                 delete conference
                           This  command  will  delete  a  named  conference,
                           including all of its text storage files.

                 add member
                           Membership in a closed conference  (currently  the
                           only  type  supported) is by invitation only.  The
                           "add member" command allows a 'moot' user to  join
                           a   particular   conference,   either  as  a  full
                           participant  or  just  an  observer  (without  the
                           ability to submit messages to the conference).

                 delete member
                           This  command  removes a member from a closed con-
                           ference.

                 list conferences
                           This command lists  the  names  of  all  currently
                           active conferences.

                 list users
                           This  command  lists  the names and times-of-last-
                           entry for all teleconference users.

                 list members
                           This command lists, for each member of the current
                           conference (see "join"), the number  of  the  last
                           entry seen, the time of last entry, and the status
                           (observer or participant).

                 enter
                           When  a user wishes to send a note to another user
                           or to the members of a conference, he  must  first
                           enter  the  text to be sent.  This command prompts
                           for    a    subject    heading,    cross-reference
                           information,  and  finally  for  the  text itself.
                           Text  entry  continues  until  the  user  types  a
                           control-c   (the  standard  Subsystem  end-of-file
                           signal).  The text so  entered  fills  the  user's
                           text  buffer,  which  may  be sent to another user
                           with the "mail" command or  submitted  to  a  con-
                           ference with the "submit" command.

                 edit
                           This  command  invokes  the  Subsystem line editor
                           'ed', allowing the user to edit the  text  in  his
                           'moot'  text  buffer or to read in text previously
                           prepared  and  placed  on  a   file.    (See   the
                           _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r for
                           a tutorial on the use of 'ed'.  'Ed's commands are
                           a  subset  of the screen editor's.)  Note that the
                           first two lines of the text  buffer  are  used  to
                           store the subject and cross-reference information.
                           Also  note  that  to save changes made to the text
                           buffer, you must issue a 'w' command before  leav-
                           ing edit mode with the 'q' command.


            moot (3)                      - 2 -                      moot (3)




            moot (3) --- teleconference manager                      01/15/83


                 join
                           When  a  user wishes to review information from or
                           send information to the other members  of  a  con-
                           ference, he must "join" that conference.  When the
                           "join" command prompts for a conference name, sim-
                           ply  type the name of the conference to be joined.
                           If no conference name is specified,  the  user  is
                           returned  to  command level (where he may send and
                           review personal notes to other users).

                 review
                           The "review" command allows the user to re-examine
                           messages sent by  other  participants  in  a  con-
                           ference.    The   messages   to  be  reviewed  are
                           specified by typing a message number  (e.g.   "4")
                           or  a  range  of  message  numbers (e.g.  "1-999")
                           "Review" uses the Subsystem library routine 'page'
                           to display the message text.   In  practice,  this
                           means that the display will be formatted for a CRT
                           screen,  with output stopping after each screenful
                           of information.  The user is then prompted  for  a
                           command.   The  most  commonly  used  commands are
                           carriage return (to advance  to  the  next  page),
                           -<pages>  (to  back  up  a given number of pages),
                           +<pages> (to advance a given number of pages), and
                           q (to quit displaying information).   For  a  full
                           description of acceptable commands, see the 'help'
                           entry for 'pg' or 'page'.

                 index
                           The  "index" command allows the user to get a list
                           of messages and a brief description of  the  topic
                           of  each message.  The user must be currently in a
                           conference for this command to work.  The messages
                           are listed with their sequence number  within  the
                           conference,  name  of  the  sender, subject of the
                           message, and date of submittal to the  conference.
                           The  message  list is formatted for the CRT screen
                           similar to the output of "review";  the  Subsystem
                           routine  'page'  is  used  to  display  the list a
                           screenful at a time.

                 submit
                           "Submit" takes the contents  of  the  user's  text
                           buffer (created by "enter text") and submits it to
                           the  current  conference.   The text buffer is not
                           altered, so multiple "submits" may be used to send
                           messages  repeatedly  (say,  to   different   con-
                           ferences).

                 authorize
                           This   command   allows   a  user  to  change  the
                           operations that another  user  may  perform.   The
                           operations  are  listed, one at a time, along with
                           the current value (Y or N  for  yes  or  no);  the
                           correct  response  is  "y" to enable an operation,


            moot (3)                      - 3 -                      moot (3)




            moot (3) --- teleconference manager                      01/15/83


                           "n" to disable it, "d" to set it  to  the  default
                           value,  or  simply  carriage  return  to  leave it
                           unchanged.

                 status
                           The  "status"  command  lists  the  names  of  all
                           currently  logged-in  'moot' users and the name of
                           the current conference, if one has been joined.

                 mail
                           The "mail" command allows the  user  to  send  the
                           contents  of  his  text  buffer  as a private com-
                           munication to another user.   The  addressee  will
                           receive the letter automatically; he may review it
                           later with the "letter" command.

                 letter
                           This command is used to review personal notes sent
                           by  the  "mail" command.  The index numbers of the
                           notes to be reviewed are  specified  in  the  same
                           manner  as  those  for  the "review" command.  The
                           notes on output  pagination  under  "review"  also
                           apply to "letter."

                 quit
                           When  the  "quit"  command  is issued, the user is
                           logged out from 'moot' and returned  to  the  Sub-
                           system.

                 In general, multiple inputs may be typed ahead by separating
                 them  with  semicolons.   However,  the first parameter of a
                 command must not be separated from the command; for example,
                 you should type "join <conference>" or "review  <entry>"  or
                 "mail <user>" without separators.


            _E_x_a_m_p_l_e_s

                 moot
                 Please enter your name: George Burdell
                 Please enter your password:
                 Welcome to the Moot.
                 .enter
                 Subject: bogus messages
                 Xref: none
                 Text:
                 This is an entirely bogus message.
                 <control-c>
                 .mail
                 Addressee: a a
                 .list conferences
                 Empirical Metaphysics
                 .join empirical metaphysics
                 .review 1-1729
                 (volumes of stuff would appear here)
                 .q


            moot (3)                      - 4 -                      moot (3)




            moot (3) --- teleconference manager                      01/15/83


            _F_i_l_e_s

                 Everything in =extra=/moot.u


            _M_e_s_s_a_g_e_s

                 Too many to document at the moment.


            _B_u_g_s

                 Null  inputs  match  anything,  since  the null string is an
          |      initial substring of every string.

          |      There is no way to alter a user's name or password.

                 'Moot' uses  semaphore  1  for  mutual  exclusion;  if  this
                 semaphore is messed up, 'moot' will fail in fairly unpredic-
          |      table ways.

                 When  'moot'  fails,  it tends to prevent the user from sub-
          |      sequently logging in.

          |      Inputting a  TAB  character  tends  to  hang  'moot'  in  an
          |      infinite loop with breaks disabled, thus preventing the user
          |      from stopping the loop.


            _S_e_e _A_l_s_o

                 sema (1)


























            moot (3)                      - 5 -                      moot (3)


