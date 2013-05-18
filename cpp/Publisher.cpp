#include <iostream.h>
#include <stdio.h>
#include <conio.h>

class publication
{
		char title[100];
		float price;

		public:

		void getdata();

		void putdata();
};


class book:public publication
{

		int pagecount;

		public:

		void getdata();

		void putdata();
};

class tape
{
		float playtime;

		public:

		void getdata();

		void putdata();
};


void book::getdata()
{
	  cout<<"\nEnter page count:";
	  cin>>pagecount;
}

void tape::getdata()
{
	  cout<<"\nEnter playing time:";
	  cin>>playtime;
}


void publication::getdata()
{
	  cout<<"\nEnter title:";
	  gets(title);

	  cout<<"\nEnter price:";
	  cin>>price;
}

void book::putdata()
{
	  cout<<"\nPage count of book is:"<<pagecount;
}

void tape::putdata()
{
	  cout<<"\nThe playing time is:"<<playtime;
}

void publication::putdata()
{
	  cout<<"\nThe title:"<<title;
	  cout<<"\nPrice:£"<<price;
}

void main()
{
	  publication ob1;

	  book ob2;

	  tape ob3;

	  char ch;

	  y:

	  clrscr();

	  cout<<"Menu\n";
	  cout<<"----\n";
	  cout<<"\n";
	  cout<<"1. Book\n";
	  cout<<"2. Tape\n";
	  cout<<"3. Exit\n";
	  cout<<"\nEnter your choice:";

	  cin>>ch;

	  switch(ch)
	  {
		 case '1': clrscr();
					  ob1.getdata();
					  ob2.getdata();
					  ob1.putdata();
					  ob2.putdata();
					  getche();
					  goto y;
					  break;

		 case '2': clrscr();
					  ob1.getdata();
					  ob3.getdata();
					  ob1.putdata();
					  ob3.putdata();
					  getche();
					  goto y;
					  break;

		 case '3': goto x;
					  break;

		 default : goto y;
	  }

	  x:
}
