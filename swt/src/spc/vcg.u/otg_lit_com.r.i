# Global variables for otg memory management module

   integer Lmem (MAX_LIT_MEMORY)
   lpointer Lfree, Lnext

   common /litcom/ Lmem, Lfree, Lnext
