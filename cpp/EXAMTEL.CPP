#include <iostream.h>
#include <fstream.h>
#include <process.h>
#include <stdio.h>
#include <conio.h>


void main()
{
     clrscr();

     char name[30], ntake[30], ch;

     long int teleno, telno, ft, x;

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

     fout.open("ftest.dat");

     fin>>ft;

     if(ft==0);
     {
	fin.close();

	goto New;
     }

     fin.close();
     goto App;


     New:

     fout.open("ftest.dat");

     fout<<1;

     fout.close();

     fout.open("teldir.dat", ios::binary);

     clrscr();

     cout<<"Enter name:";
     cin>>name;

     cout<<"\n\nEnter telephone number:";
     cin>>teleno;

     fout<<name<<teleno;

     fout.close();

     App:

     clrscr();

     cout<<"Enter name:";

     cin>>name;

     cout<<"\n\nEnter telphone number:";

     cin>>teleno;

     fin.open("teldir.dat", ios::binary);

     while(!fin.eof())
     {
	   fin>>ntake>>telno;

	   if(teleno==telno)
	   {
	      cout<<"\a\n\nSorry. Two persons cannot have name telephone number!";

	      fin.close();

	      goto App;
	   }
     }

     fout.open("teldir.dat", ios::binary | ios::app);

     fout<<name<<teleno;

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

