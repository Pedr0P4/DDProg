#include "/home/pedro-paulo/Documentos/DDProg/Calculo_checksum/header/operations.h"
#include "/home/pedro-paulo/Documentos/DDProg/Calculo_checksum/header/conversors.h"
#include <stdio.h>

char* HexSum(char* hex1, char* hex2){
	int dec1 = HexToDec(hex1);
	int dec2 = HexToDec(hex2);
	return DecToHex(dec1+dec2);
}

char* BinSum(char* bin1, char* bin2){
	int dec1 = BinToDec(bin1);
	int dec2 = BinToDec(bin2);
	return DecToBin(dec1+dec2);
}

char* HexSumAll(char** hexList){
	unsigned int indexMatrix = 0;
	char* tempHex = NULL; 
	while(hexList[indexMatrix] != NULL){
		tempHex = HexSum(tempHex, hexList[indexMatrix++]);
	}
	return tempHex;
}

char* BinSumAll(char** binList){
	unsigned int indexMatrix = 0;
	char* tempBin = NULL; 
	while(binList[indexMatrix] != NULL){
		tempBin = HexSum(tempBin, binList[indexMatrix++]);
	}
	return tempBin;
}

/*
int main(){

	printf("%s\n", DecToHex(10));

	return 0;
}
*/
