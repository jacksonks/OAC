.data                                                  #ALOCA OS DADOS NO PROXIMO ENDERE�O DISPONIVEL DE FORMA SEQUENCIAL
	Numero1: .asciiz "informe o primeiro numero: " #PARA USAR STRING NO PSEGMENTO DE DADOS (ALGORITMO/PROGRAMA/CODIGO)
	Numero2: .asciiz "informe o segundo numero: "
	Resultado: .asciiz "resulado: "
.text                            #ALOCA AS INSTRU��ES DOS DADOS NO PROXIMO ENDERE�O DISPONIVEL DE FORMA SEQUENCIAL
	li $v0,4                 #CARREGA O SERVI�O NO RESGISTRADOR $v0,4 (STRING) == PRINT / LOAD IMEDIATALY / INSTRU��ES IMEDIATAS
	la $a0,Numero1           #CARREGA O ARGUMENTO DE VALOR NO REGISTRADOR $a0 == INPUT / CARREGA O ENDERE�O NO REGISTRADOR $a0
	syscall                  #PADR�O;PODEMOS USAR OS MESMOS REGISTRADORES PARA A SEGUNDA ENTRADA PQ ELE ZERA EM SYSCALL
	
	li $v0,5                 #ARMAZENA / LER INTEIRO.
	syscall
	
	move $t0,$v0             #MOVE O VALOR DIGITADO DE UM REGISTRADOR PARA OUTRO.NO CASO $v0 PARA $t0.
	
	li $v0,4
	la $a0,Numero2
	syscall
	
	li $v0,5
	syscall
	
	move $t1,$v0
	
	mult $t0,$t1
	
	mflo $a3                #MOVER O RESULTADO DA MULTIPLICA��O PARA O REGISTARDOR $a3;
	
	li $v0,4
	la $a0,Resultado
	syscall
	
	li $v0,1                #PRINTAR UM INTEIRO == PRINT INT
	move $a0,$a3
	syscall
