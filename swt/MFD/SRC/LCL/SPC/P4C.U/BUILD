# build --- create new version of Pascal boostrap 'p4c' in =lbin=

   declare _search_rule = "^int,^var,=lbin=/&,=bin=/&"

   declare KIND = unshared    # to build a shared version,
#  declare KIND = shared      # set KIND = shared

# Convert Pascal code to Fortran:
# (This step takes a very long time.)
# cat p4c1.p p4c2.p p4c3.p p4c4.p | p4c >p4c.l >p4c.f

# Compile the resulting Fortran:
   fc p4c.f

   case [KIND]

     # Load the compiler using SEG
      when unshared
         ld -ud _
            -c 4000 _
            -s "s/sy mp          4000 700" _
            -s "s/sy sp          4000 701" _
            -s "s/sy ep          4000 702" _
            -s "s/sy np          4000 703" _
            -s "s/sy cstore      4004 0" _
            p4c.b _
            -l p4clib _
            -t -m _
            -o p4c

      when shared
        # Use 'swtseg' to produce run file and two shared code files:
         >> cto | change SEGMENT [cat segment] | x
edb p4c.b
brief
omitet
open p4c_rest.b
copy main
top
open p4c_main.b
omitet
find main
c all
quit
open p4c.m 15 2
open       15 10
swtseg
vload #p4c
s/sy mp          4000 700
s/sy sp          4000 701
s/sy ep          4000 702
s/sy np          4000 703
s/sy cstore      4001 0
s/sy swt$cm      4040 40000
s/sy swt$tp      2030 120000
co ab 4000
mixup on
s/lo p4c_main.b    0 4000 4000
s/lo p4c_rest.b    0 SEGMENT 4000
s/li p4clib        0 SEGMENT 4000
s/li vswtlb        0 SEGMENT 4000
s/li               0 SEGMENT 4000
ma 3
ma $f 3
ma $f 7
ma $f
save
return
share
pc
delete
quit
-EOF

         cn pc4000 p4c
         del p4c_main.b p4c_rest.b

      out
         error "KIND must be either 'shared' or 'unshared'!"
   esac
