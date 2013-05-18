import java.util.*;

class Interpreter
{
       static symbolTable currentSymbolTable;
       IO scriptIO;
       Evaluator ExpressionEvaluator;
       int line;

       public Interpreter()
       {
              currentSymbolTable = new symbolTable();
              scriptIO = new IO(currentSymbolTable);
	      ExpressionEvaluator = new Evaluator(currentSymbolTable);
	      currentSymbolTable.setEvaluatorObject(ExpressionEvaluator);
              line = 1;
       }

       public boolean Interpret(StringTokenizer tokens) throws Exception
       {
              String KeyWord = "";
              int error = 0;
              boolean fatal = false;

              while(tokens.hasMoreTokens() && !fatal)
              {
                    KeyWord = tokens.nextToken();

                    if(KeyWord.trim().length() == 0)
                    {
                       KeyWord = tokens.nextToken();
                    }

                    if(KeyWord.trim().compareTo(">") == 0)
                    {
                       error = scriptIO.PrintCommand(tokens);
                    }

                    else
                    {
                       if(KeyWord.compareTo("<") == 0)
                       {
                          error = scriptIO.InputCommand(tokens);
                       }

                       else
                       {
                          if(KeyWord.compareTo("double") == 0 || 
                             KeyWord.compareTo("int") == 0 || 
                             KeyWord.compareTo("float") == 0 || 
                             KeyWord.compareTo("char") == 0 || 
                             KeyWord.compareTo("boolean") == 0 ||
			     KeyWord.compareTo("double@") == 0 ||
			     KeyWord.compareTo("int@") == 0 ||
			     KeyWord.compareTo("float@") == 0 ||
			     KeyWord.compareTo("char@") == 0 ||
			     KeyWord.compareTo("boolean@") == 0)
                          {                                   
                             try
                             {
                               error = currentSymbolTable.addNewVariable(tokens, KeyWord);
                             }

                             catch(MyException Fatal)
                             {
                                   System.out.println("An exception was encountered on line " + line + " while trying to initialize variable.");
                                   fatal = true;
				   error = 666;
                             }
                          }
                                
                          else
                          {
                             if(KeyWord.compareTo("#") == 0)
                             {
                                tokens = new StringTokenizer("");
                             }

                             else
                             {
			        if(currentSymbolTable.doesVariableExist(KeyWord))
				{
				   try
				   {
				     error = ExpressionEvaluator.Evaluate(tokens, KeyWord);
                                   }

				   catch(Exception Fatal)
				   {
					 System.out.println("An exception was encountered on line " + line + " while trying to evaluate expression.\nPossible Cause: Invalid Expression Format.");
					 error = 666;
                                   }
                                }

				else
				{
                                   System.out.println("Undefined symbol " + KeyWord + " in line " + line);
                                   currentSymbolTable.display();
                                   fatal = true;
                                }
                             }
                          }
                       }
                    }

                    switch(error)
                    {
                           case 1  : System.out.println("; missing in line " + line);
                                     fatal = true;
                                     break;

                           case 2  : System.out.println("\" missing in line " + line);
                                     fatal = true;
                                     break;

                           case 3  : System.out.println("Non-terminated string in line " + line);
                                     fatal = true;
                                     break;

                           case 4  : System.out.println("Invalid escape character in line " + line);
                                     fatal = true;
                                     break;

                           case 5  : System.out.println("Invalid Declaration in line " + line);
                                     fatal = true;
                                     break;

                           case 6  : System.out.println("Too many or too little +'s in line " + line);
                                     fatal = true;
                                     break;

                           case 7  : System.out.println("Cannot concatenate null in line " + line);
                                     fatal = true;
                                     break;

                           case 8  : System.out.println("has not been initialized (line " + line + ")");
                                     fatal = true;
                                     break;

                           case 9  : System.out.println("has not been defined (line " + line + ")");
                                     fatal = true;
                                     break;

                           case 10 : System.out.println("Type of input value is incompatible with type of input variable (for variable in line " + line + ")");
                                     fatal = true;
                                     break;

                           case 11 : System.out.println("Invalid Expression in line " + line);
                                     fatal = true;
                                     break;

                           case 12 : System.out.println("- Illegal symbol in line " + line);
				     fatal = true;
				     break;

			   case 666: System.out.println("Generic Error");
				     fatal = true;
				     break;

                           default : break;
                    }               
              }

              line++;

              return fatal;
       }
}
