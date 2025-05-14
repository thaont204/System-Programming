.section .data
str: .string "Enter a year (4-digits): " 
len_str = .-str         # do dai cua str
nhuan: .string "Nam nhuan.\n"
len_nhuan = .-nhuan
khongnhuan: .string "Khong phai nam nhuan.\n"
len_knhuan = .-khongnhuan
next: .string "Nam nhuan ke tiep: "
len_next = .-next
ent: .string "\n"

.section .bss
        .lcomm year, 5          # luu nam hien tai
        .lcomm next_year, 4     # luu nam nhuan ke tiep
        .lcomm reYear, 4        #luu ket qua nam
        .lcomm remin400, 4      #luu so du khi chia cho 400
        .lcomm remin100, 4     #luu so du khi chia cho 100
        .lcomm remin4, 4       #luu so du khi chi cho 4
        .lcomm str_y, 4         #luu chuoi nam ke tiep

.section .text
    .globl _start
_start:
        #xuat ra dong chu nhap 1 nam
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap nam 
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $year, %ecx        #gan dia chi number cho %ecx
        movl $5, %edx           #do dai can nhap
        int $0x80               #system kernal

        

        movzbl year, %esi       #gan phan tu dau tien cho %eax
        subl $48, %esi          #chuyen thanh so
        imull $1000, %esi      # %edi = %edi *1000
        movl %esi, %edi        # gan esi cho edi


        movzbl year+1, %esi      #gan phan tu thu hai cho %eax
        subl $48, %esi          #chuyen thanh so
        imull $100, %esi       # %ebx = %ebx *100
        addl %esi, %edi        #%edi = %edi + %ebx


        movzbl year+2, %esi      #gan phan tu thu ba cho %eax
        subl $48, %esi          #chuyen thanh so
        imull $10, %esi       # %ebx = %ebx *10
        addl %esi, %edi        #%edi = %edi + %ebx

        
        movzbl year+3, %esi      #gan phan tu thu tu cho %eax
        subl $48, %esi          #chuyen thanh so
        addl %esi, %edi        #%edi = %edi + %ebx


        
        movl %edi, (reYear)    #gan gia tri %edi cho reYear


        # thu hien phep chia

        # chia cho 100
        movl $0, %edx           #clear dividend
        movl (reYear), %eax      # gan reYear cho %eax
        movl $100, %ecx         # gan hang so 100 cho %ecx
        divl %ecx               # %edx = eax % ecx 
        movl %edx, (remin100)   #luu gia tri so du cho remin100


        cmpl $0, (remin100)       #so sanh so du khi chia 100 voi so 0
        je .Chia400
        jne .Chia4

        # chia cho 4
        .Chia4:
        movl $0, %edx           #clear dividend
        movl (reYear), %eax      # gan reYear cho %eax
        movl $4, %ecx           # gan hang so 4 cho %ecx
        divl %ecx               # %edx = eax % ecx 
        movl %edx, (remin4)     #luu gia tri so du cho remin4

        
        cmpl $0, (remin4)         #so sanh do du khi chia cho 4 voi so 0
        jne .KhongNhuan           #neu khng chia het cho 4 la nam khong nhuan
        je .Nhuan


        # chia cho 400
        .Chia400:
        movl $0, %edx           #clear dividend
        movl (reYear), %eax      # gan reYear cho %eax
        movl $400, %ecx         # gan hang so 400 cho %ecx
        divl %ecx               # %edx = eax % ecx
        movl %edx, (remin400)   #luu gia tri so du cho remin400

        cmpl $0, (remin400)     #so sanh so du khi chia 400 voi so 0
        jne .KhongNhuan         #neu chia het cho 400 la nam Nhuan
        je .Nhuan


        .Nhuan:
        
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $nhuan, %ecx       #gan dia chi nhuan cho %ecx
        movl $len_nhuan, %edx   #do dai can xuat ra
        int $0x80               #system kernal
        jmp .LOOP

        .KhongNhuan:
        movb $0, %al
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $khongnhuan, %ecx  #gan dia chi khongnhuan cho %ecx
        movl $len_knhuan, %edx  #do dai can xuat ra
        int $0x80               #system kernal
        jmp .LOOP

        .N:
                jmp .Next_y
        .KN:
                jmp .LOOP
        .LOOP:
        addl $1, %edi           # tang nam len 1
        

        movl $0, %edx           #clear dividend
        movl %edi, %eax      # gan %edi cho %eax
        movl $100, %ecx         # gan hang so 100 cho %ecx
        divl %ecx               # %edx = eax % ecx 
        movl %edx, (remin100)   #luu gia tri so du cho remin100


        cmpl $0, (remin100)       #so sanh so du khi chia 100 voi so 0
        je .Chia400_
        jne .Chia4_

        # chia cho 4
        .Chia4_:
        movl $0, %edx           #clear dividend
        movl %edi, %eax      # gan reYear cho %eax
        movl $4, %ecx           # gan hang so 4 cho %ecx
        divl %ecx               # %edx = eax % ecx 
        movl %edx, (remin4)     #luu gia tri so du cho remin4

        
        cmpl $0, (remin4)         #so sanh do du khi chia cho 4 voi so 0
        jne .KN                   #neu khng chia het cho 4 thi nhay len KN
        je .N                     #nguoc lai nhay len N


        # chia cho 400
        .Chia400_:
        movl $0, %edx           #clear dividend
        movl %edi, %eax      # gan reYear cho %eax
        movl $400, %ecx         # gan hang so 400 cho %ecx
        divl %ecx               # %edx = eax % ecx
        movl %edx, (remin400)   #luu gia tri so du cho remin400

        cmpl $0, (remin400)     #so sanh so du khi chia 400 voi so 0
        jne .KN                   #neu khong chia het cho 4 thi nhay len KN
        je .N                     #nguoc lai nhay len N


        .Next_y:
        movl %edi, (next_year)  #gan gia tri %edi cho next_year

        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $next, %ecx       #gan dia chi nhuan cho %ecx
        movl $len_next, %edx   #do dai can xuat ra
        int $0x80               #system kernal
        
        movl $10000, %esi       #gan esi = 10000
        movl $0, %edi            #gan edi =1
        .LOOP2:
       

        movl $0, %edx           #clear dividend
        movl (next_year), %eax  # gan reYear cho %eax
        movl %esi, %ecx         # gan hang so 1000 cho %ecx
        divl %ecx               # %edx = eax % ecx
        addl $48, %eax          #chuyen so thanh ki tu
        movl %eax, (str_y)      # luu gia tri vo str_y

        cmpl $48, %eax          #so sanh neu la so 0 o vi tri dau tien thi khong can in ra
        jne .con1               
        cmpl $0, %edi
        je .con2

        .con1:
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str_y, %ecx       #gan dia chi nhuan cho %ecx
        movl $1, %edx           #do dai can xuat ra
        int $0x80               #system kernal
        

        .con2:
        movl $0, %edx           #clear dividend
        movl (next_year), %eax  # gan reYear cho %eax
        movl %esi, %ecx      # gan %esi cho %ecx
        divl %ecx               # %edx = eax % ecx
        movl %edx, (next_year)  #gan gia tri moi cho next_year
        
        movl $0, %edx           #clear dividend
        movl %esi, %eax       # gan %esi cho %eax
        movl $10, %ecx         # gan hang so 10 cho %ecx
        divl %ecx               # %eax = eax / ecx
        movl %eax, %esi     #gan gia tri moi cho %esi

        addl $1, %edi           #tang edi len 1
        cmpl $0, %esi           #neu esi = 0 thi dung
        je .Done
        jmp .LOOP2

        #exit
        .Done:
        
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $ent, %ecx       #gan dia chi ent cho %ecx
        movl $1, %edx            #do dai can xuat ra
        int $0x80               #system kernal

        movl $1, %eax           #call exit
	int $0x80               #system kernal



