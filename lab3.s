.section .bss
.globl ram
.lcomm ram, 0x250           

.section .text
.globl fill_ram              

fill_ram:
    mov  $0, %rax         
    mov  $0, %rdi           
    mov  $ram+0x50, %rsi     
    mov  $256, %rdx       
    syscall

    mov  $0, %rax          
    mov  $0, %rdi         
    mov  $ram+0x150, %rsi   
    mov  $256, %rdx          
    syscall

    xor  %rax, %rax
    xor  %rdx, %rdx
    xor  %rsi, %rsi        
    xor  %rdi, %rdi        

loop_label:
    movb ram+0x50(%rdi), %al     
    movb ram+0x150(%rdi), %dl    

    cmpb $0x0A, %al      
    je   done

    cmpb $0x0A, %dl        
    je   done

    xorb %dl, %al            
    popcnt %rax, %rax        
    add  %rax, %rsi         

    inc  %rdi       
    cmp $256, %rdi               
    jl   loop_label

done:
    mov  %rsi, %rax         
    ret

.section .note.GNU-stack,"",@progbits
