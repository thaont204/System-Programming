.section .data
	str: .string "52"
	nam: .string "20"
	phay: .string ", "
	inp: .string "Nhap so bao danh(6 ki tu): "
	mssv: .string "MSSV: "
	nk: .string "Nien khoa: "
	sv: .string "Sinh vien nam: "
	so24: .int 24 

.section .bss
	.lcomm sbd, 6
	.lcomm two, 2 		# luu hai ki tu dau cua sbd
	.lcomm four, 4		# luu 4 ki tu cuoi cua sbd
	.lcomm num, 2
.section .text
	.globl _start
_start:

	#xuat ra lenh nhap vao so bao danh
	movl $4, %eax  		#sys_write
	movl $1, %ebx 		#stdout
	movl $inp, %ecx		#gan dia chi inp cho %ecx
	movl $27, %edx 		#do dai can in
	int $0x80
	
	#nhap so bao danh gom 6 chu so
	movl $3, %eax 		#sys_read
	movl $0, %ebx 		#std_in	
	movl $sbd, %ecx 	#gan dia chi sbd cho %ecx
	movl $7, %edx 		#do dai can nhap
	int $0x80 
	
	movl $two, %edi
	movl $four, %esi
	
	#luu hai ki tu dau vao two, 4 ki tu cuoi vao four
	
	movl $4, %eax 
	movl $1, %ebx 
	movl %ecx, %edi
	movl $2, %edx 
	
	addl $2, %ecx # cong them 2 de nhay sang so cos index la 2
	
	movl $4, %eax 
	movl $1, %ebx 
	movl %ecx, %esi
	movl $4, %edx 
	
	
	#viet ra dong chu mssv
	movl $4, %eax 
	movl $1, %ebx 
	movl $mssv, %ecx
	movl $6, %edx 
	int $0x80
	
	#viet hai so dau cua sbd
	movl $4, %eax 
	movl $1, %ebx 
	movl %edi, %ecx
	movl $2, %edx 
	int $0x80
	
	#viet ra so 52
	movl $4, %eax 
	movl $1, %ebx 
	movl $str, %ecx
	movl $2, %edx 
	int $0x80
	
	#viet 4 so cuoi cua sbd
	movl $4, %eax 
	movl $1, %ebx 
	movl %esi, %ecx
	movl $4, %edx 
	int $0x80
	
	#hien thi dau phay ngan cach 2 noi dung
	movl $4, %eax 
	movl $1, %ebx 
	movl $phay, %ecx
	movl $2, %edx 
	int $0x80
	
	# hien thi nien khoa
	movl $4, %eax 
	movl $1, %ebx 
	movl $nk, %ecx
	movl $11, %edx 
	int $0x80
	
	#in ra nam cua nien khoa do
	movl $4, %eax 
	movl $1, %ebx 
	movl $nam, %ecx
	movl $2, %edx 
	int $0x80
	
	movl $4, %eax 
	movl $1, %ebx 
	movl %edi, %ecx
	movl $2, %edx 
	int $0x80
	
	#hien thi dau phay ngan cach 2 noi dung
	movl $4, %eax 
	movl $1, %ebx 
	movl $phay, %ecx
	movl $2, %edx 
	int $0x80
	
	#hien thi cau sinh vien nam:
	
	movl $4, %eax 
	movl $1, %ebx 
	movl $sv, %ecx
	movl $15, %edx 
	int $0x80

	#reset thanh ghi
	xor %eax, %eax
	xor %ebx, %ebx
	xor %ecx, %ecx

	# doi hai so dau cua mssv tu chuoi thanh so

	movl (%edi), %eax 		#gan phan tu thu 1 cho %eax
	subl $48, %eax			# sau do chuyen tu chuoi thanh so
	imull $10, %eax			#roi nhan cho 10
	movl 1(%edi), %ebx		#gan phan tu thu 2 cho %ebx
	subl $48, %ebx			#chuyen chuoi thanh so
	addl %ebx, %eax			# cong hai so roi luu vao %eax
	subl %eax, so24			#lay 24 tru cho gia tri cua %eax
	addl $48, so24			#cong voi 48 de chuyen thanh chuoi

	#reset thanh ghi
	xor %eax, %eax
	xor %ebx, %ebx
	xor %ecx, %ecx

	#hien thi ra so
	movl $4, %eax 			#sys_write	
	movl $1, %ebx 			#stdout
	movl $so24, %ecx		#gan dia chi so24 cho %ecx
	movl $1, %edx 			# so luong phan tu can in
	int $0x80				#call kernal
	
	#exit
	movl $1, %eax  		#system exit
	int $0x80
	
	
