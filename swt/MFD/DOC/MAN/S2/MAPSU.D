.hd mapsu "map standard unit to file descriptor" 03/23/80
file_des function mapsu (std_unit)
file_des std_unit
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mapsu' is used to map standard units (such as STDIN, STDOUT, and ERROUT)
to the file descriptor associated with the file to which they are currently
equivalent.  It is not intended for general use.
.im
'Mapsu' checks the file unit mapping information contained in the
Subsystem I/O common area.
If the parameter 'std_unit' is one of the following:
.sp
.nf
      STDIN       STDOUT
      STDIN1      STDOUT1
      STDIN2      STDOUT2
      STDIN3      STDOUT3
      ERRIN       ERROUT
.sp
.fi
then the function return is the file descriptor
corresponding to these standard units; otherwise, the function return is
the same as the value of 'std_unit'.
.sp
Note that if the standard port mapping table contains a circular
definition, the file descriptor of the user's terminal will be
returned.
