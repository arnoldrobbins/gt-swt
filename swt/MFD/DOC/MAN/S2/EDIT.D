[cc]mc |
.hd edit "invoke the line-oriented text editor" 06/26/84
[cc]mc
subroutine edit (filename, fdin, fdout)
character filename (ARB)
file_des fdin, fdout
.sp
Library:  vedtlb (Subsystem text editor library)
.fs
'Edit' accesses the Subsystem line-oriented text editor.
When called, 'edit' begins an editing session, reading
editing commands from the file specified by "fdin" and writing
editing output on the file specified by "fdout".  If "filename"
is other than an empty string, 'edit' reads the file into the
edit buffer before accepting editing commands.
[cc]mc |
.sp
Since the editor can now call the shell, the shared shell library,
'vshlib', must be loaded along with the editor library 'vedtlb'
for any program that calls 'edit'.
.sp
'Edit' arranges to catch the 'LOGOUT$' condition.  When a LOGOUT$
occurs, 'edit' saves the current contents of the edit buffer in
the file =home=/<prog>.logout, where <prog> is the name of the
program using 'edit'.  For example, 'ed' would have the buffer
saved in =home=/ed.logout, while 'moot' would have its buffer
saved in =home=/moot.logout.
.sp
[cc]mc
For complete information on editing commands, see
.ul
Introduction to the Software Tools Text Editor
.im
'Edit' is the top-level routine for the Subsystem line
editor.
