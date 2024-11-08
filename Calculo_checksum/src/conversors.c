#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include "C:\Users\SUPORTE\Documents\DDProg\Calculo_checksum\header\operations.h"
#include "C:\Users\SUPORTE\Documents\DDProg\Calculo_checksum\header\conversors.h"


/// @brief Converte de decimal para hexadecimal.
/// @param dec O número decimal.
/// @return O hexadecimal correspondente ao decimal fornecido.
char* DecToHex(unsigned long int dec){
    int tempDiv = 0;
    int tempRest = 0;
    int memSpace = 1;
    char* hex = (char*)malloc(sizeof(char)*memSpace);

    //FAZER A CONVERSÃO DOS RESTOS PARA HEXADECIMAL.
    do{
        if(memSpace == 1){
            tempDiv = dec/16;
            tempRest = dec%16;
        } else{
            tempRest = tempDiv%16;
            tempDiv = tempDiv/16;
        }
        hex[memSpace-1] = tempRest < 10 ? '0' + tempRest : 'A' + (tempRest-10);
        hex = realloc(hex, sizeof(char)*++memSpace);
    } while(tempDiv != 0);

    //INVERTER A STRING.
    const int hexSize = memSpace-1;
    for(int i = 0; i < hexSize/2; i++){
        char temp = hex[i];
        hex[i] = hex[hexSize-i-1];
        hex[hexSize-i-1] = temp;
    }
    hex[memSpace-1] = '\0';
    return hex;
}

/// @brief Converte de decimal para binário.
/// @param dec O número decimal.
/// @return O binário correspondente ao decimal fornecido.
char* DecToBin(unsigned long int dec){
    int tempDiv = 0;
    int tempRest = 0;
    int memSpace = 1;
    char* bin = (char*)malloc(sizeof(char)*memSpace);
    
    //FAZER A CONVERSÃO DOS RESTOS PARA BINÁRIO.
    do{
        if(memSpace == 1){
            tempDiv = dec/2;
            tempRest = dec%2;
        } else{
            tempRest = tempDiv%2;
            tempDiv = tempDiv/2;
        }
        bin[memSpace-1] = '0' + tempRest;
        bin = realloc(bin, sizeof(char)*++memSpace);
    } while(tempDiv != 0);

    //INVERTER A STRING.
    const int binSize = memSpace-1;
    for(int i = 0; i < binSize/2; i++){
        char temp = bin[i];
        bin[i] = bin[binSize-i-1];
        bin[binSize-i-1] = temp;
    }
    bin[memSpace-1] = '\0';
    return bin;
}

/// @brief Converte de hexadecimal para decimal.
/// @param hex O número binário.
/// @return O decimal correspondente ao hexadecimal fornecido.
int HexToDec(char* hex){
	if(hex == NULL) return 0;

    const unsigned int hexSize = strlen(hex);
    int count = hexSize - 1;
    int temp;
    int sum = 0;

    // SOMA DOS CARACTERES HEXADECIMAIS MULTIPLICADOS POR 16 ELEVADO À POSIÇÃO DO CARACTERE NO HEXADECIMAL.
    for(int i = 0; i < hexSize; i++){
        if(hex[i] >= '0' && hex[i] <= '9'){
            temp = hex[i] - '0';
            temp *= (int)pow(16, count--);
            sum += temp;
        } else if(hex[i] >= 'A' && hex[i] <= 'F'){
            temp = hex[i] - 'A' + 10;
            temp *= (int)pow(16, count--);
            sum += temp;
        }
    }

    return sum;
}

/// @brief Converte de binário para decimal.
/// @param bin O número binário.
/// @return O decimal correspondente ao binário fornecido.
int BinToDec(char* bin){
	if(bin == NULL) return 0;

    const unsigned int binSize = strlen(bin);
    int count = binSize-1;
    int temp;
    int sum = 0;

    // SOMA DOS CARACTERES BINÁRIOS MULTIPLICADOS POR 2 ELEVADO À POSIÇÃO DO CARACTERE NO BINÁRIO.
    for(int i = 0; i < binSize; i++){
        if(bin[i] >= '0' && bin[i] <= '9'){
            temp = bin[i] - '0';
            temp *= (int)pow(2, count--);
            sum += temp;
        } else if(bin[i] >= 'A' && bin[i] <= 'F'){
            temp = bin[i] - 'A' + 10;
            temp *= (int)pow(2, count--);
            sum += temp;
        }
    }

    return sum;
}

char* AdjustHex(char* hex){
	size_t size = strlen(hex);
	if(size > 4){	
		unsigned int carry = (unsigned int)size - 4;
		char* tempHexCarry = (char*)malloc(sizeof(char)*carry+1);
		char* tempHex = (char*)malloc(sizeof(char)*5);
		for(int i=0;i<carry;i++){
			tempHexCarry[i] = hex[i];
		}	
		for(int i=carry;i<size;i++){
			tempHex[i-carry] = hex[i];
		}
		tempHexCarry[carry] = '\0';
		tempHex[size-carry] = '\0';
		char* tempResult = HexSum(tempHexCarry, tempHex);
		hex = (char*)realloc(hex, sizeof(char)*5);
		strcpy(hex, tempResult);
		hex[4] = '\0';

		free(tempResult);
		free(tempHexCarry);
		free(tempHex);

		return hex;
	} else if(size < 4){
		unsigned int zeros = 4-size;
		char* tempHex = (char*)calloc(5, sizeof(char));
		hex = (char*)realloc(hex, sizeof(char)*5);

		for(int i=0;i<zeros;i++){
			tempHex[i] = '0';
		}
		strcat(tempHex, hex);
		strcpy(hex, tempHex);
		free(tempHex);

		return hex;
	}

	return hex;
}

char* AdjustHexTwo(char* hex){
	size_t size = strlen(hex);
	if(size < 2){
		unsigned int zeros = 2-size;
		char* tempHex = (char*)calloc(3, sizeof(char));
		hex = (char*)realloc(hex, sizeof(char)*3);

		for(int i=0;i<zeros;i++){
			tempHex[i] = '0';
		}

		strcat(tempHex, hex);
		strcpy(hex, tempHex);
		free(tempHex);

		return hex;
	}

	return hex;
}

char** IPToHex(char* ip){
	unsigned int indexMatrix = 0, index = 0, count = 0;
	char* token;
	char** HexList = (char**)malloc(sizeof(char*)*2);

	for(int i=0;i<2;i++){
		HexList[i] = (char*)calloc(5, sizeof(char));
	}	

	token = strtok(ip, ".");

	while(token != NULL && indexMatrix < 2){
		if(count >= 5) break;

		int dec = atoi(token);

		if(dec < 0 || dec > 255){
			printf("Valor do endereço IP inválido: %d\n", dec);
			free(HexList);
			return NULL;
		}

		char* hex = AdjustHexTwo(DecToHex(dec));

		if(strlen(HexList[indexMatrix]) >= 1 && strlen(HexList[indexMatrix]) < 4){
			HexList[indexMatrix] = strcat(HexList[indexMatrix], hex);
			HexList[indexMatrix][4] = '\0';
			indexMatrix++;
		} else if(strlen(HexList[indexMatrix]) < 2){
			strcpy(HexList[indexMatrix], hex);
		}
		
		count++;
		token = strtok(NULL, ".");
	}
	
//    printf("%s\n", HexList[0]);
//    printf("%s\n", HexList[1]);

	return HexList;
}

char** DataToHex(char* data){
    size_t len = strlen(data);
    int* arr = (int*)calloc(len, sizeof(int));
    int* temp = (int*)calloc(2, sizeof(int));
    unsigned int index = 0, memSize = 1, count = 0, indexMatrix = 0;
    char** dataHexMatrix = (char**)malloc(sizeof(char*)*memSize);

    for(int i=0; data[i]!='\0'; i++){
        arr[i] = (int)data[i];
    }
    arr[len] = '\0';

    while(arr[count] != '\0'){
       if(index == 0 && arr[count+1] == '\0'){
            dataHexMatrix[indexMatrix] = AdjustHex(DecToHex(arr[count++]));
       } else if(index == 0){
            temp[index++] = arr[count++];
       } else if(index == 1){
            temp[index] = arr[count++];
            dataHexMatrix[indexMatrix] = AdjustHexTwo(DecToHex(temp[0]));
            strcat(dataHexMatrix[indexMatrix++], AdjustHexTwo(DecToHex(temp[1])));
            dataHexMatrix = (char**)realloc(dataHexMatrix, sizeof(char*)*++memSize);
            index = 0;
       }
    }

    free(temp);
    return dataHexMatrix;
}

char** DataToHexNL(char* data){
    size_t len = strlen(data);
    int* arr = (int*)calloc(len, sizeof(int));
    int* temp = (int*)calloc(2, sizeof(int));
    unsigned int index = 0, memSize = 1, count = 0, indexMatrix = 0;
    char** dataHexMatrix = (char**)malloc(sizeof(char*)*memSize);

    for(int i=0; data[i]!='\0'; i++){
        arr[i] = (int)data[i];
    }
    arr[len] = '\0';

    while(arr[count] != '\0'){
       if(index == 0 && arr[count+1] == '\0'){
            dataHexMatrix[indexMatrix] = AdjustHexTwo(DecToHex(arr[count++]));
            strcat(dataHexMatrix[indexMatrix], AdjustHexTwo(DecToHex((int)'\n')));
       } else if(index == 0){
            temp[index] = arr[count];
            index++;
            count++;
       } else if(index == 1 && arr[count+1] == '\0'){
            temp[index] = arr[count++];
            dataHexMatrix[indexMatrix] = AdjustHexTwo(DecToHex(temp[0]));
            strcat(dataHexMatrix[indexMatrix++], AdjustHexTwo(DecToHex(temp[1])));
            dataHexMatrix = (char**)realloc(dataHexMatrix, sizeof(char*)*++memSize);
            dataHexMatrix[indexMatrix] = AdjustHex(DecToHex((int)'\n'));
       } else if(index == 1){
            temp[index] = arr[count++];
            dataHexMatrix[indexMatrix] = AdjustHexTwo(DecToHex(temp[0]));
            strcat(dataHexMatrix[indexMatrix++], AdjustHexTwo(DecToHex(temp[1])));
            dataHexMatrix = (char**)realloc(dataHexMatrix, sizeof(char*)*++memSize);
            index = 0;
       }
    }

    free(temp);
    return dataHexMatrix;
}