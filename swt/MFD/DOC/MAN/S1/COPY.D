.hd copy "copy standard input to standard output" 02/22/82
copy
.ds
'Copy' is Kernighan and Plauger's copy command from chapter two
of [ul Software Tools].  It simply copies its standard input to its standard
output until end-of-file.
.es
file1> copy >file2
list_file> copy
copy >data
copy
.sa
cat (1), cp (1), print (1), fcopy (2)
