# Make file of 
# The format of this file is based on GNU_Make_Makefile_templates
# https://github.com/Vdragon/GNU_Make_Makefile_templates
##變數
##Variables
COMMAND_GHDL_ANALYSIS = -a
COMMAND_GHDL_ELABORATE = -e
COMMAND_GHDL_RUN = -r

OPTION_GHDL_WITH_DEBUG_SYMBOLS = -g
OPTION_GHDL_WORKAROUND_NONASCII = -Wc,--ghdl--mb-comments
OPTION_GHDL_BE_VERBOSE = -v
OPTION_GHDL_OUTPUT_EXECUTABLE_NAME = -o

##GNU Make 規則
##GNU Make rules
.PHONY : build
build : analysis elaborate

.PHONY : check_syntax
check_syntax : 
	ghdl -s Source_code/Testbench.vhdl

.PHONY : analysis
analysis : 
	ghdl ${COMMAND_GHDL_ANALYSIS} ${OPTION_GHDL_BE_VERBOSE} ${OPTION_GHDL_WITH_DEBUG_SYMBOLS} ${OPTION_GHDL_WORKAROUND_NONASCII} Source_code/Testbench.vhdl

.PHONY : elaborate
elaboration : 
	ghdl -e ${OPTION_GHDL_OUTPUT_EXECUTABLE_NAME} Build/Testbench.exe Testbench

.PHONY : simulate
simulate : 
	 ./Build/Testbench.exe --vcd=Simulation/Testbench.vcd --stop-time=50ns 

.PHONY : gtkwave
gtkwave : 
	gtkwave Simulation/Testbench.vcd

.PHONY : clean
clean :
	-rm work-obj93.cf Testbench.o Build/*.exe Simulation/*.vcd
