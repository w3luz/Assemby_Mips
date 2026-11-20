# 71. Fazer um algoritmo que receba um numero octal (1 < numero < 10000 e, caso nao seja, deve ser novamente solicitado) e converta para decimal.
.data
msg_pede: .asciiz "Digite um numero octal: "
msg_resp: .asciiz "Decimal: "

.text
main:
    li $t9, 10
    li $t1, 1
    li $t2, 10000
    li $t3, 7
inicio:
    li $v0, 4
    la $a0, msg_pede
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    ble $s0, $t1, inicio
    bge $s0, $t2, inicio
    move $s1, $s0
    li $s4, 0
    li $s3, 1
loop:
    ble $s1, $zero, fim_loop
    rem $s2, $s1, $t9
    div $s1, $s1, $t9
    bgt $s2, $t3, inicio
    mul $t0, $s2, $s3
    add $s4, $s4, $t0
    sll $s3, $s3, 3
    j loop
fim_loop:
    li $v0, 4
    la $a0, msg_resp
    syscall
    li $v0, 1
    move $a0, $s4
    syscall
    li $v0, 10
    syscall
