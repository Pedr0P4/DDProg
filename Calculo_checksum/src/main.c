#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* DecToHex(int dec){
	unsigned int memSize = 1;
	char* hex = (char*)calloc(memSize, sizeof(char));
	unsigned int tempRest, tempDiv = dec, index = 0;

	// CONVERSÃO PARA HEXADECIMAL
	while(tempDiv > 0){
		tempRest = tempDiv%16;
		tempDiv = tempDiv/16;
		hex = (char*)realloc(hex, sizeof(char)*++memSize);

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

void AdjustHex(unsigned int length, char** hex) {
    unsigned int size = strlen(*hex);
    if (size < length) {
        unsigned int zeros = length - size;
        char* tempStr = (char*)calloc(zeros + size + 1, sizeof(char));

        if (tempStr == NULL) {
            fprintf(stderr, "Erro ao alocar memória.\n");
            return;
        }

        // Preenche com zeros à esquerda
        for (unsigned int i = 0; i < zeros; i++) {
            tempStr[i] = '0';
        }

        // Copia a string original para tempStr
        strcat(tempStr, *hex);

        // Realoca hex para o novo tamanho
        *hex = (char*)realloc(*hex, sizeof(char) * (zeros + size + 1));
        if (*hex == NULL) {
            fprintf(stderr, "Erro ao realocar memória.\n");
            free(tempStr);
            return;
        }

        // Copia a string ajustada de volta para hex
        strcpy(*hex, tempStr);

        free(tempStr); // Libera a memória temporária
    }
}

int main(){
	int decimal = 0;
	printf("Digite um número decimal:\n");
	scanf("%d", &decimal);

	char* result = DecToHex(decimal);
	AdjustHex(4, &result);
	printf("%d em hexadecimal é %s\n", decimal, result);

	free(result);

	return 0;
}
