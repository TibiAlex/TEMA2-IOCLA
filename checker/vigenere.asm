%include "io.mac"

section .data
    num DD 0
    num2 DD 0

section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY

    ;; TODO: Implement the Vigenere cipher
    
    xor eax, eax
    mov dword[num], ebx
    mov dword[num2], ecx
    mov ecx, 0
    mov ebx, 0
    for_body:
    cmp ebx, dword[num2]
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
    cmp ecx, dword[num]
    je scaderea
    add al, [edi + ecx]
    inc ecx
    sub al, 65
    cmp al, 90
    jg sarituri2
    jmp fin
    

litere_mici:
    cmp ecx, dword[num]
    je scadereb
    add al, [edi + ecx]
    inc ecx
    sub al, 65
    cmp ax, 122
    jg sarituri2
    jmp fin
    
sarituri2:
    sub al, 26
    jmp fin
   
scaderea:
    sub ecx, dword[num]
    jmp litere_mari  
    
scadereb:
    sub ecx, dword[num]
    jmp litere_mici 
   
salturi3:
    jmp fin
   
    
