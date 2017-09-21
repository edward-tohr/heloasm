.data
str1:	.ascii "Hello, World!\n"	
str2:	.ascii "Hello, Assembly"	

handle:	.byte 0
written:.byte 0

.global	l1

.text

l1:
	pushl $str2
	call _SetConsoleTitleA@4
	pushl $-11
	call _GetStdHandle@4	
	mov %eax, handle	
	pushl $0
	pushl $written
	pushl $14
	pushl $str1
	pushl handle
	call _WriteConsoleA@20	
	mov $0xFFFFFFFF, %ecx	
l2:	dec %ecx		
	cmp $0, %ecx		
	jne l2		
	pushl $0
	call _ExitProcess@4
