#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* DecToHex(int dec){
	char* hex = (char*)calloc(5, sizeof(char));
	unsigned int tempRest, tempDiv = dec, index = 0;

	// CONVERSÃO PARA HEXADECIMAL
	while(tempDiv > 0){
		tempRest = tempDiv%16;
		tempDiv = tempDiv/16;

		if(tempRest < 10){
			char* temp = (char*)calloc(2, sizeof(char));
			temp[0] = '0'+tempRest;
			strcat(hex, temp);
			free(temp);
		} else{
			char* temp = (char*)calloc(2, sizeof(char));
			temp[0] = 'a'+(tempRest-10);
			strcat(hex, temp);
			free(temp);
		}
	}

	// INVERTER A STRING
	unsigned int end = strlen(hex)-1;
	for(int i=0; i<strlen(hex)/2;i++){
		char temp = hex[i];
		hex[i] = hex[end];
		hex[end--] = temp;
	}

	return hex;
}

int main(){
	int decimal = 0;
	printf("Digite um número decimal:\n");
	scanf("%d", &decimal);

	char* result = DecToHex(decimal);
	printf("%d em hexadecimal é %s\n", decimal, result);

	free(result);

	return 0;
}
