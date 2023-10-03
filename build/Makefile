include makefile.inc

# ================================================================
# Copyright (c) 2016 Bluespec, Inc.  All Rights Reserved.
# This is an example Makefile for the examples in the standard
# Bluespec training session.

# You should only have to edit the variable definitions in the
# following section (or override them from the 'make' command line)

# You should also have performed your standard Bluespec setup, defining
# environment variables BLUESPECDIR, BLUESPEC_HOME and
# BLUESPEC_LICENSE_FILE, and placing $BLUESPEC_HOME/bin in your path
# so that you can invoke 'bsc', the Bluespec compiler.

# ================================================================
# Please modify the following for your installation and setup

# Directory for the specific example you are building
EG ?= $(EG_NAME)

# Directory containing the Bluespec Training distribution directory
DISTRO ?= /home/govardhan/github/Bluespexamples

# Set this to the command that invokes your Verilog simulator
# VSIM ?= iverilog
VSIM ?= $(SIM)
# VSIM ?= cver
# VSIM ?= vcsi
# VSIM ?= vcs
# VSIM ?= modelsim
# VSIM ?= ncsim
# VSIM ?= ncverilog

# ================================================================
# You should not have to change anything below this line

TOPFILE ?= $(DISTRO)/src/$(EG)/$(TB_BSV).bsv
TOPMODULE ?= $(TB_BSV_TOP)

BSC_COMP_FLAGS = -elab -keep-fires -aggressive-conditions -no-warn-action-shadowing
BSC_LINK_FLAGS = -keep-fires
BSC_PATHS = -p $(DISTRO)/src/$(EG)/:$(DISTRO)/src/Common:%/Prelude:%/Libraries
# Verilog compile/link/sim

V_DIRS = -vdir verilog_dir -bdir build_v -info-dir build_v
VSIM_EXE = $(TOPMODULE)_vsim

.PHONY: all_vsim
all_vsim: full_clean  verilog  v_link  v_simulate

build_v:
	mkdir  build_v
verilog_dir:
	mkdir  verilog_dir

.PHONY: verilog
verilog: build_v  verilog_dir
	@echo Compiling for Verilog ...
	bsc -u -verilog $(V_DIRS) $(BSC_COMP_FLAGS) $(BSC_PATHS) -g $(TOPMODULE)  $(TOPFILE)
	@echo Compiling for Verilog finished

.PHONY: v_link
v_link:  build_v  verilog_dir
	@echo Linking for Verilog sim ...
	bsc -e $(TOPMODULE) -verilog -o ./$(VSIM_EXE) $(V_DIRS) -vsim $(VSIM)  verilog_dir/$(TOPMODULE).v \
		$(DISTRO)/src/Common/C_imports.c
	@echo Linking for Verilog sim finished

.PHONY: v_simulate
v_simulate:
	@echo Verilog simulation...
	./$(VSIM_EXE)  +bscvcd
	@echo Verilog simulation finished

# ----------------------------------------------------------------

.PHONY: clean
clean:
	rm -f build_bsim/* build_v/* verilog_dir/* *~ *.vcd *_vsim  

.PHONY: full_clean
full_clean:
	rm -r -f  build_bsim  build_v  verilog_dir  *~
	rm -f  *$(TOPMODULE)*  *.vcd
