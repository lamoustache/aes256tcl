#!/usr//bin/tclsh
# encrypt.tcl

package require aes

# Generate Key
proc genKey {arg1} {
    for {set idx 0} {$idx < $arg1} {incr idx} {
        append key [format {%c} [expr {round(rand() * 255)}]];
    }
set bytes_key [ binary format A* $key ]
binary scan $bytes_key H* hex_key
puts "Key: $hex_key"
return $bytes_key
}

# Generate IV
proc genIv {} {
    for {set idx 0} {$idx < 16} {incr idx} { 
        append iv [format {%c} [expr {round(rand() * 255)}]];
    }
set bytes_iv [ binary format A* $iv ]
binary scan $bytes_iv H* hex_iv ]
puts "IV: $hex_iv"
return $bytes_iv
}

# Main
if {$argc != 2} {
    puts "\nencrypt.tcl scripts requires two arguments\n"
    puts "<input file> <output file>\n"
	exit 1
} else {
		set key [genKey 32]
		set iv [genIv]
	}

set input [open [lindex $argv 0] r]
fconfigure $input -encoding binary
set data [read -nonewline $input]
set data [aes::aes -mode cbc -dir encrypt -iv $iv -key $key $data]
set output [open [lindex $argv 1] w]
fconfigure $output -encoding binary
puts -nonewline $output $data
close $output
