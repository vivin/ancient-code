# include <iostream.h>
# include <fstream.h>
void main()
{
char name[25];
int tel=1,tele, chk=0,chk1=0;
ifstream fin;
ofstream fout;
fout.open("andrew.dat", ios::binary|ios::out|ios::noreplace);
if(fout.fail())
{
		//fout.open("andrew.dat",ios::binary|ios::app);
		chk=1;
}
while(tel !=0)
{
	cout<<"\n enter 0 to stop\n enter tel. no.";
	cin>>tel;
	if(tel==0)
		goto exit;
	if((chk==1)||(chk1==1))
	{

		fout.close();
		fin.open("andrew.dat", ios::binary|ios::in);
		while(!fin.eof())
		{
			fin>>tele>>name;
			if (tel==tele)
			{
				cout<<"\nThis phone is owned by "<<name;
				fin.close();
				goto x;
			}
		}
		fin.close();
		fout.open("andrew.dat", ios::binary|ios::app);
	}
	cout<<"\n enter the name : ";
	cin>>name;
	fout<<tel<<name<<"\n"; chk1=1;
x: }
if (chk1==1)
	fout.close();
exit: cout<<"\n \n closing....";
}