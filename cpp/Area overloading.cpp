#include <iostream.h>
#include <conio.h>
#include <process.h>
#include <math.h>

float area(float s1, float s2, float s3)
{
		int sn1,sn2,sn3;

		sn1=s1+s2;
		sn2=s2+s3;
		sn3=s1+s3;

		if(sn1<s3 || sn2<s1 || sn3<s2)
		{
			cout<<"This triangle is not possible!\n";

			goto x;

		}

		float sm;
		sm=(s1+s2+s3)/2;

		float arx;
		arx=sm*(sm-s1)*(sm-s2)*(sm-s3);

		float ar;
		ar=sqrt(arx);

		return ar;
		x:
		return 0;
}

float area(float l, float b)
{
		float ar;
		ar=l*b;

		return ar;
}

float area(float s)
{
		float ar;
		ar=s*s;

		return ar;
}


void main()
{
	  char ch;

	  float s1, s2, s3, l, b, s, areax;

	  x:

	  clrscr();

	  cout<<"Menu\n";
	  cout<<"----\n\n";
	  cout<<"1. Triangle\n";
	  cout<<"2. Rectangle\n";
	  cout<<"3. Square\n";
	  cout<<"4. Exit\n\n";
	  cout<<"Enter your choice:";
	  cin>>ch;

	  switch(ch)
	  {
				case '1': clrscr();
							 cout<<"Enter sides one, two and three:";
							 cin>>s1>>s2>>s3;
							 areax=area(s1,s2,s3);
							 cout<<"\nArea of triangle is: "<<areax<<" square units";
							 getche();
							 goto x;
							 break;

				case '2': clrscr();
							 cout<<"Enter length and breadth:";
							 cin>>l>>b;
							 areax=area(l,b);
							 cout<<"\nArea of rectangle is: "<<areax<<" square units";
							 getche();
							 goto x;
							 break;

				case '3': clrscr();
							 cout<<"Enter side:";
							 cin>>s;
							 areax=area(s);
							 cout<<"\nArea of square is: "<<areax<<" square units";
							 getche();
							 goto x;
							 break;

				case '4': goto y;

				default : goto x;
	  }

	  y:
}





