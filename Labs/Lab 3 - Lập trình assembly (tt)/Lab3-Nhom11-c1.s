.section .data
str: .string "Enter a number (5-digits): " 
len_str = .-str # do dai cua str
dx: .string "Doi xung"
len_dx = .-dx #do dai cua dx
kdx: .string "Khong doi xung"
len_kdx = .-kdx #do dai cua dx

.section .bss
        .lcomm number , 6

.section .text
    .globl _start
_start:
        #xuat ra dong chu nhap 1 so co 5 ki tu
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $str, %ecx         #gan dia chi str cho %ecx
        movl $len_str, %edx     #do dai can xuat ra
        int $0x80               #system kernal

        #nhap 5 so 
        movl $3, %eax           #sys_read
        movl $0, %ebx           #std_in
        movl $number, %ecx      #gan dia chi number cho %ecx
        movl $6, %edx           #do dai can nhap
        int $0x80               #system kernal

        #kiem tra
        movl $number, %edx      #gan nunber cho %edx

        movb 0(%edx), %al      #gan phan tu dau tien cho %esi
        addb $48, %al          #chuyen thnah so
        movb 1(%edx), %bl      #gan phan tu thu 2 cho %edi
        addb $48, %bl          #chuyen thnah so
        movb 3(%edx), %cl      #gan phan tu thu 4 cho %eax
        addb $48, %cl          #chuyen thnah so
        movb 4(%edx), %dl      #gan phan tu thu 5 cho %ebx
        addb $48, %dl

        cmpb %al, %dl           #so sanh so thu 1 va so thu 5
        jne .Not_Equal          #neu khac nhau thi nhay xuong label Not_Equal

        cmpb %bl, %cl           #so sanh so thu 2 va so thu 4
        jne .Not_Equal          #neu khac nhau thi nhay xuong label Not_Equal

        #neu tung cap so hai truong hop bang nhau thi thu hiẹn dong ben duoi    
        #xuat ra dong chu doi xung
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $dx, %ecx          #gan dia chi dx cho %ecx
        movl $len_dx, %edx      #do dai can xuat ra
        int $0x80               #system kernal
        jmp .Done

        .Not_Equal:
        #xuat ra dong chu khong doi xung
        movl $4, %eax           #sys_write
        movl $1, %ebx           #std_out
        movl $kdx, %ecx         #gan dia chi kdx cho %ecx
        movl $len_kdx, %edx     #do dai can xuat ra
        int $0x80               #system kernal
               
        .Done:
        movl $1, %eax           #call exit
	int $0x80



