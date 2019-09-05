# build --- recompile all standard stacc programs

   declare _search_rule = "^int,=bin=/&,=lbin=/&,^var"

   files .stacc$ | change "%{?*}.stacc$" _
      "&> stacc >&.r >&.defs; rp @1.r; fc @1.f; ld @1.b" | sh
