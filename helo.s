.data
msg:	.ascii "Hello, World!\n"	# message to be written
titl:	.ascii "Hello, Assembly"	# message to set console title to

handle:	.byte 0				# reserved byte for standard out handle
written:.byte 0				# reserved byte for chars written

.global	go

.text

go:
	pushl $titl
	call _SetConsoleTitleA@4# sets console title to Hello, Assembly
	pushl $-11
	call _GetStdHandle@4	# grabs standard handle -11, standard out.
	mov %eax, handle	# moves register eax w/handle to handle.
	pushl $0
	pushl $written
	pushl $14
	pushl $msg
	pushl handle
	call _WriteConsoleA@20	# WriteConsole(handle, msg, len, written, null)
	mov $0xFFFFFFFF, %ecx	# Puts a large value into ecx
loop:	dec %ecx		# Decrements ecx.
	cmp $0, %ecx		# if ecx != 0...
	jne loop		# ... goto loop
	pushl $0
	call _ExitProcess@4	# ExitProcess(0) to quit.
