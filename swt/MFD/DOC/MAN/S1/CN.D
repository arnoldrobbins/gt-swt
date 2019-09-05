.hd cn "change file names" 03/20/80
cn <pathname> <new name> { <pathname> <new name> }
.ds
'Cn' changes the names of the files named as arguments. Arguments
must be paired; the first argument in a pair is the pathname
of the file whose name is to be changed, the second argument in
the pair is the new name to be given to the file.
The new name must be a simple file name, not a pathname. Thus, 'cn'
may not be used to move files from one directory to another.
Use 'cp' for this purpose.
.es
cn //cmdnc0/new_go go
cn old new   first last   always never
.me
.in +5
.ti -5
"<pathname>: missing name" if <new name> is missing
.ti -5
"<pathname>: bad pathname" if <pathname> could not be followed
.ti -5
"Usage: cn old new {old new}" for no arguments
.ti -5
"<new name>: already exists" for duplicate file name
.ti -5
"<pathname>: not found" for non-existent file name.
.ti -5
"<new name>: cannot move file to new directory" for an
unescaped slash in the new name.
.in -5
.sa
cp (1), Primos cname$
