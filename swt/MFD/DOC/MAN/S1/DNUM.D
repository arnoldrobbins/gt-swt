.hd dnum "generate or interpret legal disk numbers" 03/20/80
dnum [<disk_number>]
.ds
If given a disk number as an argument, 'dnum' will print a
short description of the corresponding disk partition
(controller type, number of heads, first head number, etc.).
If the argument is missing, 'dnum' will prompt the user for
the required information and generate the corresponding disk
number.
.es
dnum 21060
Controller 4004 storage module disk
   controller 0, unit 0
   first head: 4, number of heads: 4
.me
Many; 'dnum' is interactive.
.bu
When given a cartridge module disk number as an argument, 'dnum'
always considers it a storage module and gives incorrect
results for the fixed surfaces.
