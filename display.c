#include <stdio.h>

extern unsigned char ram[];
extern int fill_ram(void);      

int main()
{
    printf("Enter two strings, one per line:\n");   

    int distance = fill_ram();                      

    printf("Hamming distance: %d\n", distance);    

    return 0;
}