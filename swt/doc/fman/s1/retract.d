

            retract (1) --- retract a news article                   08/17/82


            _U_s_a_g_e

                 retract [ -q ] { <article number> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Retract'  is the recommended means of retracting an article
                 from  the  Software  Tools  Subsystem  news  service.    The
                 articles  mentioned  by number as arguments are removed from
                 the news index, news archive, and news delivery  files.   If
                 the  article  has  been  read  by  a subscriber, a notice of
                 retraction is placed in his newsbox; otherwise, no notice of
                 the retraction is published.

                 Under normal circumstances, one never need  retract  a  news
                 story.  'Retract' exists to remedy the all-too-frequent cir-
                 cumstance  of  an  erroneous news article.  By retracting an
                 incorrect article and re-publishing a correct  version,  the
                 news  archive is less cluttered and those users who have not
                 read their news never know of the retraction.

                 When called with the "-q" option, 'retract'  does  not  tell
                 subscribers  who  have  read  an  article  that  it has been
                 retracted.  This "quiet" option is often useful for removing
                 all traces of an outdated article  without  bothering  users
                 who have read it.

                 WARNING:   When news has a large circulation, 'retract' will
                 take a significant amount of time to do  its  job.   DO  NOT
                 interrupt  it,  or  you  may  leave  an  article  in a half-
                 retracted state.  In the  event  'retract'  is  interrupted,
                 just  retract  the  article  again  --  the only problem (in
                 almost all cases) will be that  some  users  are  given  two
                 retraction notices.


            _E_x_a_m_p_l_e_s

                 retract -q 12
                 retract 299 233


            _F_i_l_e_s

                 =news=/articles/art<number> for archived articles
                 =news=/index for article index
                 =news=/delivery/<login_name> for delivery to subscribers
                 =news=/subscribers for the subscription list


            _M_e_s_s_a_g_e_s

                 "<article>:   not  an  article  number"  for  a  non-numeric
                      article number.
                 "<article>:  can't retract" for an unwritable delivery file.


            retract (1)                   - 1 -                   retract (1)




            retract (1) --- retract a news article                   08/17/82


                 "<article>:  not found" for trying to retract a non-existant
                      article.
                 "<article>:  not your article" for trying to retract someone
                      else's article.
                 "can't open index file" for not being  able  to  open  index
                      file.
                 "can't  open  subscribers  list"  for not being able to open
                      subscriber file.
                 "Usage:  retract ..."  for incorrect arguments.


            _S_e_e _A_l_s_o

                 news (1), subscribe (1), publish (1)












































            retract (1)                   - 2 -                   retract (1)


