# label storage common areas for shell

   integer   Next_label,                  # next available slot in table
             Label_table (3, MAX_LABELS)  # symbol table for all labels

   common /labcom/ Next_label, Label_table

# end label storage common areas for shell
