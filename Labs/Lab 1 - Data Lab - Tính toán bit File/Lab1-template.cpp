#include <stdio.h>
int bitAnd(int x, int y)
{
    return x;
}

int negative(int x)
{
    return x;
}

int getByte(int x, int n) {
    return x;
}

int setByte(int x, int n)
{
    return x;
}

int mulpw2(unsigned int x, int n) {
    return x;
}

int isEqual(int x, int y) {
    return x;
}

int is16x(int x) {
    return x;
}

int isPositive(int x) {
    return x;
}

int isGE2n(int x, int n) {
    return x;
}

int main()
{
    int score = 0;
    // 1.1
    printf("1.1 bitAnd");
    if (bitAnd(3, -9) == (3 & -9) && bitAnd(1, 8) == (1 & 8))
    {
        printf("\tPass.");
        score += 1;
    }
    else
        printf("\tFailed.");

    //1.2
    printf("\n1.2 negative");
    if (negative(0) == 0 && negative(9) == -9 && negative(-5) == 5)
    {
        printf("\tPass.");
        score += 1;
    }
    else
        printf("\tFailed.");

    //1.3
    printf("\n1.3 getByte");
    if (getByte(8, 0) == 8 && getByte(0x11223344, 1) == 0x33)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //1.4
    printf("\n1.4 setByte");
    if (setByte(10, 0) == 255 && setByte(0, 1) == 65280 && setByte(0x5501, 2) == 0xFF5501)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //1.5
    printf("\n1.5 mulpw2");
    if (mulpw2(10, -1) == 5 && mulpw2(15, -2) == 3 && mulpw2(50, -2) == 12)
    {
        if (mulpw2(10, 1) == 20 && mulpw2(5, 4) == 80)
        {
            printf("\tAdvanced Pass.");
            score += 4;
        }
        else
        {
            printf("\tPass.");
            score += 3;
        }
    }
    else
        printf("\tFailed.");

    //2.1
    printf("\n2.1 isEqual");
    if (isEqual(2,2)==1 && isEqual(5,-1)==0 && isEqual(0,16)==0 && isEqual(-4,-4)==1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.2
    printf("\n2.2 is16x");
    if (is16x(16) == 1 && is16x(23) == 0 && is16x(0) == 1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.3
    printf("\n2.3 isPositive");
    if (isPositive(16) == 1 && isPositive(0) == 0 && isPositive(-8) == 0)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    //2.4
    printf("\n2.4 isGE2n");
    if (isGE2n(12, 4) == 0 && isGE2n(8, 3) == 1 && isGE2n(15, 2) == 1)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    printf("\n------\nYour score: %.1f", (float)score / 2);
    return 0;
}