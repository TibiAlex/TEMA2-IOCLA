%include "io.mac"

section .data
    needle_len DD 0
    haystack_len DD 0
    num DD 0
    k DD 0

section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr
    
    mov dword[needle_len], edx
    mov dword[haystack_len], ecx
    
    xor eax, eax
    xor edx, edx
    xor ecx, ecx
    mov ecx, 1
    
    for_body:
    cmp eax, dword[haystack_len]
    je for_end
    
    mov dword[k], 1
    mov dl, [esi + eax]
    cmp dl, [ebx + 0]
    je verificare
    
    mov dword[k], 0
    fin:
    
    cmp dword[k], 1
    je strstr
    
    inc eax
    jmp for_body
    for_end:
    
    cmp dword[k], 0
    je ending
    
    fin2:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
    
strstr:
    mov [edi], eax
    jmp for_end
    
verificare:
    for_loop:
    cmp ecx, dword[needle_len]
    je fin
    
    mov dword[num], ecx
    add ecx, eax
    mov dl, [esi + ecx]
    mov ecx, dword[num]
    cmp dl, [ebx + ecx]
    jnz not_equal
    
    inc ecx
    jmp for_loop
    
not_equal:
    mov dword[k], 0
    jmp fin
    
ending:
    inc eax
    mov [edi] , eax
    jmp fin2
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
