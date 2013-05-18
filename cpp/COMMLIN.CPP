#include <iostream.h>

void main(int argv, char*argc[])
{
     cout<<"You typed:";
     for(int i=1;i<=argv;i++)
     {
	 cout<<argc[i];
     }
}

