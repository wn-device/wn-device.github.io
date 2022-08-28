#include <iostream>
#include <stdio.h>
#include <string.h>
#include <math.h>
int main()
{
    int n=1023*9,b=0,n_gau = 1023*16;
    unsigned short uint10[n];
    unsigned short uint10_gau[n_gau];
    int sum=0;
    int sum_g = 0;
    for(int i=1;i<n;i++)
    {
        sum=i*455;
        unsigned int x =(unsigned int) (sum+(int)pow(2,11)-1);
        uint10[i] = (unsigned short)(x>>12);
        int a = uint10[i];
        int b=a;
    }
    FILE *fp;
    fp = fopen("test_mean.dat","wb");
    fwrite(uint10,sizeof(unsigned short),n,fp);
    fclose(fp);
    for(int i=1;i<n_gau;i++)
    {
        sum_g=i;
        uint10_gau[i]=(unsigned short)((sum_g+(int)pow(2,3)-1)>>4);
        int a = uint10_gau[i];
        int b=a;
    }




    fp = fopen("test_gaussian.dat","wb");
    fwrite(uint10_gau,sizeof(unsigned short),n_gau,fp);
    fclose(fp);

    std::cout<<"time_least"<<n<<std::endl;
    std::cout<<"time_least"<<uint10[5]<<std::endl;
}
