.data
	string: .asciiz "aaaa" #Se declara el string.
.text
la $a0, string #Se carga la direccion base del string en $a0
addi $t2, $t2, 0 #Se establece un contador para las vocales 'a'
addi $t3, $t3, 0 #Se establece un contador para las vocales 'e'
addi $t4, $t4, 0 #Se establece un contador para las vocales 'i'
addi $t5, $t5, 0 #Se establece un contador para las vocales 'o'
addi $t6, $t6, 0 #Se establece un contador para las vocales 'u'

strlen:
	li $t0, 0 #Se establece un contador de caracteres en $t0
loop:
	lbu $t1, 0($a0) #Se asgina la direccion de la primera letra a $t1
	beqz $t1, exit	#Si la letra es igual al caracter nulo, se termina la funcion
	bne $t1, 'a', e #Se comprueba si la letra es igual a 'a'. De no serlo, se pasa a comprobar si la letra es una 'e'
	addi $t2, $t2, 1 #Se suma uno al contador de 'a'
	j finishLoop #Se avanza al final del loop
e:	
	bne $t1, 'e', i #Se comprueba si la letra es una 'e'. De no serlo, se pasa a comprobar si la letra es una 'i'
	addi $t3, $t3, 1 #Se suma uno al contador de 'e'
	j finishLoop #Se avanza al final del loop
i: 	
	bne $t1, 'i', o #Se comprueba si la letra es una 'i'. De no serlo, se pasa a comprobar si la letra es una 'o'
	addi $t4, $t4, 1 #Se suma uno al contador de 'i'
	j finishLoop #Se avanza al final de loop
o: 
	bne $t1, 'o', u #Se comprueba si la letra es una 'o'. De no serlo, se pasa a comprobar si la letra es una 'u'
	addi $t5, $t5, 1 #Se suma uno al contador de 'o'
	j finishLoop #Se avanza al final del loop
u:
	bne $t1, 'u', finishLoop #Se comprueba si la letra es una 'u'. De no serlo, se pasa al final del loop.
	addi $t6, $t6, 1 #Se suma uno al contador de 'u'
finishLoop:
	addi $a0, $a0, 1 #Se avanza un caracter del string
	addi $t0, $t0, 1 #Se suma uno al contador
	j loop #Se vuelve al loop
exit:
