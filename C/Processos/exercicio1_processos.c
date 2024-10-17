#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(){
	pid_t pid1, pid2;

	//Cria o filho 1.
	pid1 = fork();

	//Se o valor de retorno da criação do filho 1 for inferior a 0, então houve um erro.
	if(pid1 < 0){
		printf("Erro ao criar filho de pid: %d\n", pid1);
		return 1;
	} else if(pid1 == 0){ //Caso o valor de retorno da criação do filho 1 for 0 (para o filho 1 o pid1 é 0), então executa os comandos do filho.
		int n = 100;

		printf("Filho 1 foi criado\n");
		for(int i = 0; i < 100; i++){
			printf("[FILHO1 %d]: %d\n", getpid(), n++);
			sleep(1);
		}
		printf("Filho 1 vai morrer\n");
	} else{ //Caso contrário, executa o processo Pai prossegue.
		//Cria o filho 2.
		pid2 = fork();

		//Se o valor de retorno da criação do filho 2 for inferior a 0, então houve um erro.
		if(pid2 < 0){
			printf("Erro ao criar filho de pid: %d\n", pid2);
			return 1;
		}  else if(pid2 == 0){ //Caso o valor de retorno da criação do filho 2 for 0 (para o filho 2 o pid2 é 0), então executa os comandos do filho.
			int n = 200;

			printf("Filho 2 foi criado\n");
			for(int i = 0; i < 100; i++){
				printf("[FILHO2 %d]: %d\n", getpid(), n++);
				sleep(1);
			}
			printf("Filho 2 vai morrer\n");
		} else{	//Caso contrário, o processo Pai prossegue.
			int n = 1;
		
			for(int i = 0; i < 50; i++){
				printf("[PAI %d]: %d\n", getpid(), n++);
				sleep(2);
			}
			printf("Processo Pai vai morrer\n");
		}
	}

	return 0;
}
