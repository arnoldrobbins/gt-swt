# rddiv --- divide input relation 1 by input relation 2

   include "rdb_def.r.i"

   define (DB,#)

   relation_des Rrd (RDSIZE), Srd (RDSIZE), Trd (RDSIZE)
   file_des Rfd, Sfd, Tfd
   integer ap, i, j, pos2, bp, rstat, comp
   integer Rkeys (MAXKEYS), Skeys (MAXKEYS)
   integer Rrow (RDATASIZE), Srow (RDATASIZE), Trow (RDATASIZE)
   integer x (RDATASIZE), y (RDATASIZE), z (RDATASIZE)
   integer dest (MAXLINE), garbage (MAXLINE)
   integer load_rd, isatty, add_field_to_rd, create
   integer find_field, get_row, compare_row, rewind
   character orders (MAXKEYS)

  ### Load the descriptors for the original relations

   if (load_rd (Rrd, STDIN) ~= OK)
      call error ("Cannot load input relation 1"p)

   if (load_rd (Srd, STDIN2) ~= OK)
      call error ("Cannot load input relation 2"p)

  ### Create the difference relation descriptor in Trd
  ### Trd = Rrd - Srd
  ### Also, set up the list of keys for sorting R

   init_rd (Trd)
   ap = 0
   for (i = FIRSTRF (Rrd); ISLASTRF (Rrd, i); i = NEXTRF (Rrd, i)) {

      j = find_field (Srd, RFNAME (Rrd,i))
      if (j == 0) { # if the field is in Rrd but not Srd put it in Trd
         pos2 = add_field_to_rd (Trd, RFTYPE (Rrd, i), RFLEN (Rrd, i),
            RFNAME (Rrd, i))
         ap = ap+1
         Rkeys (ap) = i
         orders (ap) = "a"c
      }
   }

  ### set up the list of keys for sorting S

   bp = 0
   for (i = FIRSTRF (Srd) ; ISLASTRF (Srd, i) ; i = NEXTRF(Srd, i)) {

      j = find_field (Rrd, RFNAME (Srd,i) )
      if (j == 0)
         call error ("Relation 2 has domain not defined in relation 1"p)
      else {
         bp = bp+1
         orders (bp) = "a"c
         Skeys (bp) = i
         ap = ap+1
         orders (ap) = "a"c
         Rkeys (ap) = j
      }
   }
   bp = bp+1
   Skeys (bp) = 0
   ap = ap+1
   Rkeys (ap) = 0

   ### sort the two input relations

   Rfd = create ("temp1"s,READWRITE)
   if (Rfd == ERR)  {
      call cant ("temp1"s)
      stop
   }
   Sfd = create ("temp2"s,READWRITE)
   if (Sfd == ERR)  {
      call cant ("temp2"s)
      stop
   }
   call sort (Rrd, Rkeys, orders, STDIN, Rfd)
   call sort (Srd, Skeys, orders, STDIN2, Sfd)

  ### Do the division operation and put out the new relation

   call save_rd (Trd, STDOUT)

   if (isatty (STDOUT) == YES)
      call print_header (Trd, STDOUT)

   if (rewind (Rfd) ~= OK) {
      call print (STDOUT, "Couldn't rewind R*n"s)
      stop
   }
   if (rewind (Sfd) ~= OK) {
      call print (STDOUT, "Couldn't rewind S*n"s)
      stop
   }

   i = get_row (Srd, Sfd, Srow)
   if (i == ERR) {
      call print (STDOUT, "Error on S*n"s)
      stop
   }

   for ( i = 1; i <= MAXLINE; i += 1)
      garbage ( i) = 0

   if (i == EOF) {

      # the divisor is null; output all rows in the dividend

      while ( get_row (Rrd, Rfd, Rrow) ~= EOF) {

         # project Rrow onto Trd
         for ( i = FIRSTRF (Rrd); ISLASTRF (Rrd, i);
                                    i = NEXTRF (Rrd, i)) {
            j = find_field ( Trd, RFNAME (Rrd, i))
            if ( j ~= 0) {
               call get_data (Rrd, i, Rrow, dest)
               call put_data (Trd, j, Trow, dest)
            } # end if
         } # end for

         call put_row (Trd, STDOUT, Trow)
      } # end while
   } # end if

   else {

      # the divisor is not null

      for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i); i = NEXTRF ( Trd, i))
         call put_data (Trd, i, x, garbage)

      rstat = get_row (Rrd, Rfd, Rrow)

      while (rstat ~= EOF) {

         # project Rrow onto Trd
         for ( i = FIRSTRF (Rrd); ISLASTRF (Rrd, i); i = NEXTRF (Rrd, i)) {
            j = find_field ( Trd, RFNAME (Rrd, i))
            if ( j ~= 0) {
               call get_data (Rrd, i, Rrow, dest)
               call put_data (Trd, j, y, dest)
            } # end if
         } # end for


         if ( compare_row (Trd, x, y) ~= 2) {
            # copy y to x
            for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i);
                                       i = NEXTRF (Trd, i)) {
               call get_data (Trd, i, y, dest)
               call put_data (Trd, i, x, dest)
            } # end for
            if (rewind(Sfd) ~= OK) {
               call print (STDOUT, "Couldn't rewind S*n"s)
               stop
            }
            i = get_row (Srd, Sfd, Srow)
            if (i == ERR) {
               call print (STDOUT, "Error on S*n"s)
               stop
            }
         } # end if

         # project Rrow onto Srd
         for ( i = FIRSTRF (Rrd); ISLASTRF (Rrd, i);
                                          i = NEXTRF (Rrd, i)) {
            j = find_field ( Srd, RFNAME (Rrd, i))
            if ( j ~= 0) {
               call get_data (Rrd, i, Rrow, dest)
               call put_data (Srd, j, z, dest)
            } # end if
         } # end for

         comp = compare_row ( Srd, z, Srow)
         select
            when (comp == 1) {
               rstat = get_row (Rrd, Rfd, Rrow)

            } # end when
            when (comp == 2) {
               if (get_row (Srd, Sfd, Srow) == EOF) {
                  call put_row (Trd, STDOUT, x)
                  if (rewind (Sfd) ~= OK) {
                     call print (STDOUT, "Couldn't rewind S*n"s)
                     stop
                  }
                  if (get_row (Srd, Sfd, Srow) == EOF) {
                     call print (STDOUT, "S looks empty*n"s)
                     stop
                  }

                  for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i);
                                          i = NEXTRF (Trd, i)) {
                     call get_data (Trd, i, x, dest)
                     call put_data (Trd, i, y, dest)
                  } # end for
                  while ( compare_row (Trd, x, y) == 2) {
                     rstat = get_row (Rrd, Rfd, Rrow)

                     if (rstat ~= EOF)  {

                        # project Rrow onto Trd
                        for ( i = FIRSTRF (Rrd); ISLASTRF (Rrd, i);
                                                i = NEXTRF (Rrd, i)) {
                           j = find_field ( Trd, RFNAME (Rrd, i))
                           if ( j ~= 0) {
                              call get_data (Rrd, i, Rrow, dest)
                              call put_data (Trd, j, y, dest)
                           } # end if (j ~= 0)
                        } # end for

                     }
                     else  # rstat == EOF
                        for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i);
                                                   i = NEXTRF ( Trd, i))
                           call put_data (Trd, i, y, garbage)
                  } # end while
               } # end if (get_row (Srd, Sfd, Srow) == EOF)
               else
                  rstat = get_row (Rrd, Rfd, Rrow)

            } # end when (comp == 2)
            when (comp == 3) {
               for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i);
                                       i = NEXTRF (Trd, i)) {
                  call get_data (Trd, i, x, dest)
                  call put_data (Trd, i, y, dest)
               } # end for
               while (compare_row (Trd, x, y) == 2) {
                  rstat = get_row (Rrd, Rfd, Rrow)
                  if (rstat ~= EOF) {

                     # project Rrow onto Trd
                     for ( i = FIRSTRF (Rrd); ISLASTRF (Rrd, i);
                                             i = NEXTRF (Rrd, i)) {
                        j = find_field ( Trd, RFNAME (Rrd, i))
                        if ( j ~= 0) {
                           call get_data (Rrd, i, Rrow, dest)
                           call put_data (Trd, j, y, dest)
                        } # end if
                     } # end for
                  } # end if

                  else {
                     for ( i = FIRSTRF (Trd); ISLASTRF (Trd, i); 2
                                 i = NEXTRF ( Trd, i))
                        call put_data (Trd, i, y, garbage)
                  } # end else

               } # end while
            } # end when
            ifany
               ;
            else
               ;
      } # end while (rstat ~= EOF)
   } # end else

   if (isatty (STDOUT) == YES)
      call print_trailer (Trd, STDOUT)

   call close (Rfd)
   call close (Sfd)

   stop

   end

   include "rdb_sort.r.i"
   include "rdb_sub.r.i"
