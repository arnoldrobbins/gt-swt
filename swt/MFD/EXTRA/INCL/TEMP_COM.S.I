* temp_com.s.i --- Software Tools Subsystem Template Common Area
*                       Version 9

*     Each element of Hashtb is a pointer to a list of
*     (template, replacement) pairs.  
*
*     Each pair of templates in Tempbuf is of the following
*     format:
*           Tempbuf (p + 0)            pointer to next template
*           Tempbuf (p + 1)            pointer to replacement value
*           Tempbuf (p + 2)            template (EOS-terminated string)
*           Tempbuf (Tempbuf (p + 1))  replacement (EOS-terminated string)

SWT$TP      COMM     TEMPTOP,;
                     HASHTB(MAXTEMPHASH),;
                     TEMPBUF(MAXTEMPBUF),;
                     CLDATAPTR(2)
