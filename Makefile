# Make file of 
# The format of this file is based on GNU_Make_Makefile_templates
# https://github.com/Vdragon/GNU_Make_Makefile_templates
##變數
##Variables

##GNU Make 規則
##GNU Make rules
.PHONY : build
build : 

.PHONY : check_syntax
check_syntax : 
	ghdl -s Source_code/Testbench.vhdl

.PHONY : analysis
analysis : 
	ghdl -a -Wc,--ghdl--mb-comments Source_code/Testbench.vhdl

.PHONY : elaborate
elaboration : 
	ghdl -e 

.PHONY : simulate
simulate : 
	ghdl -r 

.PHONY : clean
clean :
	rm 
