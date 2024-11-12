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

//	if(strlen(dado) == 4){
//		limparEntrada();
//	}

	return dado;
}

unsigned int MatrixSize(char** list){
	unsigned int index = 0;
	while(list[index] != NULL){
		index++;
	}
	return index;
}

int main(){
	/*
	printf("Digite o IP de origem: ");
	char* ipOri = ColectInfo(16);
	printf("Digite o IP de destino: ");
	char* ipDes = ColectInfo(16);
	printf("Digite a porta de origem: ");
	char* portOri = ColectInfo(6);
	printf("Digite a porta de destino: ");
	char* portDes = ColectInfo(6);
	*/
	printf("Digite o dado: ");
	char* dado = ColectDados();

	char** dataList = DataToHexNL(dado);
	unsigned int dataListLen = MatrixSize(dataList);
	for(int i=0;i<dataListLen;i++){
		printf("%s\n", dataList[i]);
	}
	printf("Deu?\n");
	/*
	size_t memMatrixSize = 9;
	char** ipOriHex = IPToHex(ipOri);
	char** ipDesHex = IPToHex(ipDes);
	char** dataList = DataToHexNL(dado);
	char** geralList = (char**)malloc(sizeof(char*)*memMatrixSize);
	geralList[0] = ipOriHex[0];
	geralList[1] = ipOriHex[1];
	geralList[2] = ipDesHex[0];
	geralList[3] = ipDesHex[1];
	geralList[4] = AdjustHex(DecToHex(17));
	geralList[5] = AdjustHex(DecToHex(strlen(dado)+8));
	geralList[6] = AdjustHex(DecToHex(atoi(portOri)));
	geralList[7] = AdjustHex(DecToHex(atoi(portDes)));
	geralList[8] = AdjustHex(DecToHex(strlen(dado)+8));


	unsigned int index = 0;
	while(dataList[index] != NULL){
		geralList = (char**)realloc(geralList, sizeof(char*)*++memMatrixSize);
		geralList[memMatrixSize-1] = dataList[index++];
	}
	geralList[memMatrixSize] = NULL;

	printf("Começando\n");
	PrintAll(geralList);
	printf("Finalizado\n");
	char* sum = AdjustHex(HexSumAll(geralList));
	*/
    return 0;
}
