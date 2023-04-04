.arch armv8-a

.data
    .equ DJB2_MAGIC, 5381
    .global djb2_ccc

.text
_djb2:
    ldrb w5, [x6], #1
    cmp w5, #0
    b.eq fin 
    lsl x1, x0, #5
    add x0, x0, x1
    add x0, x0, x5    
    b.ne _djb2
fin:
    ret

djb2_ccc:   
    stp x5, x6, [sp, #-16]!
    stp lr, x0, [sp, #-16]!
    mov x0, DJB2_MAGIC
    ldp x3, x6, [sp], #16
    bl _djb2
    mov lr, x3
    mov x0, [x1]
    ldp x5, x6, [sp], #16     
    ret
