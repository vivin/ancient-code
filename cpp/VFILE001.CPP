#include <fstream.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>

fstream usefile;

class student
{
		char name[25];
		int m1,m2,m3,m4,m5;

		public:
		void accept();
		void display();
		friend void check(student &stu, char []);
};

void student::accept()
{
	  cout<<"\nEnter your name:";
	  cin>>name;
	  cout<<"\nEnter your marks in English:";
	  cin>>m1;
	  cout<<"\nEnter your marks in Physics:";
	  cin>>m2;
	  cout<<"\nEnter your marks in Chemistry:";
	  cin>>m3;
	  cout<<"\nEnter your marks in Maths:";
	  cin>>m4;
	  cout<<"\nEnter your marks in Computer Science:";
	  cin>>m5;
}

void student::display()
{
	  clrscr();
	  cout<<"Name:"<<name<<" English:"<<m1<<" Physics:"<<m2<<" Chemistry:"<<m3<<" Maths:"<<m4<<" Computer Science:"<<m5<<"\n";
}

void check(student &studx, char namex[])
{
		 if(strcmp(namex, studx.name)==0)
		 {
			 studx.accept();
			 usefile.write((char*)&studx, sizeof(studx));
		 }
}

void main()
{
	  student stud;
	  int n;
	  char namex[25];

	  clrscr();

	  cout<<"Enter the number of students in the class:";
	  cin>>n;

	  ofstream fout("student.dat", ios::binary);

	  for(int i=1;i<=n;i++)
	  {
			stud.accept();
			fout.write((char*)&stud, sizeof(stud));
	  }

	  fout.close();

	  ifstream fin("student.dat", ios::binary);

	  while(!fin.eof())
	  {
			  fin.read((char*)&stud, sizeof(stud));
			  stud.display();
			  getche();
	  }

	  fin.close();

	  clrscr();

	  cout<<"Append to file:\n\n";
	  cout<<"";

	  cout<<"How many new records do you wish to add to the existing file:";
	  cin>>n;

	  fout.open("student.dat", ios::binary | ios::app);

	  for(i=1;i<=n;i++)
	  {
			stud.accept();
			fout.write((char*)&stud, sizeof(stud));
	  }

	  fout.close();

	  fin.open("student.dat", ios::binary);
	  while(!fin.eof())
	  {
			  fin.read((char*)&stud, sizeof(stud));
			  stud.display();
			  getche();
	  }

	  fin.close();

	  clrscr();

	  cout<<"Enter the name of the student whose record you wish to modify:";
	  cin>>namex;

	  usefile.open("student.dat", ios::binary | ios::in | ios::out);

	  while(!usefile.eof())
	  {
			  usefile.read((char*)&stud, sizeof(stud));
			  check(stud, namex);
	  }

	  usefile.close();

	  cout<<"Sorry Record does not exist";

	  fin.open("student.dat", ios::binary);

	  while(!fin.eof())
	  {
			  fin.read((char*)&stud, sizeof(stud));
			  stud.display();
			  getche();
	 }
}






