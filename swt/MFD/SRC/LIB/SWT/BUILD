# build --- build Subsystem support library

   declare _search_rule = "^int,=bin=/&,&,^var"

  ### Update the source archives from file in src:
   build_archive
   del -s obj

  ### Compile all the Ratfor routines:
#   ar -t src.a | find .r$ | ar -p src.a -n | _
#   rp -ag def.r.i rsrc.r -o rsrc.f
#   fc -d0oq rsrc.f
   ar -t src.a | find .r$ | slice -i "%" -x "%parscl.r$" | _
      {cat def.r.i; ar -p src.a -n} | rp -ag >rsrc.f
   ar -t src.a | find .r$ | slice -i "%parscl.r$" -x "z$" | _
      {cat def.r.i; ar -p src.a -n} | rp -ag >>rsrc.f
   fc -d0oq rsrc.f

  ### Assemble all the PMA routines:
   ar -t src.a | find .s$ | ar -p src.a -n | include >ssrc.s
   pmac ssrc.s

  ### Create DYNTs for Primos entries not in Fortran library:
   build_dynts

  ### Construct the library files from existing binaries:
   build_unshared
   build_shared
