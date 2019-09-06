

            rdextr (1) --- extract relation data from a relation     02/22/82


            _U_s_a_g_e

                 rdextr


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdextr'  is  part  of  toy  relational data base management
                 system 'rdb'.  It converts a relation  to  a  standard  text
                 file using a format file.  Standard input 1 must be directed
                 to  a file containing an 'rdb' relation and standard input 2
                 must be directed to a file containing a description  of  the
                 desired  output  format  (see  below).  The relation data is
                 output on standard output as a text file.

                 The output format file is very similar in structure  to  the
                 input  format file used by 'rdmake'.  The only difference is
                 that the data type of the relation domain is not included in
                 the output format.  Each line  of  the  output  format  file
                 controls  the  the conversion of one domain of the relation.
                 The domains are output in the order  listed  in  the  format
                 file;  domains  may  be omitted or duplicated by omitting or
                 duplicating lines in the output format file.

                 Each line of the file has the following format:

                       <domain name>  [ d[<delimiter>] ]  [ l<length> ]

                 <Domain name> must be the name of a domain in the  relation;
                 <delimiter>  is  a  single  character delimiter; <length> is
                 non-negative integer.  When a field is output,  it  is  con-
                 verted  to  character form and blank padded so that it takes
                 no less than <length>  characters  (if  "l<length>"  is  not
                 specified,  <length> is assumed to be zero).  The characters
                 are placed in the output followed by the delimiter character
                 (if "d<delimiter>" is not specified, <delimiter> is  assumed
                 to  be  a  blank;  if "d" with no delimiter is specified, no
                 delimiter is output).  For the last  domain  in  the  format
                 file,  <delimiter> is always assumed to be a NEWLINE charac-
                 ter.  For example,

                       pno d,
                       pname d l20
                       city d$ l10

                 In the first line, "pno" is output with  no  blank  padding,
                 followed  by a comma.  In the second line, "pname" is output
                 with blank  padding  to  20  characters  with  no  delimiter
                 (assuming "pname" was described as "s20" in the relation, 20
                 characters would always be output for "pname").  In the last
                 line,  "city"  is output with blank padding to 10 characters
                 and then followed by a newline character.






            rdextr (1)                    - 1 -                    rdextr (1)




            rdextr (1) --- extract relation data from a relation     02/22/82


            _E_x_a_m_p_l_e_s

                 y.rel> y.fmt> rdextr >y.data
                 p.rel> p.fmt> rdextr | field ...
                 ... rdsort | rduniq | x.fmt> rdextr >x.data


            _M_e_s_s_a_g_e_s

                 "Cannot access input relation"
                 "<domain>:  domain not found"
                 "Illegal output length"
                 "Unrecognized word"
                 "Sorry, a relation can't be read from the terminal"
                 "Relation is corrupted!!"


            _S_e_e _A_l_s_o

                 dtoc (2), ltoc (2),  rdcat  (1),  rdextr  (1),  rdjoin  (1),
                 rdmake  (1), rdprint (1), rdproj (1), rdsel (1), rdsort (1),
                 rduniq (1)




































            rdextr (1)                    - 2 -                    rdextr (1)


