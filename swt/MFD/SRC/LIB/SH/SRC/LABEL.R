# enter_label --- place label and its value in Label_table and Opd

   integer function enter_label (lab, value)
   character lab (ARB)
   integer value

   include LABEL_COMMON

   integer l
   integer find_label, create_label

   l = find_label (lab)
   if (l == EOF) {   # not yet defined or referenced
      l = create_label (lab)
      if (l == ERR)  # no more room
         return (l)
      Label_table (LB_NODE, l) = value
      }
   elif (Label_table (LB_NODE, l) ~= UNDEFINED) {
      call synerr ("multiply defined label"p)
      return (ERR)
      }
   else {
      Label_table (LB_NODE, l) = value
      call fwd_ref (l)     # satisfy any forward references
      }

   return (OK)

   end



# lookup_label --- find label in Label_table, place its value in Opd

   integer function lookup_label (lab)
   character lab (ARB)

   include LABEL_COMMON
   include PORT_COMMON
   include PARSE_COMMON

   integer l, oport
   integer find_label, create_label

   oport = Next_oport (Curnode) - 1

   l = find_label (lab)
   if (l == EOF) {   # label not yet defined or referenced
      l = create_label (lab)
      if (l == ERR)
         return (l)
      Label_table (LB_NODE, l) = UNDEFINED
      Label_table (LB_LINK, l) = ls (Curnode, 8) + oport # see 'fwd_ref'
      Opd (PD_DEST, oport, Curnode) = LAMBDA    # end forward ref chain
      }
   elif (Label_table (LB_NODE, l) == UNDEFINED) {  # add a forward ref
      Opd (PD_DEST, oport, Curnode) = Label_table (LB_LINK, l)
      Label_table (LB_LINK, l) = ls (Curnode, 8) + oport # see 'fwd_ref'
      }
   else     # label already defined
      Opd (PD_DEST, oport, Curnode) = Label_table (LB_NODE, l)

   return (OK)

   end



# find_label --- look up a label in Label_table

   integer function find_label (lab)
   character lab (ARB)

   include LABEL_COMMON

   integer i
   character lscmpk

   for (i = 1; i < Next_label; i += 1)
      if (lscmpk (Label_table (LB_TEXTPTR, i), lab) == '='c)
         return (i)

   return (EOF)

   end



# create_label --- enter a label into Label_table

   integer function create_label (lab)
   character lab (ARB)

   include LABEL_COMMON

   integer i
   pointer l
   pointer lsmake

   i = Next_label
   if (i > MAX_LABELS) {
      call synerr ("too many labels"p)
      return (ERR)
      }
   Next_label += 1
   if (lsmake (l, lab) == ERR)
      return (ERR)
   Label_table (LB_TEXTPTR, i) = l

   return (i)

   end



# fwd_ref --- resolve forward references to a label

   subroutine fwd_ref (l)
   integer l

   include PORT_COMMON
   include LABEL_COMMON

   integer node, port, value, link

   value = Label_table (LB_NODE, l)
   link = Label_table (LB_LINK, l)

   while (link ~= LAMBDA) {
      node = rs (link, 8)          # see 'lookup_label'
      port = rt (link, 8)          # see 'lookup_label'
      link = Opd (PD_DEST, port, node)
      Opd (PD_DEST, port, node) = value
      }

   return
   end



# init_labels --- initialize label symbol table

   subroutine init_labels

   include LABEL_COMMON

   Next_label = 1

   return
   end



# clr_labels --- release linked strings in Label_table

   subroutine clr_labels

   include LABEL_COMMON

   for (Next_label -= 1; Next_label > 0; Next_label -= 1)
      call lsfree (Label_table (LB_TEXTPTR, Next_label), ALL)

   Next_label = 1

   return
   end



# check_labels --- check for undefined labels

   integer function check_labels (status)
   integer status

   include LABEL_COMMON

   integer i
   character lab (MAXLINE)

   status = OK
   for (i = 1; i < Next_label; i += 1)
      if (Label_table (LB_NODE, i) == UNDEFINED) {
         status = ERR
         call lsextr (Label_table (LB_TEXTPTR, i), lab, MAXLINE)
         call print (TTY, "*s: undefined label*n"p, lab)
         }

   return (status)

   end
