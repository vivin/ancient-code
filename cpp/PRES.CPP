#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <process.h>
#include <string.h>

struct pres
{
       char pref[5][5], fname[15][5], lname[15][5];
};

struct record
{
       char cname[15][5], capital[15][5];
       pres name;
};

void main()
{
     clrscr();

     gotoxy(20,1);

     int n;
     char ch, cns[15], cps[15];


     cout<<"Enter the number of countries:";
     cin>>n;

     clrscr();

     gotoxy(20,1);

     cout<<"Record Country information";

     record cstuff;

     for(int i=1;i<=n;i++)
     {
	 cout<<"\n\nEnter name of the country:";
	 cin>>cstuff.cname[i];

	 cout<<"\n\nEnter the capital of the country:";
	 cin>>cstuff.capital[i];

	 cout<<"\n\nEnter prefix of president:";
	 cin>>cstuff.name.pref[i];

	 cout<<"\n\nEnter first name of president:";
	 cin>>cstuff.name.fname[i];

	 cout<<"\n\nEnter last name of president:";
	 cin>>cstuff.name.lname[i];
     }

     Begin:

     clrscr();

     cout<<"*************";
     cout<<"\nSearch Engine";
     cout<<"\n*************";
     cout<<"\n\n1. By Country";
     cout<<"\n\n2. By Capital";
     cout<<"\n\n3. Exit\n\n";

     cin>>ch;

     switch(ch)
     {
	    case '1': goto CnSearch;
		      break;

	    case '2': goto CaSearch;
		      break;

	    case '3': goto End;
		      break;

	    default : goto Begin;
		      break;
     }

     CnSearch:

     clrscr();

     cout<<"Enter the country you wish to search for:";

     cin>>cns;

     for(i=1;i<=n;i++)
     {
	 if(strcmp(cns, cstuff.cname[i])==0)
	 {
	    cout<<"Country:"<<cstuff.cname[i];

	    cout<<"\nCapital:"<<cstuff.capital[i];

	    cout<<"\nPresident:"<<cstuff.name.pref[i]<<" "<<cstuff.name.fname[i]<<" "<<cstuff.name.lname[i];
	 }
     }

     getche();

     goto Begin;

     CaSearch:

     clrscr();

     cout<<"Enter the capital you wish to search for:";

     cin>>cps;

     for(i=1;i<=n;i++)
     {
	 if(strcmp(cps, cstuff.capital[i])==0)
	 {
	    cout<<"Country:"<<cstuff.cname[i];

	    cout<<"\nCapital:"<<cstuff.capital[i];

	    cout<<"\nPresident:"<<cstuff.name.pref[i]<<" "<<cstuff.name.fname[i]<<" "<<cstuff.name.lname[i];
	 }
     }

     getche();

     goto Begin;

     End:

}