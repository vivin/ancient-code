#include <iostream.h>
#include <conio.h>
#include <stdio.h>

int ca=0, accn=1000;;

class account
{
		char name[100][25];
		int accno[100];
		float bal[100];

		public:

		void newacc();
		void deposit();
		void withdraw();
};


void account::newacc()
{
	  ca++;
	  x:
	  clrscr();
	  cout<<"Enter your name:";
	  cin>>name[ca];
	  cout<<"Enter your starting balance:";
	  cin>>bal[ca];
	  if(bal[ca]<10)
	  {
		  cout<<"Minimum balance is 10";
		  getche();
		  goto x;
	  }
	  accno[ca]=accn;
	  cout<<"Your account number is:"<<accn;
	  getche();
	  accn++;
}


void account::withdraw()
{
	  int acc;
	  float amtw;
	  clrscr();
	  cout<<"Enter your account number:";
	  cin>>acc;

	  for(int i=1;i<=ca;i++)
	  {
			if(acc==accno[i])
			{
				x:
				clrscr();
				cout<<"Amount to withdraw:";
				cin>>amtw;
				if((bal[i]-amtw)<10)
				{
					cout<<"You are overdrawing your account.\n";
					getche();
					goto x;
				}

				bal[i]-=amtw;
				cout<<"Current balance:"<<bal[i];
				getche();
				goto y;
			}
	  }

	  cout<<"Sorry that account does not exist.\n";
	  getche();
	  y:
}

void account::deposit()
{
	  int acc;
	  float amtw;
	  clrscr();
	  cout<<"Enter your account number:";
	  cin>>acc;

	  for(int i=1;i<=ca;i++)
	  {
			if(acc==accno[i])
			{
				x:
				clrscr();
				cout<<"Amount to deposit:";
				cin>>amtw;
				bal[i]+=amtw;
				cout<<"Current balance:"<<bal[i];
				getche();
				goto y;
			}
	  }

	  cout<<"Sorry that account does not exist.\n";
	  getche();
	  y:
}

void main()
{
	  account Customer;

	  char ch;
	  x:

	  clrscr();

	  cout<<"Menu\n";
	  cout<<"----\n";
	  cout<<"\n";
	  cout<<"1. Open a new account\n";
	  cout<<"2. Withdraw\n";
	  cout<<"3. Deposit\n";
	  cout<<"4. Exit\n\n";

	  cout<<"Enter your choice:";
	  cin>>ch;

	  switch(ch)
	  {
				case '1': Customer.newacc();
							 goto x;
							 break;

				case '2': Customer.withdraw();
							 goto x;
							 break;

				case '3': Customer.deposit();
							 goto x;
							 break;

				case '4': goto y;
							 break;

				default: cout<<"Illegal choice\n";
							getche();
							goto x;
	  }

	  y:
}
