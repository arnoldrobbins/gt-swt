

            sema (1) --- manipulate user semaphores                  08/27/84


          | _U_s_a_g_e

          |      sema -(w | n | t | d | c) {<semaphore>}
          |      sema -o {<pathname>} [-i <integer>]
                    <semaphore> ::= integer


            _D_e_s_c_r_i_p_t_i_o_n

          |      'Sema'  gives  access  to Prime's user semaphores, which are
          |      available to all users.  There is  no  mechanism  to  assure
          |      that  semaphores are used properly (i.e.  - preventing dead-
          |      lock or race conditions).

          |      'Sema' performs the function indicated by its  argument,  on
          |      the  semaphore  number  or  pathname  given.   When multiple
          |      semaphores or pathnames are supplied, the operation given is
          |      performed on each argument in the order listed on  the  com-
          |      mand line.  The functions available are:

          |      -w   (wait)  increment  the  semaphore's  counter.   If  the
          |           resulting value is positive, enqueue on the semaphore's
                      waiting list and block execution (sleep) until awakened
                      by some other process.

          |      -n   (notify) decrement  the  counter.   If  the  result  is
          |           positive  or  zero,  dequeue a process from the waiting
                      list and wake it up.

          |      -t   (test) print the value of the counter (in  decimal)  on
                      standard output.

          |      -d   (drain)  initialize  a  semaphore  for  use.   Set  the
          |           counter to zero, dequeue all waiting processes and wake
                      them up.

          |      -o   (open)  initialize   a   semaphore   for   use.    This
          |           initializes  named  semaphores  for use and returns the
          |           semaphore numbers on standard output.  A  semaphore  is
          |           opened only if the user has read access to the pathname
          |           given  and  if  the  pathname is on the current system.
          |           One semaphore is opened for  each  pathname  specified.
          |           All  semaphores  opened  on  the  same pathname are the
          |           same.  This allows the user to restrict access  to  the
          |           semaphores  by  restricting  access access to the files
          |           used to open the semaphores.  This may be achieved with
          |           access control lists or  passworded  directories.   The
          |           numbered  semaphores  (1-64) are considered always open
          |           and any attempt to open one of them will result  in  an
          |           error.

          |      -i   (initialize)  when  used  with  the  "-o" (open) option
          |           causes the semaphores that are opened to be initialized
          |           to the value specified.  This initialization only takes
          |           place the first time the semaphore is opened.  If  mul-
          |           tiple  users  have  opened a semaphore, only first time


            sema (1)                      - 1 -                      sema (1)




            sema (1) --- manipulate user semaphores                  08/27/84


          |           cause  the  initialization  to   take   place.    Since
          |           initializing  a  semaphore to a positive value does not
          |           make sense, only non-positive values are  allowed.   If
          |           this option is omitted, the default is 0.

          |      -c   (close)  close  a  named  semaphore.   This removes the
          |           user's number from the list of  current  users  of  the
                      semaphore  and  makes  the  semaphore  unavailable  for
          |           further  use  for  that  user.   Since   the   numbered
          |           semaphores are always open, any attempt to close one of
          |           them will result in an error.


            _E_x_a_m_p_l_e_s

          |      sema -w 1
          |      sema -n 1 2 3
          |      sema -t [iota 62]
          |      sema -d -32
          |      set sema_number = [sema -o //system/restricted_file -i -1]
          |      sema -c [sema_number]


            _M_e_s_s_a_g_e_s

                 "Usage:  sema ..."  for nonsensical arguments.
          |      "no  available  semaphores"  when  all  named semaphores are
          |           allocated.
          |      "<pathname>:  invalid semaphore  name"  when  the  semaphore
          |           used has not been opened.
          |      "<pathname>:   semaphore overflow" when another notify would
          |           exceed the limit on the semaphore.
          |      "<pathname>:  on a remote disk" when the pathname is not  on
          |           the current system.
          |      "<pathname>:   file  not found" when the file used to open a
          |           semaphore cannot be read.
          |      "<pathname>:  can't open semaphore" when some unknown reason
          |           causes an error.
          |      "<integer>:  initial value greater than 0" when  an  initial
          |           value is specified that is greater than 0.


            _S_e_e _A_l_s_o

          |      _P_r_i_m_e_'_s  _S_u_b_r_o_u_t_i_n_e_s _R_e_f_e_r_e_n_c_e _G_u_i_d_e (_D_O_C_3_6_2_1_-_1_9_0_P), section
          |      21, for a complete description of semaphores as  implemented
          |      in  Primos and for a description of the system calls used by
          |      'sema'.

                 Peter Freeman:  _S_o_f_t_w_a_r_e _S_y_s_t_e_m_s _P_r_i_n_c_i_p_l_e_s, for  a  discus-
                 sion of how semaphores of this type can be used.







            sema (1)                      - 2 -                      sema (1)


