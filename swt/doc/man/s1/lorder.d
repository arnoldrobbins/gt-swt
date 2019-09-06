.hd lorder "order libraries for one-pass loading" 07/18/82
lorder <object_file>
.ds
'Lorder' takes the given object code file and rearranges
the object modules to allow loading in one pass by the
loader.
.es
lorder =lib=/vthlib
lorder mylib
.fl
<object_file>.lib is generated
.me
"Usage: lorder ..." for no object code file arguments
.bu
Does not complain if more than one object code file is
specified, but will only process the first one specified.
.sa
bmerge (5), brefs (5), tsort (1)
