# Global variables for memory management module

   ipointer Nexti
   tpointer Nextt
   spointer Nexts
   integer Omem (MAX_OBJ_MEMORY)
   opointer Ofree, Onext

   common /mem_com/ Nexti, Nextt, Nexts, Omem, Ofree, Onext

   # many memory arrays are global to the entire program...
