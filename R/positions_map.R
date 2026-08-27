positions_map <- tibble::tribble(
  ~raw   , ~clean , ~generic , ~unit           ,

  "QB"   , "QB"   , "QB"     , "offense"       ,
  "RB"   , "RB"   , "RB"     , "offense"       ,
  "HB"   , "RB"   , "RB"     , "offense"       ,
  "FB"   , "RB"   , "RB"     , "offense"       ,
  "WR"   , "WR"   , "WR"     , "offense"       ,
  "TE"   , "TE"   , "TE"     , "offense"       ,

  "LT"   , "OT"   , "OL"     , "offense"       ,
  "RT"   , "OT"   , "OL"     , "offense"       ,
  "T"    , "OT"   , "OL"     , "offense"       ,
  "OT"   , "OT"   , "OL"     , "offense"       ,

  "LG"   , "OG"   , "OL"     , "offense"       ,
  "RG"   , "OG"   , "OL"     , "offense"       ,
  "G"    , "OG"   , "OL"     , "offense"       ,
  "OG"   , "OG"   , "OL"     , "offense"       ,

  "C"    , "C"    , "OL"     , "offense"       ,
  "OC"   , "C"    , "OL"     , "offense"       ,
  "OL"   , "IOL"  , "OL"     , "offense"       ,
  "IOL"  , "IOL"  , "OL"     , "offense"       ,

  "EDGE" , "EDGE" , "DL"     , "defense"       ,
  "ED"   , "EDGE" , "DL"     , "defense"       ,
  "DE"   , "EDGE" , "DL"     , "defense"       ,
  "LDE"  , "EDGE" , "DL"     , "defense"       ,
  "RDE"  , "EDGE" , "DL"     , "defense"       ,

  "DT"   , "IDL"  , "DL"     , "defense"       ,
  "NT"   , "IDL"  , "DL"     , "defense"       ,
  "DL"   , "IDL"  , "DL"     , "defense"       ,
  "IDL"  , "IDL"  , "DL"     , "defense"       ,
  "LDT"  , "IDL"  , "DL"     , "defense"       ,
  "RDT"  , "IDL"  , "DL"     , "defense"       ,

  "LB"   , "LB"   , "LB"     , "defense"       ,
  "ILB"  , "LB"   , "LB"     , "defense"       ,
  "MLB"  , "LB"   , "LB"     , "defense"       ,
  "LILB" , "LB"   , "LB"     , "defense"       ,
  "RILB" , "LB"   , "LB"     , "defense"       ,
  "LLB"  , "LB"   , "LB"     , "defense"       ,
  "RLB"  , "LB"   , "LB"     , "defense"       ,

  "OLB"  , "EDGE" , "DL"     , "defense"       ,
  "LOLB" , "EDGE" , "DL"     , "defense"       ,
  "ROLB" , "EDGE" , "DL"     , "defense"       ,

  "CB"   , "CB"   , "DB"     , "defense"       ,
  "LCB"  , "CB"   , "DB"     , "defense"       ,
  "RCB"  , "CB"   , "DB"     , "defense"       ,
  "NB"   , "CB"   , "DB"     , "defense"       ,

  "S"    , "S"    , "DB"     , "defense"       ,
  "FS"   , "S"    , "DB"     , "defense"       ,
  "SS"   , "S"    , "DB"     , "defense"       ,
  "DB"   , "DB"   , "DB"     , "defense"       ,

  "K"    , "K"    , "ST"     , "special_teams" ,
  "PK"   , "K"    , "ST"     , "special_teams" ,
  "P"    , "P"    , "ST"     , "special_teams" ,
  "LS"   , "LS"   , "ST"     , "special_teams"
)
