update_compile_order -fileset sources_1

set simulations [get_fileset $env(SIMULATION)]

if { [llength simulations] != 0} {
	foreach sim simulations {
		run_simulation -simset sim
	}
}
