BEGIN { cyc = 4 }
match($1, /\[\+([0-9]*)\](.*)/, g) { cyc += g[1]; print "["cyc"]"g[2] }
!/\[\+([0-9]*)\].*/ { print $1 }
