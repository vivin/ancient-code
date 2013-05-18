#include <iostream.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>

void main()
{
	  int stock[10], number, searchflag=0, nbuy, i;

	  float price[10];

	  char title[10][40], author[10][40], publisher[10][40], ch;
	  char tsearch[40], asearch[40];

	  x:

	  clrscr();

	  cout<<"Menu\n";
	  cout<<"----\n\n";
	  cout<<"1)Enter list\n";
	  cout<<"2)Buy book\n";
	  cout<<"3)Exit\n\n";

	  cout<<"Enter your choice:";
	  cin>>ch;

	  switch(ch)
	  {
				case '1': goto EnterList;
							 break;

				case '2': goto BuyBook;
							 break;

				case '3': goto Exit;
							 break;

				default : goto x;
							 break;
	  }

	  EnterList:
	  for(i=1;i<=10;i++)
	  {
			clrscr();
			cout<<"Book number "<<i<<"\n\n";
			cout<<"Enter title:";
			gets(title[i]);
			cout<<"Enter author:";
			gets(author[i]);
			cout<<"Enter publisher:";
			gets(publisher[i]);
			cout<<"Enter price:";
			cin>>price[i];
			cout<<"Enter stock:";
			cin>>stock[i];
	  }

	  goto x;

	  BuyBook:
	  clrscr();
	  cout<<"Search Menu\n";
	  cout<<"-----------\n\n";
	  cout<<"1) By title\n";
	  cout<<"2) By author\n";
	  cout<<"3) Exit to previous menu\n\n";
	  cout<<"Enter your choice:";
	  cin>>ch;

	  switch(ch)
	  {
				case '1': goto Bytitle;
							 break;

				case '2': goto Byauth;
							 break;

				case '3': goto x;
							 break;

				default : goto BuyBook;
							 break;
	  }

	  Bytitle:

	  clrscr();

	  cout<<"Enter title to search for:";
	  gets(tsearch);

	  cout<<"Searching database....\n";

	  for(i=1;i<=10;i++)
	  {
			if(strcmp(title[i], tsearch)==0)
			{
				cout<<i<<") by author "<<author[i]<<"\n" ;
				searchflag++;
			}
	  }

	  goto SearchDone;

	  Byauth:

	  clrscr();

	  cout<<"Enter name of author to search for:";
	  gets(asearch);

	  cout<<"Searching database....\n";

	  for(i=1;i<=10;i++)
	  {
			if(strcmp(author[i], asearch)==0)
			{
				cout<<i<<") Title is "<<title[i]<<"\n";
				searchflag++;
			}
	  }

	  SearchDone:

	  if(searchflag<1)
	  {
		  cout<<"Sorry that book does not exist in the database.\n";
		  getche();
		  searchflag=0;
		  goto BuyBook;
	  }

	  searchflag=0;

	  cout<<"\nEnter the number of the book you want:";
	  cin>>number;

	  Details:

	  clrscr();
	  cout<<"Title:"<<title[number]<<"\n";
	  cout<<"Author:"<<author[number]<<"\n";
	  cout<<"Publisher:"<<publisher[number]<<"\n";
	  cout<<"Price:"<<price[number]<<"\n";
	  cout<<"Number in stock:"<<stock[number]<<"\n";
	  cout<<"\nEnter the number you wish to buy:";
	  cin>>nbuy;

	  if(nbuy>stock[number])
	  {
		  cout<<"Sorry, you are exceeding the stock limit.";
		  getche();
		  goto Details;
	  }

	  cout<<nbuy<<" books have been bought.\n";
	  cout<<"The total cost is :"<<nbuy*price[number]<<"\n";
	  stock[number]=stock[number]-nbuy;
	  cout<<"Updated stock value:"<<stock[number]<<"\n";
	  getche();

	  goto BuyBook;

	  Exit:

}
