#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "/home/pedro-paulo/Documentos/DDProg/Calculo_checksum/header/operations.h"
#include "/home/pedro-paulo/Documentos/DDProg/Calculo_checksum/header/conversors.h"

void limparEntrada(){
	int c;
	while((c = getchar()) != '\n' && c != EOF);
}

char* ColectInfo(unsigned int size){
	char* info = (char*)malloc(sizeof(char)*size);
	if(fgets(info, size, stdin) != NULL){
		size_t len = strlen(info);
		if(len > 0 && info[len-1] == '\n'){
			info[len-1] = '\0';
		}
	}

	if(strlen(info) == size-1){
		limparEntrada();
	}
	return info;
}

char* ColectDados(){
	size_t size = 2;
	size_t pos = 0;
	char* dado = (char*)malloc(sizeof(char)*size);
	int c;

	if(!dado){
		fprintf(stderr, "Erro ao alocar memória\n");
		exit(1);
	}

	while((c = getchar()) != '\n' && c != EOF){
		if(pos+1 >= size){
			size *= 2;
			dado = (char*)realloc(dado, sizeof(char)*size);
			if(!dado){
				fprintf(stderr, "Erro ao realocar memória");
				exit(1);
			}
		}
		dado[pos++] = c;
	}
	dado[pos] = '\0';

	if(strlen(dado) == size-1){
		limparEntrada();
	}

	return dado;
}

int main(){
	printf("Digite o IP de origem: ");
	char* ipOri = ColectInfo(16);
	printf("Digite o IP de destino: ");
	char* ipDes = ColectInfo(16);
	printf("Digite a porta de origem: ");
	char* portOri = ColectInfo(6);
	printf("Digite a porta de destino: ");
	char* portDes = ColectInfo(6);
	printf("Digite o dado: ");
	char* dado = ColectDados();
	
	char** ipOriHex = IPToHex(ipOri);
	char** ipDesHex = IPToHex(ipDes);
	char** geralList = (char**)malloc(sizeof(char*)*10);
	geralList[0] = ipOriHex[0];
	geralList[1] = ipOriHex[1];
	geralList[2] = ipDesHex[0];
	geralList[3] = ipDesHex[1];
	geralList[4] = AdjustHex(DecToHex(17));
	geralList[5] = AdjustHex(DecToHex(strlen(dado)+8));
	geralList[6] = AdjustHex(DecToHex(atoi(portOri)));
	geralList[7] = AdjustHex(DecToHex(atoi(portDes)));
	geralList[8] = AdjustHex(DecToHex(strlen(dado)+8));
	geralList[9] = AdjustHex(DecToHex((int)dado[0]));

    return 0;
}
