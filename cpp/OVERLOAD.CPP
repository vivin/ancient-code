#include <iostream.h>

float area(float s) //Square
{
    int a=s*s;
    return a;
}

float area(float h, float b) //Triangle
{
   int a=0.5*h*b;
   return a;
}

float area(float h, float b, float d) //Parallelogram
{
    int a=h*b;
    return a;
}

float area(float l, float b, float d, float d2) //Rectangle
{
    int a=l*b;
    return a;
}


void main()
{
     float ht, base, ht2, length, base2, breadth, side, dummy, dummy1, dummy2;
           
     cout<<"Yo man! Wassup man?\n";

     cout<<"Enter Height of triangle:";
     cin>>ht;

     cout<<"\nEnter Base of triangle:";
     cin>>base;

     cout<<"\nEnter Height of parallelogram:";
     cin>>ht2;

     cout<<"\nEnter Base of parallelogram:";
     cin>>base2;

     cout<<"\nEnter Breadth of rectangle:";
     cin>>breadth;

     cout<<"\nEnter Length of rectangle:";
     cin>>length;

     cout<<"\nEnter Side of Square:";
     cin>>side;

     float square, parallelogram, triangle, rectangle;

     square=area(side);

     parallelogram=area(ht2, base2, dummy);

     triangle=area(ht, base);

     rectangle=area(length, breadth, dummy1, dummy2);

     cout<<"Square:"<<square<<"\n";

     cout<<"Parallelogram:"<<parallelogram<<"\n";

     cout<<"Triangle:"<<triangle<<"\n";

     cout<<"Rectangle:"<<rectangle<<"\n";

}

