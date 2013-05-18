#include <iostream.h>
#include <stdio.h>
#include <conio.h>

class publication
{
      char title[200];
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
     clrscr();

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
     cout<<"\nPlaying time of tape is:"<<playtime<<" minutes";
}

void publication::putdata()
{
     clrscr();

     cout<<"\nTitle: "<<title;

     cout<<"\nPrice: £"<<price;
}

void main()
{
    publication ob1;

    book ob2;

    tape ob3;

    char ch;

    x:

    clrscr();

    cout<<"Menu\n";

    cout<<"----\n\n";

    cout<<"1. Tape\n";

    cout<<"2. Book\n";

    cout<<"3. Exit\n\n";

    cout<<"Enter your choice:";
    cin>>ch;

    switch(ch)
    {
	   case '1': ob1.getdata();
                     ob3.getdata();
		     ob1.putdata();
                     ob3.putdata();
                     getche();
		     break;
                     
	   case '2': ob1.getdata();
                     ob2.getdata();
		     ob1.putdata();
                     ob2.putdata();
                     getche();
                     break;
		     
	   case '3': goto x;
		     break;

	   default : goto y;
		     break;
    }

    goto x;
    y:
}

