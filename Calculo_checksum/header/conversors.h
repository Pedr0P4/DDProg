#ifndef CONVERSORS_H
#define CONVERSORS_H

char* DecToHex(unsigned long int dec);

char* DecToBin(unsigned long int dec);

int HexToDec(char* hex);

int BinToDec(char* bin);

char* AdjustHex(char* hex);

char* AdjustHexTwo(char* hex);

char** IPToHex(char* ip);

char** DataToHex(char* data);

char** DataToHexNL(char* data);

#endif //CONVERSORS_H
