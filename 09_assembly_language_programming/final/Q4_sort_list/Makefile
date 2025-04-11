# Define the assembler and its flags
AS = yasm
ASFLAGS = -a x86 -m amd64 -g dwarf2 -f elf64

# Define the linker and its flags
LD = gcc
LDFLAGS = -m64 -no-pie -z noexecstack
# LDFLAGS = -m64 -no-pie

# Define the source files
SRCS = practice.asm

# Derive object files from source files
OBJS = $(SRCS:.asm=.o)

# Define the executable name
EXE = practice.out

# Phony targets
.PHONY: all clean run

# Default target: build the executable
all: $(EXE)

# Rule to link object files into the executable
$(EXE): $(OBJS)
	@echo "#Linking $@"
	$(LD) $(LDFLAGS) -o $@ $^

# Pattern rule to assemble .asm files into .o files
%.o: %.asm
	@echo "#Assembling $<"
	$(AS) $(ASFLAGS) -o $@ $<

# Clean target: remove generated files
clean:
	@echo "#Cleaning up"
	rm -f $(EXE) $(OBJS)

# Run target: build and run the executable
run: all
	@echo "#Running $(EXE)"
	./$(EXE)
