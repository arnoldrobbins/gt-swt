


subroutine expression (gpst)
integer gpst
include 'hp_com.r.i'
integer state
repeat {
   call constant (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == NOMATCH) {
      call command (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (char == NEWLINE) {
      state = ACCEPT
      }
   if (state == NOMATCH) {
      if (char == EOS) {
         state = ACCEPT
         }
      else {
         call print (ERROUT, "*c: unrecognized command*n.",
            char)
         }
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine constant (gpst)
integer gpst
include 'hp_com.r.i'
integer state
floating ctod
while (char == ' 'c)
   call getchar
state = NOMATCH
if (char == '.'c) {
   state = ACCEPT
   call push (ctod (line, scanptr))
   scanptr -= 1
   call getchar
   }
if (state == NOMATCH) {
   if ('0'c <= char && char <= '9'c) {
      state = ACCEPT
      call push (ctod (line, scanptr))
      scanptr -= 1
      call getchar
      }
   }
gpst = state
return
end



subroutine command (gpst)
integer gpst
include 'hp_com.r.i'
integer state
integer i
logical sound
while (char == ' 'c)
   call getchar
state = NOMATCH
if (char == 'p'c) {
   state = ACCEPT
   if (sound (1))
      call print (STDOUT, "*d*n.", stack (sp))
   call getchar
   }
if (state == NOMATCH) {
   if (char == 'P'c) {
      state = ACCEPT
      for (i = 1; i <= sp; i += 1)
         call print (STDOUT, "*d*n.", stack (i))
      call getchar
      }
   if (state == NOMATCH) {
      if (char == '+'c) {
         state = ACCEPT
         if (sound (2)) {
            stack (sp - 1) += stack (sp)
            sp -= 1
            }
         call getchar
         }
      if (state == NOMATCH) {
         if (char == '-'c) {
            state = ACCEPT
            if (sound (2)) {
               stack (sp - 1) -= stack (sp)
               sp -= 1
               }
            call getchar
            }
         if (state == NOMATCH) {
            if (char == '*'c) {
               state = ACCEPT
               if (sound (2)) {
                  stack (sp - 1) *= stack (sp)
                  sp -= 1
                  }
               call getchar
               }
            if (state == NOMATCH) {
               if (char == '/'c) {
                  state = ACCEPT
                  if (sound (2)) {
                     stack (sp - 1) /= stack (sp)
                     sp -= 1
                     }
                  call getchar
                  }
               if (state == NOMATCH) {
                  if (char == '^'c) {
                     state = ACCEPT
                     if (sound (2)) {
                        stack (sp - 1) = stack (sp - 1) ** stack (sp)
                        sp -= 1
                        }
                     call getchar
                     }
                  if (state == NOMATCH) {
                     if (char == 'd'c) {
                        state = ACCEPT
                        if (sound (1))
                           sp -= 1
                        call getchar
                        }
                     if (state == NOMATCH) {
                        if (char == 'D'c) {
                           state = ACCEPT
                           sp = 0
                           call getchar
                           }
                        if (state == NOMATCH) {
                           if (char == '<'c) {
                              state = ACCEPT
                              if (sound (2)) {
                                 if (stack (sp - 1) < stack (sp))
                                    stack (sp - 1) = 1.0
                                 else
                                    stack (sp - 1) = 0.0
                                 sp -= 1
                                 }
                              call getchar
                              }
                           if (state == NOMATCH) {
                              if (char == '='c) {
                                state = ACCEPT
                                if (sound (2)) {
                                   if (stack (sp - 1) == stack (sp))
                                      stack (sp - 1) = 1.0
                                   else
                                      stack (sp - 1) = 0
                                   sp -= 1
                                   }
                                call getchar
                                }
                              if (state == NOMATCH) {
                                if (char == '>'c) {
                                state = ACCEPT
                                if (sound (2)) {
                                   if (stack (sp - 1) > stack (sp))
                                      stack (sp - 1) = 1.0
                                   else
                                      stack (sp - 1) = 0
                                   sp -= 1
                                   }
                                call getchar
                                }
                                if (state == NOMATCH) {
                                if (char == '&'c) {
                                state = ACCEPT
                                if (sound (2)) {
                                   if (stack (sp - 1) ~= 0 & stack (sp) ~= 0)
                                      stack (sp - 1) = 1.0
                                   else
                                      stack (sp - 1) = 0.0
                                   sp -= 1
                                   }
                                call getchar
                                }
                                if (state == NOMATCH) {
                                if (char == '|'c) {
                                state = ACCEPT
                                if (sound (2)) {
                                   if (stack (sp - 1) ~= 0 | stack (sp) ~= 0)
                                      stack (sp - 1) = 1.0
                                   else
                                      stack (sp - 1) = 0.0
                                   sp -= 1
                                   }
                                call getchar
                                }
                                if (state == NOMATCH) {
                                if (char == '~'c) {
                                state = ACCEPT
                                if (sound (1))
                                   if (stack (sp) ~= 0)
                                      stack (sp) = 0
                                   else
                                      stack (sp) = 1.0
                                call getchar
                                }
                                }
                                }
                                }
                                }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end
