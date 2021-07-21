%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher
    
    mov ebx, 0
    for_body:
    cmp ebx, ecx
    je for_end
    
    mov al, [esi+ebx]
    
    cmp al, 65
    jl salturi3
    
    cmp al, 122
    jg salturi3
    
    cmp al, 91
    je salturi3
    
    cmp al, 92
    je salturi3
    
    cmp al, 93
    je salturi3 
    
    cmp al, 94
    je salturi3
    
    cmp al, 95
    je salturi3 
    
    cmp al, 96
    je salturi3
    
    cmp al, 91
    jl litere_mari
    
    cmp al, 96
    jg litere_mici
    
    fin:
    mov [edx+ebx], al
    inc ebx
    jmp for_body
    for_end:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
    
    
litere_mari:
    cmp edi, 26
    jg salturi1a
    add eax, edi
    cmp al,90
    jg salturi2
    jmp fin
    
litere_mici:
    cmp edi,26
    jg salturi1b
    add eax, edi
    cmp ax,122
    jg salturi2
    jmp fin
 
salturi1a:
    add edi, -26
    cmp edi, 26
    jg salturi1a
    jmp litere_mari
    
salturi1b:
    add edi, -26
    cmp edi, 26
    jg salturi1b
    jmp litere_mici
    
salturi2:
    add al, -26
    jmp fin
    
salturi3:
    jmp fin
    
    
