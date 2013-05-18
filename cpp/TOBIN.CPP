#include <iostream.h>

void main()
{
     int dec, bin[100],q,i=0;

     cout<<"Dec:";
     cin>>dec;

     while(dec!=0)
     {
           bin[i]=dec%2;
           q=dec/2;
           dec=q;
           i++;
     }

     for(int j=i-1;j>=0;j--)
     {
         cout<<bin[j];
     }
}







