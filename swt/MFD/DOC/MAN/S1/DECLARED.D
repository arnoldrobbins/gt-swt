.hd declared "test for declared variables" 02/22/82
declared <variable_name> [<level_offset>]
.ds
'Declared'
tests for the existence of
a shell variable named
<variable_name>.  If the variable
exists, 'declared' prints "1";   otherwise it prints
"0".
.sp
If <level_offset> is omitted, 'declared' examines all
lexic levels for <variable_name>.  Otherwise, only
the level specified (<current_level> - <level_offset>)
is searched.
(See 'arg' for a more complete discussion of the <level_offset>
mechanism.)
.es
if [declared se_params]
   se_params
else
   echo ""
fi
.sa
vars (1), arg (1), set (1), forget (1), save (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
