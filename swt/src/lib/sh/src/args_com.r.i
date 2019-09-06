# argument storage common areas for shell

   integer   Next_arg,              # next available slot in Arg_table
             Arg_table (2, MAXARGS) # argument storage table

   common /argcom/ Next_arg, Arg_table

# end argument storage common areas for shell
