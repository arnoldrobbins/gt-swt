# decode_mnemonic --- decode a terminal-type mnemonic

   integer function decode_mnemonic (str)
   character str (ARB)

   integer i
   integer strbsr

   # WARNING:  Strings in the following table MUST be sorted ascending:
   string_table spos, stab,
      /  ADM31,           "adm31"    _
      /  ADM3A,           "adm3a"    _
      /  ADM42,           "adm42"    _
      /  ADM5,            "adm5"     _
      /  ANP,             "anp"      _
      /  B150,            "b150"     _
      /  B200,            "b200"     _
      /  BANTAM,          "bantam"   _
      /  BEE2,            "bee2"     _
      /  CG,              "cg"       _
      /  ADDS980,         "consul"   _
      /  FORSYS,          "forsys"   _
      /  FOX,             "fox"      _
      /  GT40,            "gt40"     _
      /  H19,             "h19"      _
      /  HP2621,          "hp2621"   _
      /  HP2626,          "hp2626"   _
      /  HP2648,          "hp2648"   _
      /  HP9845,          "hp9845"   _
      /  HZ1420,          "hz1420"   _
      /  HZ1421,          "hz1421"   _
      /  HZ1510,          "hz1510"   _
      /  IBM,             "ibm"      _
      /  INFO,            "info"     _
      /  ISC8001,         "isc"      _
      /  MICROB,          "microb"   _
      /  NBY,             "nby"      _
      /  NETRON,          "netron"   _
      /  PST100,          "pst100"   _
      /  PT45,            "pt45"     _
      /  ADDS100,         "regent"   _
      /  SBEE,            "sbee"     _
      /  SOL,             "sol"      _
      /  TERAK,           "terak"    _
      /  TRS80,           "trs80"    _
      /  TS1,             "ts1"      _
      /  TVI,             "tvi"      _
      /  TVT,             "tvt"      _
      /  VC4404,          "vc4404"   _
      /  VI200,           "vi200"    _
      /  VIEWPT90,        "view90"   _
      /  VIEWPT,          "viewpt"   _
      /  VT100,           "vt100"    _
      /  Z19,             "z19"

   i = strbsr (spos, stab, 1, str)
   if (i == EOF)
      return (ERR)
   else
      return (stab (spos (i)))

   end
