INCLUDE_DIRS = $(shell for file in `find ../../../src/cpu -type d`;do echo $$file; done)
INCLUDE_DIRS += ../
INCLUDE_PARAM = $(foreach d, $(INCLUDE_DIRS), -I$d)

VERILATOR_CONFIG = verilator.vlt
VERILATOR_OPTION = -trace -O3
NAME = cpu_tb
SUB_MAKEFILE = V$(NAME).mk
WARNING_CONFIG = -Wno-STMTDLY
HEADERS = testbench.h
VERILATOR_GENERATED_DIR = obj_dir

$(VERILATOR_GENERATED_DIR)/$(NAME): $(NAME).cpp $(HEADERS)
	verilator $(VERILATOR_OPTION) -cc $(NAME).sv $(VERILATOR_CONFIG) $(WARNING_CONFIG) -exe $(NAME).cpp $(INCLUDE_PARAM) -o $(NAME)
	cd $(VERILATOR_GENERATED_DIR) && $(MAKE) -f $(SUB_MAKEFILE) && cd ..

run: $(VERILATOR_GENERATED_DIR)/$(NAME)
	$(VERILATOR_GENERATED_DIR)/$(NAME)

clean:
	rm -rf $(VERILATOR_GENERATED_DIR) || true
	rm $(NAME).vcd || true