

            publish (1) --- publish a news article                   03/23/82


            _U_s_a_g_e

                 publish <path_name> { <path_name> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Publish'  is the recommended means of publishing an article
                 in the Software Tools Subsystem news service.  The  contents
                 of the files given as arguments (there must be at least one)
                 are  entered  into  the news service archive and sent to all
                 news service subscribers.

                 Each file named is published as a separate news  item.   The
                 first  non-blank line of each file should be the "headline."
                 The headline may be left-justified or centered.   The  head-
                 line  is  placed  in the index entry for an item, along with
                 the time and date of publishing and the item  number.   (The
                 item  number is used for retrieving specific news items; see
                 the help for the 'news' command.)
                 
                 'Publish' deletes  leading  and  trailing  blank  lines  and
                 always  insures  that  there  is  a blank line following the
                 headline.  Because of this, output from the  text  formatter
                 is suitable for publication if it contains no underlining or
                 boldfacing.

                 WARNING:   When news has a large circulation, 'publish' will
                 take a significant amount of time to do  its  job.   DO  NOT
                 interrupt it, or you may prevent some users from obtaining a
                 copy  in  their  news  box.   In the event that 'publish' is
                 interrupted, use "retract -q" to remove the article and then
                 publish it again.


            _E_x_a_m_p_l_e_s

                 publish new_york_times
                 publish first second


            _F_i_l_e_s

                 =news=/articles/art<number> for archived articles
                 =news=/index for article index
                 =news=/delivery/<login_name> for delivery to subscribers
                 =news=/subscribers for the subscription list


            _M_e_s_s_a_g_e_s

                 "<article>:  cannot open"  for  not  being  able  to  access
                      article file.
                 "<article>:   empty  file"  for  trying  to publish an empty
                      file.
                 "Headline too long:  <headline>" for trying to use  a  head-


            publish (1)                   - 1 -                   publish (1)




            publish (1) --- publish a news article                   03/23/82


                      line that will not fit in the index.
                 "can't  open  archive  copy file" for not being able to open
                      =news=/article/art<number>.
                 "cannot make delivery" for not being able to  open  delivery
                      file.
                 "can't  open  index  file"  for not being able to open index
                      file.


            _S_e_e _A_l_s_o

                 news (1), subscribe (1), retract (1)














































            publish (1)                   - 2 -                   publish (1)


