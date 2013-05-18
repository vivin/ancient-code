#include <iostream.h>
#include <fstream.h>
#include <process.h>
#include <stdio.h>
#include <conio.h>


void main()
{
     clrscr();

     char name[30], ntake[30], ch;

     long int teleno, telno, x;

     ofstream fout;

     ifstream fin;

     Begin:

     clrscr();

     cout<<"[[[[[[[[[[+Main Menu+]]]]]]]]]\n\n";
     cout<<"1. Enter record\n\n";
     cout<<"2. Exit\n\n";

     EnterCh:

     gotoxy(1,9);

     cout<<"Enter your choice:";

     cin>>ch;

     switch(ch)
     {
	    case '1': goto EnterRec;
		      break;

	    case '2': goto Exit;
		      break;

	    default : goto EnterCh;
		      break;
     }


     EnterRec:

     fin.open("teldir.dat", ios::binary);

     if(!fin)
     {
	goto FirstEn;
     }

     else
     {
	fin.close();
	goto App;
     }

     FirstEn:

     fout.open("teldir.dat", ios::binary);

     clrscr();

     cout<<"Enter name:";

     cin>>name;

     cout<<"\n\nEnter telephone number:";

     cin>>teleno;

     fout<<name<<" "<<teleno<<"\n";

     fout.close();

     App:

     fout.close();

     fin.close();

     clrscr();

     cout<<"Enter name:";

     cin>>name;

     cout<<"\n\nEnter telphone number:";

     cin>>teleno;

     fin.open("teldir.dat", ios::binary);

     while(!fin.eof())
     {
	   fin>>ntake>>telno;

	   //getche();

	   if(telno==teleno)
	   {
	      cout<<"\n\nSorry. That number belongs to "<<ntake<<".";

	      cout<<"\n\nPlease enter a new number.";

	      getche();

	      fin.close();

	      goto App;
	   }
     }

     fin.close();

     fout.open("teldir.dat", ios::binary | ios::app);

     fout<<name<<" "<<teleno<<"\n";

     fout.close();

     cout<<"\n\nEnter 1 if you want to continue:";

     cin>>x;

      if(x!=1)
      {
	 goto Begin;
      }

      else
      {
	 goto App;
      }

      Exit:

}

