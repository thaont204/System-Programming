.section .data
str_in: .string "Nhap chuoi(5 ki tu):  "
str_n: .string "n (0-9): "
.section .bss
	.lcomm inp, 5 		#tao bien inp co do dai 5 byte
	.lcomm n, 1			#Tao bien n co do dai 1 byte
	.lcomm out, 5		#tao bien out co do dai 5 byte
.section .text
	.globl _start
_start:
	#xuat ra dong chua nhap 5 ki tu
	movl $4, %eax  		#sys_write
	movl $1, %ebx  		#stdout
	movl $str_in, %ecx 	#gan dia chi str_in cho %ecx
	movl $21, %edx		# do dai cua chuoi can in
	int $0x80  			#sys_kernal
	
	
	#nhap 5 ki tu
	movl $3, %eax 		#sys_read
	movl $0, %ebx 		#std_in
	movl $inp, %ecx 	#gans dia chi inp cho %ecx
	movl $6, %edx 		#do dai can nhap vao
	int $0x80 			#sys_kernal
	

	#xuat ra dong chu nhap n
	movl $4, %eax
	movl $1, %ebx
	movl $str_n, %ecx
	movl $9, %edx
	int $0x80
	
	#nhap n
	movl $3, %eax
	movl $0, %ebx
	movl $n, %ecx
	movl $2, %edx
	int $0x80
	
	#Xu li
	movl $inp, %edi 	#%edi quan li inp
	mov $1, %bl 		#gan %bl la 1
	movl $n, %eax 		#gan %eax la n
	addl $48, %eax 		#chyen tu sang so
	movl $out, %esi 	#thanh ghi %esi quan li out

	.LOOP:
	cmp $5, %bl 		#so sanh %bl voi 5, 
	je .END 			#neu %bl = 5 thi nhay xuong END
	
	movl (%edi), %ebx 	#gan phan tu cua %edi cho %ebx
	cmpl $90, %ebx		#so sanh %ebx voi so 90(Z)
	je .IsZ 			#neu %ebx = 90 thi nhay xuong IsZ
	
	#neu %ebx khong bang 90 thi
	addl %eax, %ebx 	#%ebx = %ebx + %eax(n)
	movl %ebx, (%esi) 	#gan gia tri %ebx cho %esi
	inc %bl				#tang %bl len 1
	incl %edi			#tang index %edi len 1
	incl %esi			#tang index %esi len 1
	jmp .LOOP			#nhay ve LOOP
	
	.IsZ:
	addl %eax, %ebx 	#%ebx = %ebx + %eax(n)
	subl $26, %ebx		#%ebx = %ebx - 26
	movl %ebx, (%esi) 	#gan gia tri %ebx cho %esi
	inc %bl				#tang %bl len 1
	incl %edi			#tang index %edi len 1
	incl %esi			#tang index %esi len 1
	jmp .LOOP			#nhay ve LOOP

	.END:
	xor %eax, %eax
	movl $4, %eax 		#sys_write
	movl $1, %ebx		#stdout
	movl %esi, %ecx		#gan dia chi %esi cho %ecx
	movl $5, %edx		#do dai can in ra
	int $0x80

	
	movl $1, %eax # system exit
	int $0x80
