# build --- recompile all standard stacc programs

   declare _search_rule = "^int,^var,=bin=/&"

   files .stacc$ | change "%{?*}.stacc$" _
      "&> stacc >&.r >&.defs; rp @1.r -g; fc @1.f; ld @1.b" | sh
