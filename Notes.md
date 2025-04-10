## gdb debugging

to run gdb:
`gdb ./main.out`

### inside gdb

`file ./main.out` to reload file after recompile

to disassemble the program:
`disassemble main`

to set a breakpoint:
`break` or `br`
	- `br main.asm:10` break at line 10 of main.asm
	- `info breakpoints` to see the breakpoints
	- `delete 1` to delete the breakpoint by number


`run` run the program

`start` to run and break at main

`backtrace` or `bt` to see the call stack

`continue` or `c` to continue execution

`list` or `l` to see nearby code


to refresh the gdb layout
`ref`

`lay next` or "Ctrl+X+A"
	hit "Enter" to change layout

### ways to go next
`next` or `n`   - step over one source code
`nexti` or `ni` - step over one instruction
`step` or `s`   - step into
	`finish` to step out of function


### examine memory

`x/i $pc` examine instruction at PC

`info registers` or `info reg` see state of registers

`print` or `p` to print the value of a variable
