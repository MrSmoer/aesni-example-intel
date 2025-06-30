section .data
    Key: dq 0xabf7158809cf4f3c, 0x2b7e151628aed2a6
  ;#  Key: dq 0xa6d2ae2816157e2b, 0x3c4fcf098815f7ab ; the other endianness
    
    generated_keys: times 11 dq 0, 0

section .text
    global _start

_start:
    movdqu xmm1,[Key]
    movdqu [generated_keys], xmm1
    lea ecx, [generated_keys+16]
    aeskeygenassist xmm2, xmm1, 0x1
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x2
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x4
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x8
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x10
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x20
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x40
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x80
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x1b
    call key_expansion_128
    aeskeygenassist xmm2, xmm1, 0x36
    call key_expansion_128

end: mov     eax, 1
    mov     ebx, 0
    int     0x80


key_expansion_128:
    pshufd xmm2, xmm2, 0xff
    vpslldq xmm3, xmm1, 0x4
    pxor xmm1, xmm3
    vpslldq xmm3, xmm1, 0x4
    pxor xmm1, xmm3
    vpslldq xmm3, xmm1, 0x4
    pxor xmm1, xmm3
    pxor xmm1, xmm2
    movdqu [ecx], xmm1
    add ecx, 0x10
    ret
