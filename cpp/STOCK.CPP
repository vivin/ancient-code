#include <fstream.h>
#include <conio.h>
#include <process.h>
#include <string.h>

const Minqty=50;

char Item[30];

fstream fhandle;

void ModStock(char a="", int b=0);

void AddItem()
{
     int Qty, Qtyx, x;

     char Itake[30];

     clrscr();

     fhandle.open("stocklst.dat", ios::binary | ios::in);

     if(!fhandle)
     {
	goto FirstRec;
     }

     else
     {
	fhandle.close();
	goto App;
     }

     FirstRec;

     clrscr();

     cout<<"Enter name of stock:";

     cin>>Item;

     AskAgain;

     gotoxy(1,3);

     cout<<"Enter amount of stock:";

     cin>>Qty;

     if(Qty<MinQty)
     {
	gotoxy(1,5);

	cout<<"\a\n\nSorry. The lowest you can have is 50 units of the stock.";

	getche();

	gotoxy(1,5);

	cout<<"                                                                ";

	goto AskAgain;
     }

     fhandle.open("stocklst.dat", ios::binary | ios::out);

     fhandle<<Qty<<Item<<"\n";

     fhandle.close();

     App:

     fhandle.close();

     clrscr();

     cout<<"Enter name of stock:";

     cin>>Item;

     AskAgain;

     gotoxy(1,3);

     cout<<"Enter amount of stock:";

     cin>>Qty;

     if(Qty<MinQty)
     {
	gotoxy(1,5);

	cout<<"\a\n\nSorry. The lowest you can have is 50 units of the stock.";

	getche();

	gotoxy(1,5);

	cout<<"                                                                ";

	goto AskAgain;
     }

     fhandle.open("stocklst.dat", ios::binary | ios::in);

     while(!fhandle.eof())
     {
	   fhandle>>Qtyx>>Itake;

	   if(strcmp(Item, Itake)==0)
	   {
	      cout<<"\a\n\nSorry that stock has already been issued. You can only modify it.";

	      cout<<"\n\nPress 1 to modify now, any other number:";

	      cin>>x;

	      if(x!=1)
	      {
		 fhandle.close();

		 goto App;
	      }

	      else
	      {
		 Isent=1

		 fhandle.close()

		 ModStock(Item, Isent);
	      }

     }

     fhandle.close();

     fhandle.open("stocklst.dat", ios::binary | ios::out);

     fout<<Qty<<Item<<"\n";

     fhandle.close();

     cout<<"\n\nPress 1 if you want to continue:";

     cin>>x;

     if(x!=1)
     {
	goto End_Func;
     }

     else

     {
	goto App;
     }

     End_Func:

}

void ModStock(char ItRec, int Irec);
{
     if(Irec==1)
     {
	goto ModRec;
     }

     else
     {
	goto DetMod;
     }

     //finish stuff of ModRec, DetMod
}

void main()
{
     char ch;

     clrscr();

     cout<<"[[[[[[[[[[[[[[[[[[[[+Main Menu+]]]]]]]]]]]]]]]]]]\n\n";

     cout<<"1. Add Item\n\n";

     cout<<"2. Modify stock\n\n";

     cout<<"3. Exit\n\n";

     cout<<"Enter your choice:";

     cin>>ch;

     switch(ch)
     {
	    case '1': AddItem();
		      break;

	    case '2': ModStock();
		      break;

	    case '3': goto Exit;
		      break;
     }

     Exit;
}





}


