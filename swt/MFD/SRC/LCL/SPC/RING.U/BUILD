#  build --- build ring and all support commands

   declare _search_rule = "^int,=bin=/&"

   if [nargs]
      case [arg 1]
         when uniform
            pmac uniform.s

         when ring
            rp -ag ring.r
            fc ring.f
            ld -u ring.b uniform.b =lib=/vnetlb -t -m

         when vrnglb
            rp -o vrnglb.f ring$c.r ring$t.r
            fc vrnglb.f
            >> cto -EOF | x
edb vrnglb.b vrnglb
rfl
c all
sfl
q
-EOF

         when broadcast
            rp -ag broadcast.r
            fc broadcast.f
            ld -u broadcast.b vrnglb =lib=/vnetlb -t -m

         when execute
            rp -ag execute.r
            fc execute.f
            ld -u execute.b vrnglb =lib=/vnetlb -t -m

         when setime
            rp -ag setime.r
            fc setime.f
            ld -u setime.b vrnglb =lib=/vnetlb -t -m

         when terminate
            rp -ag terminate.r
            fc terminate.f
            ld -u terminate.b vrnglb =lib=/vnetlb -t -m

         when commands
            rp -ag (broadcast execute setime terminate).r
            fc (broadcast execute setime terminate).f
            ld -u (broadcast execute setime terminate).b vrnglb =lib=/vnetlb -t -m

         out
            echo "Unknown argument:" [arg 1]
      esac
   else
      rp -ag ring.r
      fc ring.f
      pmac uniform.s
      ld -u ring.b uniform.b =lib=/vnetlb -t -m

      rp -o vrnglb.f ring$c.r ring$t.r
      fc vrnglb.f
      >> cto -EOF | x
edb vrnglb.b vrnglb
rfl
c all
sfl
q
-EOF

      rp -ag (broadcast execute setime terminate).r
      fc (broadcast execute setime terminate).f
      ld -u (broadcast execute setime terminate).b vrnglb =lib=/vnetlb -t -m
   fi
