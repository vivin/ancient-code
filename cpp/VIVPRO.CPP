/***************************************************************************/
/***************************************************************************/
/*                    Bank of Planet Earth Banking program                 */
/*                														   */
/*                      Programmed By : Vivin S. Paliath                   */
/*																		   */
/*                   Copyright(C) VSP Corporations 1997--->                */
/*																		   */		
/*                            All Rights Reserved                          */
/***************************************************************************/
/***************************************************************************/

#include <iostream.h>  // Basic I/O functions like cout  cin etc.     
#include <stdio.h>     // Functions like gets(), puts() etc.
#include <process.h>   // For function exit().
#include <conio.h>     // For clrscr().
#include <string.h>    // For strcpy(), strcmp() etc.
#include <fstream.h>   // For file handling.

/*-------------------------------------------------------------------------*/
/*************************Declare global variables**************************/
/*-------------------------------------------------------------------------*/

unsigned long int AccNConfirm=0, WAccNConfirm=0, BalanceSet=0, WBalanceSet=0, AccNlen=0, NofF=0;
// Declaration of basic integer values and counters

long float Balance=0, Deposit=0, WithdrawVal=0;
// Declaration of account variables (integer type)

char Name[25], choice, YorN, FName[8], Filename[20], FileName[8], Extension[4], FN[8], AccNo[5], AccNum[5], AccNumber[5], Pinput[5], File[20];
// Declaration of account variables (character type)

/*-------------------------------------------------------------------------*/
/*****************************Declare functions*****************************/
/*-------------------------------------------------------------------------*/

void Open_New_Account(); 
//Function to open a new account

void Deposit_Money();    
//Function to deposit money in an account

void Withdraw_Money();
//Function to withdraw money from an account

void The_End();
//Function to end the program


void main()
{         
     char a;                         

     ClearIt:

	 clrscr();

	 gotoxy(20,1);

	 cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	 gotoxy(20,2);

	 a = 230;

	 for(int i=20;i<62;i++)
	 {
         gotoxy(i,2);

		 cout<<a;
     }

	 gotoxy(37,4);

	 cout<<"Bank Menu";

	 for(i=37;i<46;i++)
	 {
		 gotoxy(i,5);

		 cout<<a;
     }

	 gotoxy(20,11);

	 cout<<"(1) New Account";

	 gotoxy(20,13);

	 cout<<"(2) Deposit";

	 gotoxy(20,15);

	 cout<<"(3) Withdrawal";

	 gotoxy(20,17);

	 cout<<"(4) Exit";
     	 
     InputAgain:

	 gotoxy(20,21);
     	 
     cout<<"Please enter your choice(1 to 4):";  

	 cin>>choice;

	 switch(choice)
	 {
			case '1' : Open_New_Account();

            break;


		    case '2' : Deposit_Money();

		    break;
            

			case '3' : Withdraw_Money();

		 	break;
                        		

			case '4' : The_End();

			clrscr();
            
			exit(0);
            			
			default : cout<<"Error - Invalid choice";

			break;
	 }
     
	 goto ClearIt;	
}

void Open_New_Account()
{
	 char a;

     ClearIt:

	 clrscr();

	 gotoxy(20,1);

	 cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	 gotoxy(20,2);

	 a = 230;

	 for(int i=20;i<62;i++)
	 {
         gotoxy(i,2);

		 cout<<a;
	 }

	 gotoxy(33,4);

     cout<<"New Account Page";

	 for(i=33;i<49;i++)
	 {
		 gotoxy(i,5);

		 cout<<a;
	 }

	 gotoxy(20,8);

	 cout<<"Opening new account... (Enter Details Below)";

	 gotoxy(20,10);

	 cout<<"Please enter your name:";

	 gets(Name);
     
     REDep:

     gotoxy(20,12);

	 cout<<"Please enter the initial deposit:";
        
     cin>>Balance;
     	 
	 if(Balance<10)
	 {
		gotoxy(20,14);

        cout<<"Error - Initial Deposit must be more than 10 Earth Credits.";

		gotoxy(20,16);

		cout<<"Do you want to re-enter your deposit?";

		cin>>YorN;

		if((YorN == 'Y') || (YorN == 'y'))
        {
		   goto REDep;
		}

		else
		{
		   exit(0);
        }
     }
     
     gotoxy(20,14);

	 cout<<"Congratulations! You now have an account in BOPE!            ";

	 gotoxy(14,16);

	 cout<<"Enter the account number you would like to use(5 digits max):";

     cin>>AccNo;
     	 
     EnterAgain:

	 gotoxy(18,18);

     cout<<"**Remember your Account Name and your Account Number**";

     gotoxy(20,20);
     
	 cout<<"Enter an account name (not more than 8 letters):";

	 cin>>Filename;
     	 
     strcpy(FName, Filename);

	 if(strlen(FName)>=9)
	 {
        cout<<"Error - word has more than 8 letters";

		goto EnterAgain;
	 }

     strcpy(Extension,".ACC");
	 
	 strcat(FName, Extension);

	 ofstream outfile(FName);
     	 
	 outfile<<AccNo<<"\n"<<Balance<<"\n"<<Name<<"\n";

     gotoxy(20,22);

	 cout<<"Press any key to continue...";

     getche();

	 clrscr();
}
	 

void Deposit_Money()
{
	 char a;

	 BalanceSet=0;

     AccNConfirm=0;

     ClearIt:

	 clrscr();

	 gotoxy(20,1);

	 cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	 gotoxy(20,2);

	 a = 230;

	 for(int i=20;i<62;i++)
	 {
         gotoxy(i,2);

		 cout<<a;
	 }

	 gotoxy(35,4);

     cout<<"Deposit Page";

	 for(i=35;i<47;i++)
	 {
		 gotoxy(i,5);

		 cout<<a;
	 }

	 gotoxy(20,10);

	 cout<<"Please enter the name of your account:";

	 cin>>FN;

	 strcat(FN, ".acc");
     	 
	 strcpy(FileName,FN);
     	            
	 ifstream file;

	 file.open(FileName);

	 if(!file)
     {
        gotoxy(20,12);

	    cout<<"Cannot open account "<<FileName<<"!";

		gotoxy(20,14);

		cout<<"Possible problem...";

		gotoxy(20,15);

        cout<<"Account Name was misspelt or Account does not exist."; 

        getche();

        goto ThisIsOver;
	 }


	 else
	 {
		 gotoxy(20,12);

		 cout<<"Reading from account...";
                                             
		 
		 ifstream infile(FileName);

		 while(infile)
		 {     			   
               ReadEverythingElse:

			   if(BalanceSet==1)
			   {  				  
                  infile>>Name;

				  goto WorkWithData;
			   }


			   if(AccNConfirm==1)
			   {
				  infile>>Balance;

				  BalanceSet=1;

                  goto ReadEverythingElse;
               }

			   infile>>AccNum;

			   if(AccNConfirm==0)
			   {
				  gotoxy(20,14);

				  cout<<"|!|Security Check|!| : <Enter Account No.>";
                        		                  
				  AccNlen=strlen(AccNum);

				  int k=20;

				  for(int i=0;i<AccNlen;i++)
				  {
					  gotoxy(k,16);

					  Pinput[i]=getche();

					  gotoxy(k,16);

					  cout<<"*";

					  k++;
				  }

                  Pinput[i]='\0';
				  
				  if(strcmp(AccNum, Pinput)==0)
				  {
					 gotoxy(20,18);

                     cout<<"|*Access Granted*|";

                     AccNConfirm=1;

                     strcpy(AccNo, AccNum);

					 goto ReadEverythingElse;
				  }

                
				  else
				  {
					  gotoxy(20,18);

					  cout<<"Warning! Security Breach!\n";

					  gotoxy(20,20);

                      cout<<"Unauthorized Attempt to Access Account!\n";

					  gotoxy(20,22);

					  cout<<"Exiting to main menu...\n";

					  gotoxy(20,24);

                      cout<<"Press any key to continue...";

					  getche();
                      					  
					  goto ThisIsOver;

				  }	   

              }
         }

	     WorkWithData:

		 getche();
         		
		 char a;

         ClearItX:

	     clrscr();

	     gotoxy(20,1);

	     cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	     gotoxy(20,2);

	     a = 230;

	     for(int i=20;i<62;i++)
	     {
             gotoxy(i,2);

		     cout<<a;
	     }

	     gotoxy(35,4);

         cout<<"Deposit Page";

	     for(i=35;i<47;i++)
	     {  
		     gotoxy(i,5);

		     cout<<a;
         }

		 gotoxy(20,8);

		 cout<<"Account Details from account:"<<FileName;

		 gotoxy(20,10);

		 cout<<"Name of person:"<<Name<<".";

		 gotoxy(20,12);

		 cout<<"Balance remaining:"<<Balance<<" Earth Credits.";

         DepAgain:

         gotoxy(20,14);
		 		 
		 cout<<"Enter amount to deposit:";

		 cin>>Deposit;

		 if(Deposit<0)
		 {
            gotoxy(20,16);

			cout<<"Error - Negative value entered!";

			goto DepAgain;
         }

		 Balance+=Deposit;

         gotoxy(20,16);

		 cout<<"The current balance is "<<Balance<<" Earth Credits.";

         gotoxy(20,18);

         cout<<"Writing new data to account:";
         		 
		 ofstream outfile(FileName);
     	 
	     outfile<<AccNo<<"\n"<<Balance<<"\n"<<Name<<"\n";

         gotoxy(20,20);

	     cout<<"Press any key to continue...";

         getche();

	     clrscr();
     }

     ThisIsOver:
}

void Withdraw_Money()
{
	 char a;

	 WBalanceSet=0;

     WAccNConfirm=0;

     ClearIt:

	 clrscr();

	 gotoxy(20,1);

	 cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	 gotoxy(20,2);

	 a = 230;

	 for(int i=20;i<62;i++)
	 {
         gotoxy(i,2);

		 cout<<a;
	 }

	 gotoxy(34,4);

     cout<<"Withdrawal Page";

	 for(i=34;i<49;i++)
	 {
		 gotoxy(i,5);

		 cout<<a;
	 }

	 gotoxy(20,10);

	 cout<<"Please enter the name of your account:";

	 cin>>FN;

	 strcat(FN, ".acc");
     	 
	 strcpy(FileName,FN);
     	            
	 ifstream file;

	 file.open(FileName);

	 if(!file)
     {
        gotoxy(20,12);

	    cout<<"Cannot open account "<<FileName<<"!";

		gotoxy(20,14);

		cout<<"Possible problem...";

		gotoxy(20,15);

        cout<<"Account Name was misspelt or Account does not exist."; 

        getche();

        goto ThisIsOver;
	 }


	 else
	 {
		 gotoxy(20,12);

		 cout<<"Reading from account...";
                                           
		 ifstream infile(FileName);

		 while(infile)
		 {     			   
               ReadEverythingElse:

			   if(WBalanceSet==1)
			   {  				  
                  infile>>Name;

				  goto WorkWithData;
			   }


			   if(WAccNConfirm==1)
			   {
				  infile>>Balance;

				  WBalanceSet=1;

                  goto ReadEverythingElse;
               }

			   infile>>AccNum;

			   if(WAccNConfirm==0)
			   {
				  gotoxy(20,14);

				  cout<<"|!|Security Check|!| : <Enter Account No.>";
                        		                  
				  AccNlen=strlen(AccNum);

				  int k=20;

				  for(int i=0;i<AccNlen;i++)
				  {
					  gotoxy(k,16);

					  Pinput[i]=getche();

					  gotoxy(k,16);

					  cout<<"*";

					  k++;
				  }

                  Pinput[i]='\0';
				  
				  if(strcmp(AccNum, Pinput)==0)
				  {
					 gotoxy(20,18);

                     cout<<"|*Access Granted*|";

                     WAccNConfirm=1;

					 strcpy(AccNo, AccNum);
                     					 
					 goto ReadEverythingElse;
				  }

                
				  else
				  {
					  gotoxy(20,18);

					  cout<<"Warning! Security Breach!\n";

					  gotoxy(20,20);

                      cout<<"Unauthorized Attempt to Access Account!\n";

					  gotoxy(20,22);

					  cout<<"Exiting to main menu...\n";

					  gotoxy(20,24);

                      cout<<"Press any key to continue...";

					  getche();

                      goto ThisIsOver;
                  } 
               }
         }

	     WorkWithData:

		 getche();
         		
		 char a;

         ClearItX:

	     clrscr();

	     gotoxy(20,1);

	     cout<<"Welcome to the Bank of Planet Earth (BOPE)";

	     gotoxy(20,2);

	     a = 230;

	     for(int i=20;i<62;i++)
	     {
             gotoxy(i,2);

		     cout<<a;
	     }

	     gotoxy(34,4);

         cout<<"Withdrawal Page";

	     for(i=34;i<49;i++)
	     {  
		     gotoxy(i,5);

		     cout<<a;
         }

		 gotoxy(20,8);

		 cout<<"Account Details from account:"<<FileName;

		 gotoxy(20,10);

		 cout<<"Name of person:"<<Name<<".";

		 gotoxy(20,12);

		 cout<<"Balance remaining:"<<Balance<<" Earth Credits.";

         WithdAgain:

		 gotoxy(20,14);

		 cout<<"Enter amount to withdraw:";

		 cin>>WithdrawVal;
                  
		 if(WithdrawVal<0)
		 {
            gotoxy(20,16);

			cout<<"Error - Negative value entered!";

			goto WithdAgain;
         }
         
		 if((Balance-WithdrawVal)<10)
		 {
             gotoxy(20,16);

			 cout<<"Balance must be more than 10 Earth Credits.";

			 goto WithdAgain;
		 }

		 gotoxy(20,16);

		 cout<<"You are about to withdraw "<<WithdrawVal<<" Earth Credits.";

		 gotoxy(20,18);

		 cout<<"Are you sure?";

		 cin>>YorN;

		 if((YorN == 'Y') || (YorN == 'y'))
		 {
			goto WithdConfirmed;

         }

		 else

         {
			goto WithdAgain;

		 }

         WithdConfirmed:

		 Balance-=WithdrawVal;

         gotoxy(20,16);

		 cout<<"The current balance is "<<Balance<<" Earth Credits.            ";

         gotoxy(20,18);

         cout<<"Writing new data to account:         ";

		 ofstream outfile(FileName);
     	 
	     outfile<<AccNo<<"\n"<<Balance<<"\n"<<Name<<"\n";

         gotoxy(20,20);

	     cout<<"Press any key to continue...";

         getche();

	     clrscr();
     }

     ThisIsOver:
}

void The_End()
{

	 clrscr();

	 gotoxy(24,10);

	 cout<<"Thanks a lot for using our bank!";

	 gotoxy(19,12);

	 cout<<"We look forward to working with you again!";
     
	 gotoxy(39,14);

	 cout<<"Bye";
     
	 getche();
}                  

//'tis finally over!