# temp_com.r.i --- Software Tools Subsystem Template Common Area

#                       Version 9

#     Each element of Hashtb is a pointer to a list of
#     (template, replacement) pairs.  
#
#     Each pair of templates in Tempbuf is of the following
#     format:
#           Tempbuf (p + 0)            pointer to next template
#           Tempbuf (p + 1)            pointer to replacement value
#           Tempbuf (p + 2)            template (EOS-terminated string)
#           Tempbuf (Tempbuf (p + 1))  replacement (EOS-terminated string)

   integer Hashtb (MAXTEMPHASH), Temptop, Cldata_ptr (2)
   character Tempbuf (MAXTEMPBUF)

   common /swt$tp/ Temptop, Hashtb, Tempbuf, Cldata_ptr
