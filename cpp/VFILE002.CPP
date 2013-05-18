#include <fstream.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>

ofstream fout, fout_pass, fout_fail;
ifstream fin, fin2;

class Passed;
class Failed;

class Class
{
      char name[25];
      int grno, m1, m2, m3;

      public:

      void accept();
      int check();
      void friend writepass(Class, Passed);
      void friend writefail(Class, Failed);
};

class Passed
{
      char name[25];
      int grno;

      public:

      void friend writepass(Class, Passed);
      void display();
};

class Failed
{
      char name[25];
      int grno;

      public:
      void friend writefail(Class, Failed);
      void display();
};

void Class::accept()
{
     clrscr();
     cout<<"Enter grno:";
     cin>>grno;
     cout<<"\nEnter name:";
     cin>>name;
     cout<<"\nEnter mark 1:";
     cin>>m1;
     cout<<"\nEnter mark 2:";
     cin>>m2;
     cout<<"\nEnter mark 3:";
     cin>>m3;
}

int Class::check()
{
     if((m1<=40)||(m2<=40)||(m3<=40))
     {
	 return 0;
     }
     else
     {
	 return 1;
     }
}

void Passed::display()
{
     cout<<"Passed\n\n";
     cout<<name<<" "<<grno<<"\n";
     getche();
}

void Failed::display()
{
     cout<<"Failed\n\n";
     cout<<name<<" "<<grno<<"\n";
     getche();
}

void writepass(Class class1, Passed pass)
{
     strcpy(pass.name, class1.name);
     pass.grno=class1.grno;
     fout_pass.write((char*)&pass, sizeof(pass));
     cout<<pass.name<<" has passed.";
     getche();
}

void writefail(Class class1, Failed fail)
{
     strcpy(fail.name, class1.name);
     fail.grno=class1.grno;
     fout_fail.write((char*)&fail, sizeof(fail));
     cout<<"                       ";
     cout<<fail.name<<" has failed.";
     getche();
}

void main()
{
     int i=0,n=0, chkstate;

     Class class1;
     Passed pass;
     Failed fail;

     clrscr();

     cout<<"Enter the number of students in the class:";
     cin>>n;

     fout.open("class.dat", ios::binary);

     for(i=1;i<=n;i++)
     {
	 class1.accept();
	 fout.write((char*)&class1, sizeof(class1));
     }

     fout.close();

     fin.open("class.dat", ios::binary);
     fout_pass.open("pass.dat", ios::binary);
     fout_fail.open("fail.dat", ios::binary);

     while(!fin.eof())
     {
	   fin.read((char*)&class1, sizeof(class1));
	   chkstate=class1.check();
	   if(chkstate==1)
	   {
	      writepass(class1, pass);
	   }

	   else
	   {
	      writefail(class1, fail);
	   }
     }

     fin.close();
     fout_pass.close();
     fout_fail.close();

     fin.open("pass.dat", ios::binary);

     while(!fin.eof())
     {
	   fin.read((char*)&pass, sizeof(pass));
	   pass.display();
     }

     fin.close();

     fin.open("fail.dat", ios::binary);

     while(!fin.eof())
     {
	   fin.read((char*)&fail, sizeof(fail));
	   fail.display();
     }
}

