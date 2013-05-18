#include <iostream.h>
#include <stdio.h>
#include <conio.h>

int l=0;

char *strrev(char *sp)
{

	  char *revst;

	  char *rv=revst;

	  while(*sp!='\0')
	  {
			  sp++;
			  l++;
	  }

	  sp--;

	  for(int i=0;i<l;i++)
	  {

			*revst=*sp;

			revst++;

			sp--;
	  }

	  *revst='\0';

	  return rv;
}




void main()
{

	  char str[200], *sx;

	  cout<<"Enter string:";
	  gets(str);

	  sx=strrev(str);

	  while(*sx!='\0')
	  {
			  cout<<*sx;

			  sx++;
	  }

}
