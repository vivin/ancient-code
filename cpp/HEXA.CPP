#include <iostream.h>

void main()
{
     char a[200];
     long int num, h, i, x=0, j;
     cout<<"Enter dec:";
     cin>>num;
     while(num!=0)
     {
           h=num%16;
           if(h>9)
           {
              switch(h)
              {
                     case 10: a[i]='A';
                     break;

                     case 11: a[i]='B';
                     break;

                     case 12: a[i]='C';
                     break;

                     case 13: a[i]='D';
                     break;

                     case 14: a[i]='E';
                     break;

                     case 15: a[i]='F';
                     break;

               }
           }
           a[i]=x+48;
           h=num/16;
           i++;
     }
     cout<<"Hexa:"<<h;
}



