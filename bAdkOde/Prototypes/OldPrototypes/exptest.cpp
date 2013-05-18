#include <iostream.h>

void main()
{
     int iv1, iv2;
     float fv1, fv2;
     double dv1, dv2;

     cout<<"Enter iv1:";
     cin>>iv1;

     cout<<"Enter iv2:";
     cin>>iv2;

     cout<<"Enter fv1:";
     cin>>fv1;

     cout<<"Enter fv2:";
     cin>>fv2;

     cout<<"Enter dv1, dv2:";
     cin>>dv1>>dv2;

     cout<<iv2/iv1<<"\n";
     cout<<iv2/fv1<<"\n";
     cout<<iv2/dv1<<"\n";
     
     cout<<fv2/iv1<<"\n";
     cout<<fv2/fv1<<"\n";
     cout<<fv2/dv1<<"\n";

     cout<<dv2/iv1<<"\n";
     cout<<dv2/fv1<<"\n";
     cout<<dv2/dv1<<"\n";
}
  
