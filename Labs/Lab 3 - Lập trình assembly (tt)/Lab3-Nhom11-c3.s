.section .data
str: .string "Enter a number (1-digits): " 
len_str = .-str         # do dai cua str
str_out: .string "Max number: "
len_out = .-str_out

.section .bss
        .lcomm n1, 2
        .lcomm n2, 2
        .lcomm n3, 2
        .lcomm n4, 2
        .lcomm n5, 2
        .lcomm arr, 4
        .lcomm max, 1

.section .text
    .globl _start
_start:
        #xuat ra dong chu nhap 1 so
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap so thu 1 
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $n1, %ecx           #gan dia chi number cho %ecx
        movl $2, %edx          #do dai can nhap
        int $0x80               #system kernal

       #xuat ra dong chu nhap 1 so
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap so thu 2
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $n2, %ecx           #gan dia chi number cho %ecx
        movl $2, %edx          #do dai can nhap
        int $0x80               #system kernal
       
        #xuat ra dong chu nhap 1 so
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap so thu 3
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $n3, %ecx           #gan dia chi number cho %ecx
        movl $2, %edx          #do dai can nhap
        int $0x80               #system kernal
        
        #xuat ra dong chu nhap 1 so
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap so thu 4
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $n4, %ecx           #gan dia chi number cho %ecx
        movl $2, %edx          #do dai can nhap
        int $0x80               #system kernal

        #xuat ra dong chu nhap 1 so
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap so thu 5
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $n5, %ecx           #gan dia chi number cho %ecx
        movl $2, %edx          #do dai can nhap
        int $0x80               #system kernal


        # dua 4 so sau so vao 1 mang
        movl $arr, %esi         #esi quan li arr

        movl $n2, %eax          #gan so thu 2 cho %eax
        movb (%eax), %al        #gan phan tu thu nhat cua %eax cho %al
        movb %al , 0(%esi)       #gan phan tu thu nhat cua %esi = %al

        movl $n3, %eax          #gan so thu 1 cho %eax
        movb (%eax), %al        #gan phan tu thu nhat cua %eax cho %al
        movb %al , 1(%esi)       #gan phan tu thu nhat cua %esi = %al

        movl $n4, %eax          #gan so thu 1 cho %eax
        movb (%eax), %al        #gan phan tu thu nhat cua %eax cho %al
        movb %al , 2(%esi)       #gan phan tu thu nhat cua %esi = %al

        movl $n5, %eax          #gan so thu 1 cho %eax
        movb (%eax), %al        #gan phan tu thu nhat cua %eax cho %al
        movb %al , 3(%esi)       #gan phan tu thu nhat cua %esi = %al

       
        movl $n1, %eax            # gan n1 cho %eax
        movb 0(%eax) , %cl         #gan so dau tien cho %al
        movb $0, %bl              #bien chay

        .LOOP:
        cmpb $3, %bl                #neu %bl lon hon 3
        jg .Done                    #nhay xuong Done

        cmpb %cl, (%esi)          #so sanh max voi tung gia tri trong mang
        jl .INC                   # neu gia trri do ma nho hon max thi nhay xuong INC

        movb (%esi), %cl           # nguoc lai, cap nhap %al
        jmp .INC                   # sau do nhay xuong INC

        .INC:
        addb $1, %bl                # tang bien chay len 1
        incl %esi                   # tang index cua mang
        jmp .LOOP                   #nhay ve LOOP

        .Done:
        movb %cl, (max)             # gan gia tri cua %al cho max
        
        #xuat ra dong chu max number
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str_out, %ecx         #gan dia chi str cho %ecx
        movl $len_out, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $max, %ecx         #gan dia chi str cho %ecx
        movl $1, %edx           #do dai can xuat ra
        int $0x80               #system kernal

        movl $1, %eax           #call exit
	int $0x80               #system kernal



