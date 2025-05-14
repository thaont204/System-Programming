.section .data
    str: .string "Enter a number (2-digital): "
    reminder: .string "Reminder: "
.section .bss
    .lcomm num1, 3      #so thu nhat
    .lcomm num2, 3      #so thu hai
    .lcomm kq, 1        #ket qua
.section .text
	.globl _start
_start:
    #in ra dong chua entera number
	movl $4, %eax           # sys_write
	movl $1, %ebx           # stdout
	movl $str, %ecx         # gan dia chi cua str cho thanh ghi %ecx
	movl $28, %edx          # do dai can xuat
	int $0x80               #call kernal
	
    #nhap num1
    movl $3, %eax           #sys_read
    movl $0, %ebx           #stdin
    movl $num1, %ecx        #gan dia chi num1 cho %ecx
    movl $3, %edx           #so luong can nhap(tinh ca enter)
    int $0x80               #call kernal

    #in ra dong chua entera number
	movl $4, %eax           # sys_write
	movl $1, %ebx           # stdout
	movl $str, %ecx         # gan dia chi cua str cho thanh ghi %ecx
	movl $28, %edx          # do dai can xuat
	int $0x80               #call kernal
	
    #nhap num1
    movl $3, %eax           #sys_read
    movl $0, %ebx           #stdin
    movl $num2, %ecx        #gan dia chi num2 cho %ecx
    movl $3, %edx           #so luong can nhap(tinh ca enter)
    int $0x80               #call kernal

    movl $num1, %esi        #gan dia chi num1 cho %esi
    movl $num2, %edi        #gan dia chi num2 cho %edi

    #chuyen so thu nhat tu chuoi sang so
    movl (%esi), %eax       #gan phan tu thu nhat cua %esi cho %eax
    subl $48, %eax          #chuyen tu chuoi sang so
    imull $10, %eax         # %eax = %eax * 10
    movl 1(%esi), %ebx      #gan phan tu thu hai cua %esi cho %ebx
    subl $48, %ebx          #chuyen tu chuoi sang so
    addl %ebx, %eax         #%eax = %eax + %ebx
    movl %eax, %esi         #gan %eax cho %esi

    #ddua cac thanh ghi ve 0
    xor %eax, %eax
    xor %ebx, %ebx

    #chuyen so thu hai tu chuoi snag so
    movl (%edi), %eax       #gan phan tu thu nhat cua %edi cho %eax
    subl $48, %eax          #chuyen tu chuoi sang so
    imull $10, %eax         # %eax = %eax * 10
    movl 1(%edi), %ebx      #gan phan tu thu hai cua %edi cho %ebx
    subl $48, %ebx          #chuyen tu chuoi sang so
    addl %ebx, %eax         #%eax = %eax + %ebx
    xor %edi, %edi          # %edi = 0
    movl %eax, %edi         #gan %eax cho %edi

    #cong hai so lai
    addl %edi, %esi         # cong hai so va luu no vao %esi

   #dua cac thanh ghi ve 0
    xor %eax, %eax
    xor %ebx, %ebx
    xor %ecx, %ecx
    xor %edx, %edx

    movl $kq, %edi          #gan dia chi kq cho %edi

    movl $0, %edx           #clear deviden
    movl %esi, %eax         #so bi chia %esi
    movl $4, %ecx           # so chia =4
    divl %ecx               # %eax = %esi, %edx = so du
    movl %edx, %edi         # gan ket qua so du vao thanh ghi %edi

    #dua cac thanh ghi ve 0
    xor %eax, %eax
    xor %ebx, %ebx
    xor %ecx, %ecx
    xor %edx, %edx

    #xuat ra dong chu Reminder
    movl $4, %eax           # sys_write
	movl $1, %ebx           # stdout
	movl $reminder, %ecx    # gan dia chi cua reminder cho thanh ghi %ecx
	movl $10, %edx          # do dai can xuat
	int $0x80               #call kernal

    #in ra so du
    movl $4, %eax           # sys_write
	movl $1, %ebx           # stdout
	movl %edi, %ecx         # gan dia chi cua %edi cho thanh ghi %ecx
	movl $1, %edx           # do dai can xuat
	int $0x80               #call kernal

    #exit
	movl $1, %eax           # system exit
	int $0x80
