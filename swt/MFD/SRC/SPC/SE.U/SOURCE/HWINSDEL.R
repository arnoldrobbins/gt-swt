# hwinsdel --- tell if terminal has hardware insert/delete functions

   integer function hwinsdel (dummy)
   integer dummy

   include SE_COMMON

   select (Term_type)
      when (VI200, H19, Z19, TS1, SBEE, HP2621, HP2626, HP2648,
            HP9845, PT45, PST100, VIEWPT90, ADM42)
         return (YES)
      when (ADDS100, ADDS980, TVI)
         if (Tspeed >= 2400)
            return (NO)
         else
            return (YES)
   else
      return (NO)

   end
