.hd mv "move a file from one place to another" 01/15/83
mv <source> <destination>
.ds
'Mv' moves a file from one location or name to another,
by copying it and then deleting the original.
The deletion action is not performed if the copy was not
successful; the copy is left untouched if the deletion
could not be performed.
.es
mv //my/file //your/file
mv old current
.me
"Usage: mv ..." for improper command syntax.
.br
"Can't copy ..." if the copy operation was unsuccessful.
.bu
'Mv' can not move whole directories, use 'cp' with the "-s" option.
.sa
cp (1), del (1), if (1)
