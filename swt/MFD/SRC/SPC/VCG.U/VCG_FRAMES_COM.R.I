# Global variables for stack and link frame management module

   integer Obs, Obstat (MAX_LOCAL_OBJECTS), Next_link
   unsigned Fsize, Obsize (MAX_LOCAL_OBJECTS)

   common /frame_com/ _
      Obs, Obstat, Fsize, Obsize, Next_link
