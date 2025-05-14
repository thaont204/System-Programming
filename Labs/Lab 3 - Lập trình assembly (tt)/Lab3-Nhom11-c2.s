.section .data
str: .string "Enter a string (<255 chars): " 
len_str = .-str         # do dai cua str
str_out: .string "Number of words: "
len_out = .-str_out
newline: .string "\n"

.section .bss
        .lcomm s, 256
        .lcomm word, 4          #luu so luong tu
        .lcomm out, 4           #bien xuat 

.section .text
    .globl _start
_start:
        #xuat ra dong chu nhap 1 chuoi
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap chuoi 
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $s, %ecx           #gan dia chi number cho %ecx
        movl $256, %edx          #do dai can nhap
        int $0x80               #system kernal

       
        movl $0, %edi           #gan %edi = 0, de dem so tu
        movb $0, %bl            #bien co
        movl $s, %esi           #%esi quan li s

        
        .LOOP:
        movb newline, %al
        cmpb %al, (%esi)    # neu esi = dau xuong hang thi dung
        je .Done                
        

        movb (%esi), %cl        #gan 1 phan tu cho %cl   
        cmpb $32, %cl           #xet thu %cl = space?
        je .flag0                #neu la space thi nhay xuong INC

        addb $1, %bl            #neu khong la space thi tang al len 1
        cmpb $1, %bl            
        jne .INC                #neu no khong bang 1 thi nhay xuong .INC
        addl $1, %edi           #nguoc lai tang bien dem len 1
        jmp .INC                #nhay xuong INC

        .flag0:
        movb $0, %bl            #gan bien co bl = 0

        .INC:
        incl %esi               #tang index %esi len 1
        jmp .LOOP               #nhay len LOOP

        #in ra ket qua
        .Done:
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str_out, %ecx     #gan dia chi str cho %ecx
        movl $len_out, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        cmpl $100, %edi          #neu edi lon hon hoac bang 10 thi nhay xuong label Lon10
        jge .Lon100

        cmpl $10, %edi          #neu edi lon hon hoac bang 10 thi nhay xuong label Lon10
        jge .Lon10

        addl $48, %edi           #chuyen ki tu thanh so
        movl %edi, (word)        # word = edi

        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $word, %ecx        #gan dia chi save cho %ecx
        movl $4, %edx           #do dai can xuat ra
        int $0x80               #system kernal

        jmp .Exit

        .Lon10:
        movl $10, %esi          #gan esi =10

        .LOOP10:
        cmpl $0, %esi           #so sanh esi voi 0
        je .Exit                #neu bang thi thoat
        movl $0, %edx           #clear dividend
        movl %edi, %eax         #dividend
        movl %esi, %ecx         #divisor
        divl %ecx               #%eax = %eax / %ecx
        addl $48, %eax          #chuyen so thanh ki tu
        movl %eax, out          #gan gia tri eax cho out

        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $out, %ecx         #gan dia chi out cho %ecx
        movl $1, %edx           #do dai can xuat ra
        int $0x80               #system kernal

        movl $0, %edx           #clear dividend
        movl %edi, %eax         #dividend
        movl %esi, %ecx         #divisor
        divl %ecx               #%edx = %eax % %ecx
        movl %edx, %edi         #cap nhat gia tri moi cho %edi

        movl $0, %edx           #clear dividend
        movl %esi, %eax         #dividend
        movl $10, %ecx          #divisor
        divl %ecx               #%eax = %eax / %ecx
        movl %eax, %esi         #cap nhat gia tri esi
        jmp .LOOP10

        .Lon100:
        movl $100, %esi          #gan esi =100

        .LOOP100:
        cmpl $0, %esi           #so sanh esi voi 0
        je .Exit                #neu bang thi thoat
        movl $0, %edx           #clear dividend
        movl %edi, %eax         #dividend
        movl %esi, %ecx         #divisor
        divl %ecx               #%eax = %eax / %ecx
        addl $48, %eax          #chuyen so thanh ki tu
        movl %eax, out          #gan gia tri eax cho out

        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $out, %ecx         #gan dia chi out cho %ecx
        movl $1, %edx           #do dai can xuat ra
        int $0x80               #system kernal

        movl $0, %edx           #clear dividend
        movl %edi, %eax         #dividend
        movl %esi, %ecx         #divisor
        divl %ecx               #%edx = %eax % %ecx
        movl %edx, %edi         #cap nhat gia tri moi cho %edi

        movl $0, %edx           #clear dividend
        movl %esi, %eax         #dividend
        movl $10, %ecx          #divisor
        divl %ecx               #%eax = %eax / %ecx
        movl %eax, %esi         #cap nhat gia tri esi
        jmp .LOOP100

        .Exit:
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $newline, %ecx     #gan dia chi newline cho %ecx
        movl $1, %edx           #do dai can xuat ra
        int $0x80               #system kernal

        movl $1, %eax           #call exit
	int $0x80



