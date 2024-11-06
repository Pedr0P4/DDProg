#include <string.h>
#include <stdlib.h>

char* DecToHex(int dec){
    int tempDiv;
    int tempRest;
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
    int hexSize = memSpace-1;
    for(int i = 0; i < hexSize/2; i++){
        char temp = hex[i];
        hex[i] = hex[hexSize-i-1];
        hex[hexSize-i-1] = temp;
    }
    hex[memSpace-1] = '\0';
    return hex;
}

char* DecToBin(int dec){
    int tempDiv;
    int tempRest;
    int memSpace = 1;
    char* bin = (char*)malloc(sizeof(char)*memSpace);

    //FAZER A CONVERSÃO DOS RESTOS PARA HEXADECIMAL.
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
    int binSize = memSpace-1;
    for(int i = 0; i < binSize/2; i++){
        char temp = bin[i];
        bin[i] = bin[binSize-i-1];
        bin[binSize-i-1] = temp;
    }
    bin[memSpace-1] = '\0';
    return bin;
}