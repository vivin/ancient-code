#include <iostream.h>

int count;
float last;

class calc
{
		float a,b;

		char operand;

		public:

		void calculate(float, float, char);
};

void calc::calculate(float c, float d, char op)
{
	  a=c;
	  b=d;
	  operand=op;

	  cout<<"The last result was "<<last<<"\n\n";

	  switch(operand)
	  {
			  case '+': last=a+b;
							break;

			  case '-': last=a-b;
							break;

			  case '*': last=a*b;
							break;

			  case '/': last=a/b;
							break;

			  case '%': last=a*(b/100);
							break;

			  default : cout<<"Error - Unrecognized operation.\n\n";
		 }

		 cout<<"The current result is "<<last<<"\n\n";
		 count++;
}

void main()
{
	  float c,d;

	  char op;

	  x:

	  cout<<count<<" operations have been performed.\n\n";

	  cout<<"Enter two numbers:";
	  cin>>c>>d;

	  cout<<"Enter operation:";
	  cin>>op;


	  calc Opr;

	  Opr.calculate(c, d, op);

	  goto x;
}





