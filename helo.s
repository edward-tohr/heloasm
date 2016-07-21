.data
msg:	.ascii "Hello, World!\n"	# message to be written

handle:	.byte 0				# reserved byte for standard out handle
written:.byte 0				# reserved byte for chars written

.global	go

.text

go:
	pushl $-11
	call _GetStdHandle@4	# grabs standard handle -11, standard out.
	mov %eax, handle	# moves register eax w/handle to handle.
	pushl $0
	pushl $written
	pushl $14
	pushl $msg
	pushl handle
	call _WriteConsoleA@20	# WriteConsole(handle, msg, len, written, null)
	pushl $-10		
	call _GetStdHandle@4	# grabs standard handle -10, standard input.
	mov %eax, handle	# moves eax to mem location handle.
				# and then does nothing, since I didn't have
				# time to figure out how to make it wait for
				# input from the user. This was related to
				# another part that changed the console's
				# title, but only while program was running.
	pushl $0
	call _ExitProcess@4	# ExitProcess(0) to quit.
