.model small
.stack 128
.data
chars db 'ABCD$' 

.code
     main:
         mov ax , @data
         mov ds , ax
         
         mov bx , 00h    ; spaces
         mov cx , 06h    ; stars
         
        print_space:
         push cx     ;6
         mov cx , bx
         cmp cx , 0
         je print_chars
         
         space_loop:
             mov ah , 02h
             mov dl , ' '
             int 21h
             loop space_loop
                         
         print_chars:
             lea dx , chars
             mov ah , 09h
             int 21h
         
         pop cx ; 6
         add bx , 3 ; 3
         push bx
         mov bx , cx ; 6
         cmp cx , 0 
         je exit
         
         print_stars:
             mov ah , 02h
             mov dl , '*'
             int 21h
             loop print_stars
         
         mov cx , bx ; 6
         pop bx ; 3
         sub cx , 3
         
         end_line:
             mov dl , 0Dh
             int 21h
             mov dl , 0Ah
             int 21h
             jmp print_space
  exit:    
      mov ah, 4ch
     int 21h
      end main
     .end
