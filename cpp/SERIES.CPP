#include <iostream.h>
#include <math.h>

void main()
{
     unsigned long int n=0, k;

     for(int i=0;i<=4;i++)
     {
         n=pow(10,i)+n;
         k=pow(n,2);
         cout.width(5+i);
         cout<<k<<"\n";
     }
}

