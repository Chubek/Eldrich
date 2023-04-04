.arch generic64

.data
    .equ DJB2_MAGIC, 5381
    .global djb2_ccc

.text
_djb2:
    movb (%rdi, %rcx, 1), %al
    inc %rcx
    cmpb $0, %al 
    je fin
    movq %r11, %r12
    shlq $5, %r12
    addq %r12, %r11
    addq %rax, %r11
    jne _djb2
fin:
    ret

djb2_ccc:
    push %r12
    movq $DJB2_MAGIC, %r11
    movq $0, %rcx
    call _djb2
    movq %r11, (%rsi)
    pop %r12
    ret

