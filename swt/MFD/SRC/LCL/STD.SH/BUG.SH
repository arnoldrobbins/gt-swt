# bug --- prepare a bug report

   declare _search_rule = "^int,^var,=lbin=/&,=bin=/&,=ebin=/&"
   declare seq

   ### create bug report in a temporary file (in case of abort):
   bugfm >=temp=/bug=pid=
   echo @n
   tlit @n "" "Please wait while report is prepared..."

   ### fetch and update report number; copy bug report:
   term -nobreak
   set seq = [bugn -i]
#  cp =temp=/bug=pid= =bug=/r[seq]
   { echo "Bug Number "[seq]; cat =temp=/bug=pid= } >=bug=/r[seq]
   del =temp=/bug=pid=

   ### create environment file:
   echo "Bug Number "[seq]@n >=bug=/s[seq]
   echo "### System status:@n" >>=bug=/s[seq]
   como -nc =bug=/s[seq]; x status all; como
   {  echo "@n@n### Current directory: "[cd -p]"@n"; _
      lf; _
      echo "@n@n### Current variables:"; _
      vars -acgv | show -m _
      } >>=bug=/s[seq]

   echo " Done."
   term -break
