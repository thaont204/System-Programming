#include <iostream>
using namespace std;

int bitAnd(int x, int y)
{
    return ~(~x | ~y);
}

int negative(int x)
{
    return ~x + 1;
}

int getByte(int x, int n)
{
    x = x >> (n << 3);
    return x & 0xff;
}

int setByte(int x, int n)
{

    return x | (0xff << (n << 3));
}

int mulpw2(unsigned long long x, int n)
{
    int tam = !(n >> 31);// n < 0 thi tam = 0
    int tam2 = n >> 31; // n >= 0 thi tam2 = 0
    int kq = ~tam2 & (x << n) | ~tam & (x >> (~n + 1));// khi n >= 0, tam2 =0, ~tam2 =1, 1 & a = a; tuong tu voi truong hop con lai
    return kq;
}

int isEqual(int x, int y) 
{
    // xor => giong nhau = 0, khac nhau la 1
    return !(x ^ y); // lay nguoc gia tri 0->1, 1 ->0
}

int is16x(int x)
{
    return !(x & 0xf);

    // ta co so chia het cho 16 thi 4 bit dau tu phai qua trai luon luon la 0
    // muon chia het cho 16 thi bit 1 phai xuat hien tu bit thu 5 tro di
    // vay  chi can AND voi 4 bit dau la 1111 thi ket qua se luon la 0, lay ! de return 1
    // neu ma tra ve so khac 0, mac dinh se la true tuong ung voi gia tri 1, nghia la no khong chia het cho 16, ta lay ! se return 0
}

int isPositive(int x) 
{
    int k = x + 0xffffffff;// neu x <=0 thi k < 0 => (k >> 31) &  1 = 1, ta lay nguoc 1 la 0
    return !((k >> 31) & 1);// neu x >0 thi k >=0 => (k >> 1) & 1 = 0, lay nguoc 0 la 1
}

int isGE2n(int x, int n)
{
    int k = (x >> n) + 0xffffffff;// k = x/(2^n) -1
    return  !(k>>31); // neu k >= 0 thi k >> 31 =0, x/(2^n) >= 1, suy ra x >= 2^n. Vay ta dung "!" de tra ket qua ve 1 va nguoc lai
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
    if (isEqual(2, 2) == 1 && isEqual(5, -1) == 0 && isEqual(0, 16) == 0 && isEqual(-4, -4) == 1)
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
    if (isGE2n(12, 4) == 0 && isGE2n(8, 3) == 1 && isGE2n(15, 2) == 1 )
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    printf("\n------\nYour score: %.1f", (float)score / 2);
    return 0;
}
