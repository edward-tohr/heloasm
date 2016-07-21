.data
msg:	.ascii "Hello, World!\n"
tit:	.ascii "Oh noes!"

handle:	.byte 0
written:	.byte 0

.global	go

.text

go:
	pushl $-11
	call _GetStdHandle@4
	mov %eax, handle
	pushl $0
	pushl $written
	pushl $14
	pushl $msg
	pushl handle
	call _WriteConsoleA@20
	pushl $-10
	call _GetStdHandle@4
	mov %eax, handle
	pushl $0
	call _ExitProcess@4
