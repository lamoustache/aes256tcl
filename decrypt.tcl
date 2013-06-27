#!/usr/bin/tclsh
# decrypt.tcl

package require aes

if {$argc != 4} {
    puts "\ndecrypt.tcl scripts requires four arguments\n"
    puts "<input file> <output file> <key> <IV>\n"
	exit 1
} else {
		set key [ binary format H* [lindex $argv 2]]
		set iv [ binary format H* [lindex $argv 3]]
	}

set input [open [lindex $argv 0] r]
fconfigure $input -translation binary
set data [read -nonewline $input]
set data [aes::aes -mode cbc -dir decrypt -iv $iv -key $key $data]
set output [open [lindex $argv 1] w]
fconfigure $output -translation binary
puts -nonewline $output $data
close $output
