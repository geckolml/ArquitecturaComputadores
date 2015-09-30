## contador_de_vocales.asm - imprime el n�mero de vocales que hay en la cadena str
##	a0 - apunta a la cadena
#################################################
#					 	#
#     	 	segmento de datos		#
#						#
#################################################
	.data
text_r:	.asciiz "El n�mero de vocales es :"
str:	.asciiz "long time ago in a galaxy far away, hace mucho tiempo"
endl:	.asciiz "\n"
#################################################
#					 	#
#		segmento de texto		#
#						#
#################################################
	.text		
       	.globl __start 
__start:		# la ejecuci�n empieza aqu�
	la $a0,str
#	$a0 - contiene direcci�n de la cadena
#	$s0 - contador del n�mero de vocales
#	$v0 - el n�mero de vocales
	li $s0,0	# contador de vocales
	move $s1,$a0	# direcci�n de la cadena
siguientec:	
	lb $a0,($s1)	# consigue cada caracter; lb:load byte
	beqz $a0,done	# zero marca el final
	li $v0,0
	beq  $a0,'a',si
	beq  $a0,'e',si
	beq  $a0,'i',si
	beq  $a0,'o',si
	beq  $a0,'u',si
	b sale
si:	li $v0,1
sale:
	add $s0,$s0,$v0	# a�ade 0 o 1 al contador,$s0=$s0 + $v0
	add $s1,$s1,1	# se mueve a lo largo de la cadena
	b siguientec
done:	
#Imprime primer mensaje:"El n�mero de vocales es :"
	la $a0,text_r	# pone la direcci�n de la cadena en a0
	li $v0,4	# llamada al sistema para imprimir
	syscall		# la cadena

# imprime el resultado
	move $a0,$s0
	li $v0,1
	syscall
	 	
	la $a0,endl
	li $v0,4
	syscall 	# imprime nueva l�nea

	li $v0,10
	syscall		# termina y sale
