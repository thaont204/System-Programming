.section .data
	str: .string "Love UIT"
	str_len = . -str -1 # lay do dai chuoi tru ki tu null
	out: .int(str_len+48) # gan gia tri cho vung nho


.section .text
	.globl _start
_start:
	movl $4, %eax # sys_write
	movl $1, %ebx # stdout
	movl $out, %ecx # gan dia chi cua out cho thanh ghi %ecx
	movl $1, %edx # do dai can xuat
	int $0x80 #call kernal
	
	movl $1, %eax # system exit
	int $0x80
