#Autor: Gabriel Gaete
#	Vicente Hernández
#Profesor de Laboratorio: Luis Ríos Sepúlveda.
#Asignatura: Estructuras De Computadores
#Fecha: 1/12/2017
#Laboratorio N°6 "Manejo de strings."

.data
	string: .asciiz "texto de prueba."                                       #Se declara el string a transformar en mayúsculas.
	stringMayus: .space 300                                            #Se pide memoria para almacenar el string
	texto1: "La frase en mayúscula es: "                               #Se declaran distintos string para mostrar por pantalla
	texto2: "\nLargo del string: "
	texto3: "\n\nCantidad de vocales 'A' encontradas: "
	texto4: "\nCantidad de vocales 'E' encontradas: "
	texto5: "\nCantidad de vocales 'I' encontradas: "
	texto6: "\nCantidad de vocales 'O' encontradas: "
	texto7: "\nCantidad de vocales 'U' encontradas: "
.text

la $t7, string       #Se carga la dirección base del string a transformar en mayúsculas
la $t8, stringMayus  #Se carga la dirección base del string vacío donde se guardará la palabra en mayúscula
addi $t2, $t2, 0     #Se establece un contador para las vocales 'a'
addi $t3, $t3, 0     #Se establece un contador para las vocales 'e'
addi $t4, $t4, 0     #Se establece un contador para las vocales 'i'
addi $t5, $t5, 0     #Se establece un contador para las vocales 'o'
addi $t6, $t6, 0     #Se establece un contador para las vocales 'u'

strlen:
	li $t0, 0    #Se establece un contador de caracteres en $t0
	
loop: 
	lbu $t1, 0($t7)     #Se carga la letra de la palabra
	beq $t1, 0, exit    #Si la letra es el caracter nulo, el programa termina
    	blt $t1, 'a', count #Si la letra es menor al valor de 'a', quiere decir que ya es una mayuscula, o una letra que no debe ser capitalizada
	bgt $t1, 'z', count #Si la letra es mayor al valor de 'z', quiere decir que no debe ser capitalizada.
	sub $t1, $t1, 32    #Se le resta 32 a la letra, con el fin de ser capitalizada

count:
	beqz $t1, exit	  #Si la letra es igual al caracter nulo, se termina la funcion
	bne $t1, 0x41, e  #Se comprueba si la letra es igual a 'a'. De no serlo, se pasa a comprobar si la letra es una 'e'
	addi $t2, $t2, 1  #Se suma uno al contador de 'a'
	j finishLoop      #Se avanza al final del loop
e:	
	bne $t1, 'E', i  #Se comprueba si la letra es una 'e'. De no serlo, se pasa a comprobar si la letra es una 'i'
	addi $t3, $t3, 1 #Se suma uno al contador de 'e'
	j finishLoop     #Se avanza al final del loop
i: 	
	bne $t1, 'I', o  #Se comprueba si la letra es una 'i'. De no serlo, se pasa a comprobar si la letra es una 'o'
	addi $t4, $t4, 1 #Se suma uno al contador de 'i'
	j finishLoop     #Se avanza al final de loop
o: 
	bne $t1, 'O', u  #Se comprueba si la letra es una 'o'. De no serlo, se pasa a comprobar si la letra es una 'u'
	addi $t5, $t5, 1 #Se suma uno al contador de 'o'
	j finishLoop     #Se avanza al final del loop
u:
	bne $t1, 'U', finishLoop #Se comprueba si la letra es una 'u'. De no serlo, se pasa al final del loop.
	addi $t6, $t6, 1         #Se suma uno al contador de 'u'
finishLoop:
	
	sb $t1, 0($t8)	 #Se guarda el caracter en mayúscula en el nuevo string
	addi $t8, $t8, 1 #Se avanza un caracter en el string con mayúsculas
	addi $t7, $t7, 1 #Se avanza un caracter del string el cual se está transformando a mayúsculas
	addi $t0, $t0, 1 #Se suma uno al contador
	j loop           #Se vuelve al loop
exit:
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto1 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	la $a0, stringMayus   #Se carga la palabra en mayúsculas
	syscall               #Se hace una llamada al sistema
	la $a0, texto2        #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t0, $zero   #Se carga en $a0 el largo del string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto3 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t2, $zero   #Se carga en $a0 la cantidad de vocales 'A' a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto4 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t3, $zero   #Se carga en $a0 la cantidad de vocales 'E' a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto5 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t4, $zero   #Se carga en $a0 la cantidad de vocales 'I' a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto6 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t5, $zero   #Se carga en $a0 la cantidad de vocales 'O' a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 4             #Se carga en $v0 la opción que permite mostrar un string
	la $a0, texto7 	      #Se carga en $a0 un string a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	li $v0, 1             #Se carga en $v0 la opción que permite mostrar un número entero
	add $a0, $t6, $zero   #Se carga en $a0 la cantidad de vocales 'U' a mostrar por pantalla
	syscall               #Se hace una llamada al sistema
	
   	li $v0, 10            #Se carga en $v0 la opción que permite terminar el programa de manera correcta.
    	syscall               #Se hace una llamada al sistema
