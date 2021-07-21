%include "io.mac"

section .data
    res DD 0
    cat DD 0
    num DD 0
    suma DD 0
    count DD 0
    

section .text
    global bin_to_hex
    extern printf

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement bin to hex

    mov dword[res], ecx
    mov dword[cat], 0
    loop:
    cmp dword[res],4
    jg scadere  
    cmp dword[res],4
    je scadere 
    mov dword[suma], 0
    mov dword[num], 0
    mov ebx, dword[res]
    
    cmp dword[res], 1
    je rest_1
    
    cmp dword[res], 2
    je rest_2
    
    cmp dword[res], 3
    je rest_3
    
    fin_rest:
    
    mov al, 48
    add al, byte[suma]
    
    cmp dword[res], 0
    je next
    mov [edx + 0], al
    mov dword[num], 1
    
    next:
    mov dword[count], 0
    mov dword[suma], 0
    
    for_body:
    cmp ebx, ecx
    je for_fin
    
    mov al, [esi + ebx]
    inc dword[count]
    cmp al, 49
    je power
    continuu:
    
    cmp dword[count], 4
    je full_numar
    continu:
     
    inc ebx
    jmp for_body
    for_fin:
    
    PRINTF32 `%s\n\x0`, edx

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
    
scadere:
    sub dword[res],4
    inc dword[cat]
    jmp loop
   
rest_1:
    inc dword[suma]
    jmp fin_rest
    
rest_2:
    mov al, [esi + 0]
    cmp al, 49
    je loop1
    loop_back:
    mov al, [esi + 1]
    cmp al, 49
    je loop2
    jmp fin_rest

loop1:
    add dword[suma], 2
    jmp loop_back
    
loop2:
    inc dword[suma]
    jmp fin_rest
    
rest_3:
    mov al, [esi + 0]
    cmp al, 49
    je lap1
    lap_back1:
    mov al, [esi + 1]
    cmp al, 49
    je lap2
    lap_back2:
    mov al, [esi + 2]
    cmp al, 49
    je lap3
    jmp fin_rest
    
lap1:
    add dword[suma], 4
    jmp lap_back1
    
lap2:
    add dword[suma], 2
    jmp lap_back2
    
lap3:
    inc dword[suma]
    jmp fin_rest
    
full_numar:
    sub dword[count], 4
    cmp dword[suma],10
    jl dela0la9
    next_step1:
    cmp dword[suma],10
    je fix10
    next_step2:
    cmp dword[suma],11
    je fix11
    next_step3:
    cmp dword[suma],12
    je fix12
    next_step4:
    cmp dword[suma],13
    je fix13
    next_step5:
    cmp dword[suma],14
    je fix14
    next_step6:
    cmp dword[suma],15
    je fix15
    next_step7:
    mov dword[suma], 0
    jmp continu
    
dela0la9:
    mov al, 48
    add al, byte[suma]
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step1
  
fix10:
    mov al, 97
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step2 
    
fix11:
    mov al, 98
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step3
    
fix12:
    mov al, 99
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step4
    
fix13:
    mov al, 100
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step5
    
fix14:
    mov al, 101
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step6
    
fix15:
    mov al, 102
    mov dword[cat], ebx
    mov ebx, dword[num]
    mov [edx + ebx], al
    mov ebx, dword[cat]
    inc dword[num]
    jmp next_step7
    
power:
    cmp dword[count], 1
    je salt1
    back1:
    cmp dword[count], 2
    je salt2
    back2:
    cmp dword[count], 3
    je salt3
    back3:
    cmp dword[count], 4
    je salt4
    jmp continuu
    
salt1:
    add dword[suma], 8
    jmp back1
    
salt2:
    add dword[suma], 4
    jmp back2
    
salt3:
    add dword[suma], 2
    jmp back3
    
salt4:
    add dword[suma], 1
    jmp continuu
 
 
 
    
   
