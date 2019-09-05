# mv --- change name of file1 to file2

   if [cmp [nargs] = 2]
      if [cp [arg 1] [arg 2] 3|.1 cat]
         echo "Can't copy "[arg 1]" to "[arg 2]
      else
         del [arg 1]
      fi
   else
      error "Usage: "[arg 0]" <source> <destination>"
   fi
