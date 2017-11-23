#Autor: Gabriel Gaete
#	Vicente Hernández
#Profesor de Laboratorio: Luis Ríos Sepúlveda.
#Asignatura: Estructuras De Computadores
#Fecha: 23/11/2017
#Laboratorio N°5 "Mayor y menor de un arreglo"

.data
list: .word  2,1,3,100,5, 7, 9, 1000, 0, -1      #Se define el arreglo de números.
str1: .asciiz "“Ingrese el largo del arreglo: "  #Se define el string que se mostrará por pantalla.
M1_1:.space 4                                    #Se asigna la cantidad de bytes que se almacenará en M1_1. Con 4 bytes se puede almacenar un entero.
.text
.globl main

main:
	addi $v0, $0, 4     #Se establece en $v0 que se mostrará por pantalla un string.
	la   $a0, str1 	    #Se carga en $a0 el string 
	syscall             #Se imprime la pregunta que pide la cantidad de elementos del arreglo.
	addi $v0, $0, 5     #Se lee un número entero.
	syscall 	    #Se espera que el usuario ingrese la cantidad de elementos del arreglo.
	la $t4, M1_1 	    #Se guarda la base de un arreglo en $t4
	sw $v0, 0($t4)      #En 0($t4) se carga ellargo del arreglo

la $a0, list        #Se almacena la dirección base del arreglo en $a0
lw $a1, 0($t4)      #Se carga en $a1 el largo del arreglo, contenido en 0($t4).
li $t0, 1           #Se inicia un contador en 1
lw $t1, 0($a0)      #Se establece el primer elemento del arreglo como el máximo. Se almacena en $t1.
lw $t5, 0($a0)      #Se establece el primer elemento del arreglo como el mínimo. Se almacena en $t5.

A: lw $t3, 4($a0)       #Se almacena el valor contenido en el arreglo[contador]
   blt $t3, $t1, C      #Se compara el elemento mayor actual, con el elemento del arreglo
   addi $t1, $t3, 0     #En caso que el elemento del arreglo[contador] sea mayor o igual al actual mayor, el elemento mayor se actualiza.
C: bgt $t3, $t5, B      #Se compara el elemento menor actual, con el elemento del arreglo
   addi $t5, $t3, 0     #En caso que el elemento del arreglo[contador] sea menor o igual al actual menor, el elemento menor se actualiza.	
B: addi $t0, $t0, 1     #El contador aumenta en 1
   addi $a0, $a0, 4     #Se carga la siguiente posición del arreglo
   blt $t0, $a1, A      #Se determina si aún queda arreglo por recorrer
   add $v1, $t1, $zero  #El elemento mayor ($t1), se guarda en $v1   
   add $v0, $t5, $zero  #El elemento menor ($t5), se guarda en $v0
   
