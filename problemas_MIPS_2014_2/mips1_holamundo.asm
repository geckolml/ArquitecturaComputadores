.data 
 lel:
 .asciiz "Bienvenidos a MIPS\n"
 lel2:
 .asciiz "nananana fapman!!\n"
 str: 
 .asciiz "Hola mundo\n"
 .globl main # espec�fica a main como un s�mbolo global 
 .text 
 main: 
# llamada al sistema para imprimir cadena 
 li $v0, 4 # cargo servicio �4� en el registro $v0 
 la $a0, str # direcci�n de la cadena a imprimir 
 syscall # imprime la cadena 
 la $a0, lel # direcci�n de la cadena a imprimir
 syscall # imprime la cadena 
 la $a0, lel2 # direcci�n de la cadena a imprimir
 syscall # imprime la cadena 
 
# llamada al sistema para terminar y salir 
 li $v0, 10 # cargo servicio �10� en el registro $v0 
 syscall # realiza la acci�n