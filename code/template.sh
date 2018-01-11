#!/bin/bash
# first Argument:   name of the project
# second Argument:  name of the autor
echo "First arg: $1"
echo "Second arg: $2"

now=$(date +"%m.%d.%Y")

# check if the folder exists already
# if it exists stop!

if [ -d "$1" ]; then
    echo "$1 exists already
exit!"
    exit
fi

# create all the directories

mkdir $1
mkdir $1/doc
mkdir $1/sim
mkdir $1/src
mkdir $1/fpga

# define the headers

header="/*-------------------------------------
Project:    $1
Purpose:    
Author:     $2
Version:    00, $now
--------------------------------------*/

module $1 ();

endmodule"

headerTB="/*-------------------------------------
Project:    $1
Purpose:    
Author:     $2
Version:    00, $now
--------------------------------------*/

module tb_$1();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

/*
*   (2) Create an instance of the DUT
*/

$1                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

initial begin

    \$display(\"---------------------------\");
    \$display(\"    $1 started    \");
    \$display(\"---------------------------\");

    // your test code goes here

    \$display(\"---------------------------\");
    \$display(\"   $1 finished    \");
    \$display(\"---------------------------\");

end
endmodule

"

# create the tcl start script

tclScript="# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/$1.sv
# Compile the test bench
vlog tb_$1.sv
# Init simulation -> use module name
vsim tb_$1
# -r recursive
log -r *
do wave_tb_$1.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave"

echo "$header" > $1/src/$1.sv
echo "$headerTB" > $1/sim/tb_$1.sv
echo "$tclScript" > $1/sim/sim_tb_$1.tcl
echo "" > $1/sim/wave_tb_$1.tcl

echo "create template file with name: $1"

