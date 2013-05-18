#include <iostream.h>
#include <conio.h>
#include <process.h>
#include <stdio.h>
#include <dos.h>

float result=0;

class calculate
{
      public:

      void add(int);
      void sub(int);
      void mul(int);
      void div(int);
};

void calculate::add(int num)
{
     result+=num;
}


void calculate::sub(int num)
{
     result-=num;
}

void calculate::mul(int num)
{
     result*=num;
}

void calculate::div(int num)
{
     if(num==0)
     {
	gotoxy(1,18);

	cout<<"Error - Division by 0 not permitted.";
	goto End;
     }

     nosound();

     result/=num;
     End:
}

void main()
{
     clrscr();

     calculate calc;
     char op;
     int ap=0, getnum=0, getop=0, DoAdd=0, DoSub=0, DoMul=0, DoDiv=0, Num=0;

     cout<<"|==========================================================================|\n";
     cout<<"|[7]\t\t\t[8]\t\t\t[9]\t\t\t[+]|\n";
     cout<<"|                                                                          |\n";
     cout<<"|[4]\t\t\t[5]\t\t\t[4]\t\t\t[-]|\n";
     cout<<"|                                                                          |\n";
     cout<<"|[3]\t\t\t[2]\t\t\t[1]\t\t\t[*]|\n";
     cout<<"|                                                                          |\n";
     cout<<"|[0]\t\t\t\t\t\t\t\t\t[/]|\n";
     cout<<"|==========================================================================|\n";

     TakeNum:

     gotoxy(27,8);

     cout<<"                                 ";

     gotoxy(27,8);

     cout<<"The current result is:"<<result;

     OpGet:

     gotoxy(30,22);

     cout<<"Enter the operation/number here:";

     op=getche();

     if(getnum==1)
     {
	goto OpSel;
     }

     ap=op;

     switch(ap)
     {
	    case 48: if(DoAdd==1)
		     {
			Num=0;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=0;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=0;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=0;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=0;
		     }

		     goto OpGet;

		     break;

	    case 49: if(DoAdd==1)
		     {
			Num=1;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=1;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=1;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=1;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=1;
		     }

		     goto OpGet;

		     break;

	    case 50: if(DoAdd==1)
		     {
			Num=2;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=2;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=2;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=2;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=2;
		     }

		     goto OpGet;

		     break;

	    case 51: if(DoAdd==1)
		     {
			Num=3;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=3;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=3;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=3;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=3;
		     }

		     goto OpGet;

		     break;

	    case 52: if(DoAdd==1)
		     {
			Num=4;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=4;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=4;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=4;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=4;
		     }

		     goto OpGet;

		     break;

	    case 53: if(DoAdd==1)
		     {
			Num=5;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=5;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=5;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=5;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=5;
		     }

		     goto OpGet;

		     break;

	    case 54: if(DoAdd==1)
		     {
			Num=6;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=6;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=6;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=6;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=6;
		     }

		     goto OpGet;

		     break;

	    case 55: if(DoAdd==1)
		     {
			Num=7;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=7;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=7;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=7;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=7;
		     }

		     goto OpGet;

		     break;

	    case 56: if(DoAdd==1)
		     {
			Num=8;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=8;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=8;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=8;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=8;
		     }

		     goto OpGet;

		     break;

	    case 57: if(DoAdd==1)
		     {
			Num=9;
			goto Add;
		     }

		     if(DoSub==1)
		     {
			Num=9;
			goto Sub;
		     }

		     if(DoMul==1)
		     {
			Num=9;
			goto Mul;
		     }

		     if(DoDiv==1)
		     {
			Num=9;
			goto Div;
		     }

		     else
		     {
		       getnum=1;
		       Num=2;
		     }

		     goto OpGet;

		     break;

	    default: goto TakeNum;
		     break;

     }

     OpSel:

     switch(op)
     {
	    case '+': if(getnum==1)
		      {
			 goto Add;
		      }
		      else
		      {
			 DoAdd=1;

			 goto TakeNum;
		      }
		      break;

	    case '-': if(getnum==1)
		      {
			 goto Sub;
		      }
		      else
		      {
			 DoSub=1;

			 goto TakeNum;
		      }
		      break;

	    case '*': if(getnum==1)
		      {
			 goto Mul;
		      }
		      else
		      {
			 DoSub=1;

			 goto TakeNum;
		      }
		      break;

	    case '/': if(getnum==1)
		      {
			 goto Div;
		      }
		      else
		      {
			 DoDiv=1;

			 goto TakeNum;
		      }
		      break;

     }

     Add:

     calc.add(Num);
     ap=0;
     getnum=0;
     DoAdd=0;
     DoSub=0;
     DoMul=0;
     DoDiv=0;
     goto TakeNum;

     Sub:

     calc.sub(Num);
     ap=0;
     getnum=0;
     DoAdd=0;
     DoSub=0;
     DoMul=0;
     DoDiv=0;
    goto TakeNum;

     Mul:

     calc.mul(Num);
     ap=0;
     getnum=0;
     DoAdd=0;
     DoSub=0;
     DoMul=0;
     DoDiv=0;
     goto TakeNum;

     Div:

     calc.div(Num);
     ap=0;
     getnum=0;
     DoAdd=0;
     DoSub=0;
     DoMul=0;
     DoDiv=0;
     goto TakeNum;

}

