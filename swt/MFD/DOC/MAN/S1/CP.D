[cc]mc |
.hd cp "generalized file copier" 08/30/84
[cc]mc
cp [-m] [-p] [-s [<depth>] ] <from> [ <to> ]
.ds
'Cp' copies files or directories from one place in the file system
to another.  The single required argument '<from>' specifies the source
file or directory.  The '<to>' argument, which is optional, may be used
to specify the destination file or directory.  Omitting this argument
produces the same effect as specifying the pathname of the current
working directory.  The precise result of any invocation of 'cp'
depends on whether or not the destination is an existing directory
and, in the case where the source is a directory, whether the "m"
and/or "s" options is specified.  For a more detailed explanation of
the semantics of the "s" option, see the Reference Manual entries for
the 'chat', 'del' and 'lf' commands.
The various cases are elaborated below.
.sp
If the destination is an existing directory,
[cc]mc |
the source is normally copied [ul into]
[cc]mc
that directory, retaining its original name.
If the source is also a directory, its contents may be
merged into the destination directory by specifying the "m"
option.
Otherwise, the source directory will be copied
as a subdirectory of the destination directory.
.sp
If the destination is not an existing directory,
the destination file is exactly as specified by
the '<to>' pathname.
.sp
If the "p" option is specified, any directories created in the
process of copying are given the same passwords as their counterparts
in the source.  If the option is not specified, these directories
are given default passwords. (At installations running the Ga. Tech
version of Primos, the defaults are the user's login name for the
owner password and zeroes for the non-owner password; at installations
running standard Primos, the defaults are blanks for the owner password
and zeroes for the non-owner password.)
.sp
In all cases, the protection, date-modified and read/write lock
attributes of the copied files are set identically to those of
their source counterparts.
.es
cp file //dir/file
cp file //dir
cp file
cp file1 file2
cp old_dir new_dir
cp -p old_dir new_dir
.fl
None.
.me
.in +5
.ti -5
"Usage: cp ..." for illegal argument syntax.
.ti -5
"<source>: can't open" if source file can't be opened for reading.
.ti -5
"<destination>: can't create" if destination can't be created.
.ti -5
"<source>: copy incomplete" if an error occurred while moving the
contents of the source file to the destination.
.ti -5
"<destination>: non-empty directory" when the source is an ordinary
file and the destination is a non-empty directory.
.in -5
.bu
Works only on disk files.
[cc]mc |
.sp
Cannot copy specific ACL's or access categories
[cc]mc
.sa
cat (1), chat (1), cn (1), copy (1), del (1), lf (1)
