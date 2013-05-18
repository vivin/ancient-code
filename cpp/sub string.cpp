#include <iostream.h>
#include <stdio.h>

char* substr(char *str1, char *str2)
{
      int y;

      char *cp1, *cp2;
      cp1=str1;

      while(*cp1!='\0')
      {
	    cp2=str2;

	    while(*cp2!='\0')
	    {
		  if(*cp2==*cp1)
		  {
		     cp1++;
		     cp2++;
		  }

		  else
		  {
		     goto y;
		  }
	    }
	    return str1;

	    y:
	    str1++;
	    cp1=str1;
      }
      return NULL;
}

void main()
{

     char str1[200], str2[20], *sp;

     cout<<"Enter string one:";
     gets(str1);

     cout<<"\n\nEnter string two:";
     gets(str2);

     sp=substr(str1, str2);

     if(!sp)
     {
	cout<<"Given search string does not exist!!!\n";
     }

     while(*sp!='\0')
     {
	   cout<<*sp;

	   sp++;
     }
}


     