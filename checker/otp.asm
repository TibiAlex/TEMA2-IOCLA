%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher
    
    mov ebx, 0
    for_body:
    cmp ebx, ecx
    je for_end
    
    mov al, [esi + ebx]
    xor al, [edi + ebx]
    mov [edx + ebx], al
    
    inc ebx 
    jmp for_body
    for_end:
    
 
        

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
