import java.util.*;

class Interpreter
{
       StringTokenizer tokens;
       SymbolTable     CurrentSymbolTable;
       Evaluator       ExpressionEvaluator;
       boolean         fatal;
       boolean         preproc;
       boolean         functypedef;
       boolean         badstmt;
       boolean         runstmt;
       Vector          BadScript;
       String          Scope;
       String          LanguageTokens;
       String          CurrentToken;
       String          ScriptFileName;
       int             line;
       int             error;
       int             errors;
       IO              ScriptIO;

       //Add Loop, and Selection objects when they get implemented.

       public Interpreter()
       {
	      tokens = new StringTokenizer("", LanguageTokens, true);
              CurrentSymbolTable = new SymbolTable();
              ExpressionEvaluator = new Evaluator(CurrentSymbolTable);
	      CurrentSymbolTable.setTokenizer(tokens);
	      CurrentSymbolTable.setEvaluator(ExpressionEvaluator);
              ScriptIO = new IO(CurrentSymbolTable, ExpressionEvaluator);
	      ScriptIO.setTokenizer(tokens);
              BadScript = new Vector();
	      ScriptFileName = "unknown.bad";
              Scope = "";
	      CurrentToken = "";
              line = 1;
	      errors = 0;
	      fatal = false;
	      preproc = false;
	      functypedef = false;
	      badstmt = false;
	      runstmt = false;
       }

       public Interpreter(StringTokenizer Tokenizer, 
		          String LangTokens,
                          String CurrScope,
			  String ScriptFN,
                          Vector ScriptVector,
                          SymbolTable ThisSymbolTable)
       {
              CurrentSymbolTable = ThisSymbolTable;
              ExpressionEvaluator = new Evaluator(CurrentSymbolTable);
	      CurrentSymbolTable.setTokenizer(tokens);
	      CurrentSymbolTable.setEvaluator(ExpressionEvaluator);
	      ScriptIO = new IO(CurrentSymbolTable, ExpressionEvaluator);
	      ScriptIO.setTokenizer(tokens);
              BadScript = ScriptVector;
              Scope = CurrScope;
	      ScriptFileName = ScriptFN;
	      CurrentToken = "";
	      LanguageTokens = LangTokens;
              tokens = Tokenizer;
	      line = 1;
	      errors = 0;
	      fatal = false;
	      preproc = false;
	      functypedef = false;
	      badstmt = false;
	      runstmt = false;
       }

       public boolean run() throws MyException
       {
	      boolean done = false;
	      line = 1;
	      preproc = false;
	      functypedef = false;
	      badstmt = false;
	      runstmt = true;

              for(line = line; line < BadScript.size(); line++)
              {
                  tokens = new StringTokenizer((String) BadScript.elementAt(line), LanguageTokens, true);
		  bAdkOde_script();
              }

	      return (errors > 0);
       }

       public boolean parse() throws MyException
       {
	      boolean done = false;

              for(line = line; line < BadScript.size(); line++)
              {
                  tokens = new StringTokenizer((String) BadScript.elementAt(line), LanguageTokens, true);
		  bAdkOde_script();
              }

	      if(errors > 0)
	      {
		 System.out.println("\n" + ScriptFileName + ": " + "" + errors + " errors");
		 fatal = true;
	      }

	      return fatal;
       }

      public void GetToken()
      {
             CurrentToken = tokens.nextToken();

	     while(CurrentToken.trim().length() == 0)
	     {
	           CurrentToken = tokens.nextToken();
             }
      }

      public void bAdkOde_script()
      {
	     boolean done = false;

	     try
	     {
	       GetToken();
             }

	     catch(NoSuchElementException bad)
	     {
		   done = true;
             }

	     if(!done)
             {
                if(CurrentToken.compareTo("use") == 0)
		{
	           if(functypedef || badstmt)
		   {
	              System.out.println("\n" + ScriptFileName + ": " + "Preprocessor statement must precede all other statments - line " + line);
		      errors++;
		   }

		   else
		   {
		      GetToken();
		      String ImportFileName = CurrentToken;
		      
		      GetToken();

		      if(CurrentToken.compareTo(";") != 0)
		      {
			 error = 1;
			 GetError();
			 errors++;
		      }
		  
		      else
		      {
		         Script ImportScript = new Script("global", 
					                  CurrentSymbolTable,
							  LanguageTokens,
							  CurrentToken,
							  ".bm");

			 if(runstmt)
			 {
			    ImportScript.run();
			 }

			 else
			 {
			    ImportScript.open();
			 }
		      }

		      preproc = true;
		   }
		}

		else
		{
		   if(CurrentToken.compareTo("func") == 0)
		   {
		      if(badstmt)
		      {
			 System.out.println("\n" + ScriptFileName + ": " + "Function definitions must precede all other statements - line " + line);
			 errors++;
		      }

		      else
		      {
			 //parse function and do all necessary cool stuff
			 //to parse function get from < to > - these are on
			 //lines by themselves
			 functypedef = true;
		      }
		   }

		   else
		   {
		      if(CurrentToken.compareTo("typedef") == 0)
		      {
			 if(badstmt)
		         {
			    System.out.println("\n" + ScriptFileName + ": " + "Type definitions must precede all other statements - line " + line + "\n");
			    errors++;
			 }

			 else
		         {
			    //parse typedef and do all necessary cool stuff
			    //to parse typedef get frin < to > - these are on
			    //lines by themselves
			    functypedef = true;
			 }
		      }

		      else
		      {
			 badstmt = true;
		         bAdkOde_stmts();
		      }
		   }
		}
             }
      }

      public void bAdkOde_stmts()
      {
	     boolean done = false;

	     bAdkOde_stmt();

	     try
	     {
	       GetToken();
	     }

	     catch(NoSuchElementException bad)
	     {
		   done = true;
             }

	     while(!done && tokens.hasMoreTokens())
	     {
		   bAdkOde_stmt();

		   try
		   {
	             GetToken();
		   }

		   catch(NoSuchElementException bad)
		   {
			 done = true;
	           }
	     }
      }

      //!!!!! NOTE THAT THE PRINT COMMAND HAS CHANGED FROM '>' to 'print' and
      //!!!!! THAT THE INPUT COMMAND HAS CHANGED FROM '<' to 'input'. Refer to
      //!!!!! relevant grammar changes in bAdkOde.ebnfs

      public void bAdkOde_stmt()
      {
             if(CurrentToken.trim().compareTo("print") == 0)
             {
		if(runstmt)
		{
                   error = ScriptIO.runPrint();
		}
		
		else
	        {
		   error = ScriptIO.PrintCommand();
		}
             }

             else
             {
                if(CurrentToken.compareTo("input") == 0)
                {
                   if(runstmt)
		   {
		      error = ScriptIO.runInput();
		   }
		   
		   else
		   {
		      error = ScriptIO.InputCommand();
		      //on-the-fly variables will have entries in the symboltable
		      //but will have values assigned only at runtime
		   }
                }

                else
                { 
                   if(CurrentToken.compareTo("double") == 0 || 
                      CurrentToken.compareTo("int") == 0 || 
                      CurrentToken.compareTo("float") == 0 || 
                      CurrentToken.compareTo("char") == 0 || 
                      CurrentToken.compareTo("boolean") == 0 ||
                      CurrentToken.compareTo("double@") == 0 ||
                      CurrentToken.compareTo("int@") == 0 ||
                      CurrentToken.compareTo("float@") == 0 ||
                      CurrentToken.compareTo("char@") == 0 ||
                      CurrentToken.compareTo("boolean@") == 0)
                   {                                   
                      try
                      {
			CurrentSymbolTable.setScriptFileName(ScriptFileName);
			CurrentSymbolTable.setScope(Scope);

			if(runstmt)
			{
		           error = CurrentSymbolTable.run(CurrentToken);
			   //will assign values to variables only at runtime
			}

			else
		        {
                           error = CurrentSymbolTable.parse(CurrentToken);
			   //check syntax
			}
                      }

                      catch(MyException Fatal)
                      {
                            System.out.println("\n" + ScriptFileName + ": " + "An exception was encountered on line " + line + " while trying to initialize variable.\n");
                            error = 666;
                      }
                   }
                                    
                   else
                   {
                      if(CurrentSymbolTable.doesVariableExist(CurrentToken))
                      {
                         try
                         {
		           if(runstmt)
			   {
			      error = ExpressionEvaluator.run(tokens, CurrentToken);
			      //evaluate and get result and catch runtime errors
			   }

			   else
			   {
                              error = ExpressionEvaluator.Evaluate(tokens, CurrentToken);
			      //check syntax
			   }
                         }

                         catch(Exception Fatal)
                         {
                               System.out.println("\n" + ScriptFileName + ": " + "An exception was encountered on line " + line + " while trying to evaluate expression.\nPossible Cause: Invalid Expression Format.\n");
                               error = 666;
                         }
                      }

                      else
                      {
			 if(CurrentToken.compareTo("#") != 0)
		         {
                            System.out.println("\n" + ScriptFileName + ": " + "Undefined symbol " + CurrentToken + " in line " + line + "\n");
                            CurrentSymbolTable.display();
			 }
                      }
                   }
                }
             }

	     GetError();
      }

      public void GetError()
      {
             switch(error)
             {
                    case 1  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "; missing in line " + line + "\n");
                              errors++;
                              break;

                    case 2  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "\" missing in line " + line + "\n");
                              errors++;
                              break;

                    case 3  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Non-terminated string in line " + line + "\n");
                              errors++;
                              break;

                    case 4  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Invalid escape character in line " + line + "\n");
                              errors++;
                              break;

		    case 5  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Invalid declaration in line " + line + "\n");
                              errors++;
                              break;

                    case 7  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Cannot concatenate null in line " + line + "\n");
                              errors++;
                              break;

                    case 8  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "has not been initialized (line " + line + ")\n");
                              errors++;
                              break;

                    case 9  : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "has not been defined (line " + line + ")\n");
                              errors++;
                              break;

                    case 10 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Type of input value is incompatible with type of input variable (for variable in line " + line + ")\n");
                              errors++;
                              break;

                    case 11 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Invalid Expression in line " + line + "\n");
                              errors++;
                              break;

                    case 12 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "- Illegal symbol in line " + line + "\n");
                              errors++;
                              break;

                    case 13 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "} expected in line " + line + "\n");
                              errors++;
                              break;

                    case 14 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "] expected in line " + line + "\n");
			      errors++;
			      break;

                    case 15 : System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Variable to interpolate not specified in line " + line + "\n");
			      errors++;
			      break;

                    case 666: System.out.println("\n" + ScriptFileName + "::" + Scope + ": " + "Generic Error\n");
                              fatal = true;
                              break;
                              default : break;
             }               
      }
}
