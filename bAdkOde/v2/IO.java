import java.io.*;
import java.util.*;

class IO
{
      StringTokenizer tokens;
      SymbolTable     CurrentSymbolTable;
      Evaluator       ExpressionEvaluator;
      boolean         fatal;
      boolean         runstmt;
      String          CurrentToken;
      String          OutputString;
      String          DelimeterString;
      String          InputVarList;
      int             errcode;

      public IO()
      {
             CurrentSymbolTable = new SymbolTable();
	     ExpressionEvaluator = new Evaluator();
	     tokens = new StringTokenizer("");
	     fatal = false;
	     runstmt = false;
	     CurrentToken = "";
	     OutputString = "";
	     DelimeterString = "";
	     InputVarList = "";
	     errcode = 0;
      }

      public IO(SymbolTable thisSymbolTable, Evaluator thisEvaluator)
      {
             CurrentSymbolTable = thisSymbolTable;
	     ExpressionEvaluator = thisEvaluator;
	     fatal = false;
	     runstmt = false;
	     CurrentToken = "";
	     OutputString = "";
	     DelimeterString = "";
	     InputVarList = "";
	     errcode = 0;
      }

      private void print_stmt() throws MyException
      {
              boolean done = false;

              print_string();

	      try
	      {
                GetToken();
              }

	      catch(NoSuchElementException bad)
	      {
	            done = true;
		    CurrentToken = "";
              }

	      //System.out.println(CurrentToken + " ct p_s()");

	      while(!fatal && !done && CurrentToken.trim().compareTo(",") == 0)
	      {
		    //System.out.println(CurrentToken + " ct p_s()");

		   print_string();

		   //System.out.println(CurrentToken + " ct p_s()");

                   try
		   {
		     GetToken();
                   }

		   catch(NoSuchElementException bad)
		   {
		         done = true;
                   }
             }

	     if(!fatal && CurrentToken.compareTo(";") != 0)
	     {
	        errcode = 1;
	        fatal = true;
             }
      }

      private void print_string() throws MyException
      {
              GetToken();

	      //System.out.println(CurrentToken + " ct p_str()");

	      if(CurrentToken.trim().compareTo("\"") == 0)
	      {
	         quoted_string();
	      }

	      else
	      {
	         //evaluate expression 
	      }
      }

      private void quoted_string()
      {
              CurrentToken = tokens.nextToken();

	      string();

	      //CurrentToken = tokens.nextToken();

	      //System.out.println(CurrentToken + " ct q_s()");

	      while(!fatal && tokens.hasMoreTokens() && CurrentToken.trim().compareTo("\"") != 0)
	      {
	            //System.out.println(CurrentToken + " ct");
	            string();
              }

	      //System.out.println(CurrentToken + "ct q_s()");

	      if(!fatal && CurrentToken.trim().compareTo("\"") != 0)
	      {
	         fatal = true;
		 errcode  = 3;
	      }
      }

      private void string()
      {
	      //CurrentToken = tokens.nextToken();

	      //System.out.println(CurrentToken + " ct s()");

	      if(CurrentToken.trim().compareTo("{") == 0)
	      {
		 GetToken();

		 if(CurrentToken.compareTo("}") == 0)
		 {
		    fatal = true;
		    errcode = 15;
                 }

		 try
		 {
		    OutputString += CurrentSymbolTable.getVariable(CurrentToken.trim());
                 }

		 catch(Exception bad)
		 {
		       fatal = true;
		       errcode = 9;
		       System.out.print("\n" + CurrentToken + " ");
                 }

		 GetToken();

		 if(!fatal && CurrentToken.trim().compareTo("}") != 0)
		 {
		    fatal = true;
		    errcode = 13;
		 }

		 try
		 {
		   CurrentToken = tokens.nextToken();
                 }

		 catch(NoSuchElementException bad)
		 {
		       fatal = true;
		       errcode = 3;
		 }
	      }

	      else
	      {
	         //this is the str part...

		 //System.out.println("choosing  evaluatestr");

                 evaluatePrintString();

		 try
		 {
		    CurrentToken = tokens.nextToken();
                 } 

		 catch(NoSuchElementException  bad)
		 {
		       fatal = true;
		       errcode = 3;
		 }
	      }
      }

      private void evaluatePrintString()
      {
              //System.out.println(CurrentToken + "ct eps()");

              String PrintString = "";
	      int    i           = 0;

	      PrintString += CurrentToken;

	      while(!fatal && i < PrintString.length())
	      {
	            if(PrintString.charAt(i) == '\\')
		    {
                       PrintString = tokens.nextToken();

		       switch(PrintString.charAt(0))
		       {
		              case '"'  : OutputString += "\"";
			                  break;

			      case '\\' : OutputString += "\\";
			                  break;

			      case 'n'  : OutputString += "\n";
			                  break;

                              case 'r'  : OutputString += "\r";
			                  break;

			      case 'b'  : OutputString += "\b";
			                  break;

                              case 't'  : OutputString += "\t";
			                  break;

			      case '{'  : OutputString += "{";
					  break;

			      case '}'  : OutputString += "}";
					  break;

                              default   : errcode = 4;
			                  fatal = true;
					  break;
                       }
                    }

		    else
		    {
		       OutputString += new Character(PrintString.charAt(i)).toString();
                    }

		    i++;
              }

	      //CurrentToken = tokens.nextToken();

	      //System.out.println(OutputString + "|");
      }

      private void GetToken()
      {
              CurrentToken = tokens.nextToken();

	      while(CurrentToken.trim().length() == 0)
	      {
	            CurrentToken = tokens.nextToken();
              }
      }

      public int runPrint() throws MyException
      {
	     OutputString = "";

	     print_stmt();

	     if(error == 0)
             {
	        System.out.print(OutputString);
	     }

	     return errcode;
      }

      public int runInput() throws MyException
      {
	     runstmt = true;

	     input_stmt();

	     return errcode;
      }

      public int PrintCommand() throws MyException
      {
             OutputString = "";

             print_stmt();

	     return errcode;
      }

      public int InputCommand(StringTokenizer tokens) throws MyException
      {
	     tokens = Tokenizer;

	     input_stmt();

	     return errcode;
      }

      private void input_stmt()
      {
	      GetToken();

	      if(CurrentToken.compareTo("[") == 0)
	      {
		 GetToken();
	         delimeters();

	         if(!fatal)
	         {
	            GetToken();

	            if(CurrentToken.compareTo("]") != 0)
	            {
		       fatal = true;
		       errcode = 14;
	            }

		    else
	            {
		       GetToken();
		    }
	         }
	      }

	      if(!fatal)
	      {
		 var();
              }
      }

      private void delimeters()
      {
	      if(CurrentToken.compareTo("]") == 0)
	      {
		 fatal = true;
		 errcode = 16;
		 //empty delimeter string
	      }

	      else
	      {
                 if(CurrentToken.compareTo("\"") == 0)
		 {
	            GetToken();

		    if(CurrentToken.compareTo("\"") == 0)
		    {
		       fatal = true;
		       errcode = 16;
		    }

		    else
		    {
		       do
		       {
			     DelimeterString += CurrentToken;

			     try
			     {
			       GetToken();
                             }

			     catch(NoSuchElementException bad)
			     {
				   fatal = true;
				   errcode = 3;
			     }
		       }
		       while(CurrentToken.compareTo("\"") != 0);
		    }
                 }

		 else
		 {
	            //it is a string variable
		    //get its value
		 }
	      }
      }

      private void var()
      {
	      InputVarList = InputVarList + CurrentToken + ":";

	      GetToken();

	      while(CurrentToken.compareTo("<") == 0 && !fatal)
              {
		    GetToken();

                    if(CurrentSymbolTable.isValidVarname(CurrentToken))
	            {
		       //Input variables
		       //do funstuff if runstmt is true

		       InputVarList = InputVarList + CurrentToken + ":";

		       GetToken();
	            }

	            else
	            {
		       fatal = true;
		       errcode = 12;
		       System.out.println("\n" + Scope + "::" + InputVarName + " is not a valid identifier name");
	            }
              }

	      if(!fatal)
	      {
		  if(CurrentToken.compareTo(";") != 0)
		  {
		     fatal = true;
		     errcode = 1;
		  }

		  else
		  {
		     StringTokenizer VarTokenizer = new StringTokenizer(InputVarList, ":");
		     String Var = "";

		     while(VarTokenizer.hasMoreTokens())
		     {
		           Var = VarTokenizer.nextToken();

			   if(!CurrentSymbolTable.doesVariableExist(Var))
			   {
			      //create on-the-fly variable with name Var
			      //value and type to be assigned at runtime
			   }
                     }

		     if(runstmt)
		     {
			VarTokenizer = new StringTokenizer(InputVarList, ":");
			Var = "";

			while(VarTokenizer.hasMoreTokens())
			{
			      Var = VarTokenizer.nextToken();

			      BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

                              try
                              {
                                InputValue = stdin.readLine().trim();
                              }

                              catch(Exception Fatal)
                              { 
                              }

			      //to implement:
			      //1. Get Input
			      //2. Perform type inference on Input
			      //3. Compare Input and variable types
			      //4. If input variable is on-the-fly, assign type 
			      //   of input to it and store value
			      //5. If input variable is on-the-fly and the input value
			      //   is null then leave type of o-t-f variable as undefined
			}      
		     }
		  }
	      }
      }

      public void setTokenizer(StringTokenizer Tokenizer)
      {
	     tokens = Tokenizer;
      }

      /*public int InputCommand(StringTokenizer tokens) throws MyException
      {
             boolean error = false;
             boolean varIsNull = false;
             boolean Undefined = false;
             int errcode = 0;
             String oldType = "";
             String varName = "";
             String varType = "";
             String inputValue = "";
             String inputValueType = "";
             String temp = "";
             String DoCommand = "";

             if(!tokens.hasMoreTokens())
             {
                error = true;
                errcode = 1;
             }

             while(tokens.hasMoreTokens())
             {
                   DoCommand += tokens.nextToken();            
             }

             if(!DoCommand.endsWith(";"))
             {
                errcode = 1;
                error = true;
             }

             tokens = new StringTokenizer(DoCommand, "<;");

             varName = tokens.nextToken().trim();

             try
             {
               temp = CurrentSymbolTable.getTypeOf(varName);
             }

             catch(Exception e)
             {
                   temp = "doesnotexist";
             }

             if(!error && CurrentSymbolTable.doesVariableExist(varName) && temp.compareTo("undefined") != 0)
             {
                varType = CurrentSymbolTable.getTypeOf(varName);

                BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

                try
                {
                  inputValue = stdin.readLine().trim();
                }

                catch(Exception Fatal)
                {
                }

                if(inputValue == null || inputValue.length() == 0)
                {
                    varIsNull = true;
                    inputValue = "null";
                    inputValueType = CurrentSymbolTable.getTypeOf(varName);
                }

                if(!varIsNull)
                {
                   inputValueType = CurrentSymbolTable.typeOf(inputValue);
                }

                if(!varIsNull && inputValue.length() == 1 && inputValueType.compareTo("Identifier") == 0)
                {
                   inputValueType = "char";
                }

                else
                {
                   if(inputValueType.compareTo("char") == 0)
                   {
                      inputValueType = "invalid";
                   }
                   //The typeOf method defines 'c' as a character and c as an identifier
                   //since the input has been entered as c, it qualifies as an identifier according to the
                   //typeOf method.
                } 


                if(varType.compareTo("double") == 0 && 
                  (inputValueType.compareTo("double") == 0 || 
                   inputValueType.compareTo("float") == 0 || 
                   inputValueType.compareTo("int") == 0))
                {
                   CurrentSymbolTable.setNewValue(varName, varType, inputValue);
                }

                else
                {
                   if(varType.compareTo("float") == 0 && (inputValueType.compareTo("float") == 0 && inputValueType.compareTo("int") == 0))
                   {
                      CurrentSymbolTable.setNewValue(varName, varType, inputValue);
                   }

                   else
                   {
                      if(varType.compareTo("int") == 0 && inputValueType.compareTo("int") == 0)
                      {
                         CurrentSymbolTable.setNewValue(varName, varType, inputValue);
                      }

                      else
                      {
                         if(varType.compareTo("char") == 0 && inputValueType.compareTo("char") == 0 || 
                           (varType.compareTo("char") == 0 && inputValueType.compareTo("int") == 0 && inputValue.length() == 1))
                         {
                            CurrentSymbolTable.setNewValue(varName, varType, inputValue);
                         }

                         else
                         {
                            if(varType.compareTo("boolean") == 0 && inputValueType.compareTo("boolean") == 0)
                            {
                               CurrentSymbolTable.setNewValue(varName, varType, inputValue);
                            }
                            
                            else
                            {
                               error = true;
                               errcode = 10;
                            } 
                         }
                      }
                   }
                }
             }

             else
             {
                if(!error)
                {
                   BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

                   try
                   {
                     inputValue = stdin.readLine().trim();
                   }

                   catch(Exception Fatal)
                   {
                   }

                   if(inputValue == null || inputValue.length() == 0)
                   {
                      varIsNull = true;
                      inputValue = "null";
                      inputValueType = "undefined";
                   }

                   try
                   {
                     oldType = CurrentSymbolTable.getTypeOf(varName);
                   }

                   catch(Exception e)
                   {
                   }
     
                   if(!varIsNull)
                   {
                      inputValueType = CurrentSymbolTable.typeOf(inputValue);

                      if(inputValue.length() == 1 && inputValueType.compareTo("Identifier") == 0)
                      {
                         inputValueType = "char";
                      }

                      else
                      {
                         if(inputValueType.compareTo("char") == 0)
                         {
                            inputValueType = "invalid";
                         }
                      } 
                   }

                   if(inputValueType.compareTo("invalid") != 0 && inputValueType.compareTo("Identifier") != 0  && oldType.compareTo("undefined") != 0)
                   {
                      CurrentSymbolTable.addVariable(varName, inputValueType, inputValue);
                   }

                   else
                   {
                      if(oldType.compareTo("undefined") == 0)
                      {
                         CurrentSymbolTable.setNewValue(varName, inputValueType, inputValue);
                         CurrentSymbolTable.setType(varName, inputValueType);
                      }

                      else
                      {
                         error = true;
                         errcode = 10;
                      }
                   }
                }
             }

             return errcode;             
      }*/
}

