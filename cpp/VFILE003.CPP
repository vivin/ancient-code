#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <process.h>

class Employee
{
     int empno, sal;
     char name[25];

     public:

     void accept();
     void display();
}Emp;

void Employee::accept()
{
     clrscr();
     cout<<"Name:";
     cin>>name;
     cout<<"\nEmployee Code:";
     cin>>empno;
     cout<<"\nSalary:";
     cin>>sal;
}

void Employee::display()
{
     clrscr();
     cout<<"\nEmployee Code:"<<empno;
     cout<<"Name:"<<name;
     cout<<"\nSalary:"<<sal;
}

void main(int ac, char*av[])
{
     clrscr();
     int i,n;
     char choice[3];

     clrscr();

     if(av=="1")
     {
     }

     cout<<"Enter your choice(1:Enter, 2:Append, 3:Print):";

     getche();
}








