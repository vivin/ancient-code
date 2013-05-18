import java.util.*;
import java.io.*;

public class Evaluator implements Cloneable
{
    ObjectStack ExprStack;
    symbolTable currentSymbolTable;

    public Evaluator()
    {
           currentSymbolTable = new symbolTable();
    }

    public Evaluator(symbolTable thisSymbolTable)
    {
           currentSymbolTable = thisSymbolTable;
    }

    private boolean parensCheck(String Expr)
    {
            int parens = 0;

            for(int i = 0; i < Expr.length(); i++)
            {
                if(Expr.charAt(i) == '(')
                {
                   parens++;
                }

                else
                {
                   if(Expr.charAt(i) == ')')
                   {
                      parens--;
                   }
                }
            }

            return (parens == 0);
    }

    private int countParens(ObjectStack Stack)
    {
            String element = "";
	    int count = 0;
            
	    while(!Stack.isEmpty())
	    {
	          if(element.compareTo("(") == 0 || element.compareTo(")") == 0)
		  {
		     count++;
		  }
            }

	    return count;
    }

    public int Evaluate(StringTokenizer tokens, String FirstToken) throws MyException
    {
           int errcode = 0;
           boolean error = false;
           String Expr = "";
           String VarName = "";
           String Token = "";
           String VarType = "";
	   String result = "";

	   Expr += FirstToken.trim();

           while(tokens.hasMoreTokens())
           {
                 Expr += tokens.nextToken().trim();
           }

           if(!Expr.endsWith(";"))
           {
              error = true;
              errcode = 1;
           }

           if(!error)
           {
              if(!parensCheck(Expr))
              {
                 System.out.println("\nUnbalanced parenthesis");
                 error = true;
                 errcode = 11;
              }
           }

           if(!error)
           {
              tokens = new StringTokenizer(Expr, "=()+-/*%^", true);

              Expr = "";
	      
              while(tokens.hasMoreTokens())
              {
	            Expr += tokens.nextToken().trim();
              }

	      Expr = Expr.substring(0, Expr.length() - 1);

              tokens = new StringTokenizer(Expr, "=()+-/*%^", true);

              VarName = tokens.nextToken();

              if(!currentSymbolTable.doesVariableExist(VarName))
	      
              {
                 error = true;
                 errcode = 9;
              }

              else
              {
                 VarType = currentSymbolTable.getTypeOf(VarName);

		 if(VarType.compareTo("char") == 0 || VarType.compareTo("boolean") == 0)
		 {
		    error = true;
		    errcode = 11;
		    System.out.println("\nMathematical operations cannot be performed on " + VarType);
                 }

                 Token = tokens.nextToken();

                 if(Token.compareTo("=") != 0)
                 {
                    error = true;
                    errcode = 11;
                    System.out.println("\nAssignment symbol: \"=\" missing");
                 }

                 if(!error)
                 {
                    errcode = organizeValueStack(tokens, VarType, VarName);

		    if(errcode == 0)
		    {
                       VarType = currentSymbolTable.getTypeOf(VarName);
		       makePostFix();
		       result = calculate();
		       currentSymbolTable.setNewValue(VarName, VarType, result);
		    }
                 }

              }
	   }

	   return errcode;
    }

    private int organizeValueStack(StringTokenizer tokens, String ResultType, String ResultName) throws MyException
    {
            ObjectStack TempStack = new ObjectStack(tokens.countTokens());
	    String Token = "";
	    String LastToken = "";
	    String VarName = "";
	    String VarValue = "";
	    String VarType = "";
	    String TokenType = "";
	    String Sign = "";
	    String Expr = "";
            int sign = 1;
	    int errcode = 0;
            boolean error = false;
	    boolean done = false;
	    boolean unaryop = false;

	    ExprStack = new ObjectStack(tokens.countTokens());

            while(!error && tokens.hasMoreTokens())
	    {
	          LastToken = Token;
                  Token = tokens.nextToken();

		  if(Token.compareTo("(") == 0)
		  {
		     if(LastToken.compareTo("+") != 0 &&
		        LastToken.compareTo("-") != 0 &&
			LastToken.compareTo("*") != 0 &&
			LastToken.compareTo("/") != 0 &&
			LastToken.compareTo("%") != 0 &&
			LastToken.compareTo("^") != 0 &&
                        LastToken.compareTo("(") != 0)			
		     {
		        TempStack.push(Token);
		     }
                  }

		  else
		  {
                     if((Token.compareTo("+") == 0 ||
		         Token.compareTo("-") == 0) &&
			LastToken.compareTo("(") == 0)
                     {
		        Sign = Token;
                        VarName = tokens.nextToken();
			Token = tokens.nextToken();

			if(Sign.compareTo("+") == 0)
			{
			   sign = 1;
			}

			else
			{
			   sign = -1;
			}

			if(Token.compareTo(")") != 0)
			{
			   error = true;
			   errcode = 11;
			   System.out.println("Unbalanced Parenthesis");
                        }

			else
			{
			   TokenType = currentSymbolTable.typeOf(VarName);

			   if(TokenType.compareTo("invalid") == 0)
			   {
                              error = true;
			      errcode = 11;
			      System.out.println("\nIllegal Symbol in Expression: " + VarName);
			   }

			   else
			   {
                              if(ResultType.compareTo("undefined") == 0)
                              {
                                 ResultType = TokenType.toString();
                                 currentSymbolTable.setType(ResultName, ResultType);
                              }

                              if(ResultType.compareTo("double") == 0 &&
			         (TokenType.compareTo("float") == 0 ||
                                  TokenType.compareTo("double") == 0))
                              {
				 if(TokenType.compareTo("double") == 0)
				 {
                                    TempStack.push(new Double(sign * new Double(VarName).doubleValue()).toString());
				 }

				 else
				 {
				    TempStack.push(new Float(sign * new Float(VarName).floatValue()).toString());
				 }
			      }

			      else
			      {
                                 if(ResultType.compareTo("float") == 0 &&
				    TokenType.compareTo("float") ==0)
				 {
				    TempStack.push(new Float(sign * new Float(VarName).floatValue()).toString());
				 }

				 else
				 {
				    if(ResultType.compareTo("int") == 0 &&
				       TokenType.compareTo("int") == 0)
				    {
				       TempStack.push(new Integer(sign * Integer.parseInt(VarName)).toString());
				    }

				    else
				    {
                                       if(TokenType.compareTo("Identifier") == 0)
				       {
                                          if(!currentSymbolTable.doesVariableExist(VarName))
					  {
					     error = true;
					     errcode = 9;
					     System.out.print("\n" + VarName + " ");
					  }

					  else
					  {
                                             VarValue = currentSymbolTable.getStringValueOf(VarName);

					     if(VarValue == null)
					     {
					        error = true;
						errcode = 8;
						System.out.print("\n" + VarName + " ");
					     }

					     else
					     {
                                                if(VarValue.compareTo("null") == 0)
						{
						   error = true;
						   errcode = 8;
						   System.out.print("\n" + VarName + " ");
						}

						else
						{
						   VarType = currentSymbolTable.getTypeOf(VarName);

                                                   if(VarType.compareTo("boolean") == 0 ||
						      VarType.compareTo("char") == 0)
						   {
                                                      error = true;
						      errcode = 11;
						      System.out.println("\nCannot perform mathematical operations on type " + VarType);
						   }

						   else
						   {
                                                      if(VarType.compareTo(ResultType) != 0)
						      {
						         error = true;
							 errcode = 11;
							 System.out.println("\nIncompatible type for \'=\'. Cannot assign " + VarType + " to " + ResultType);
						      }

						      else
						      {
                                                         if(VarType.compareTo("double") == 0)
							 {
                                                            TempStack.push(new Double(sign * currentSymbolTable.getDoubleValueOf(VarName)).toString());
							 }

							 else
							 {
                                                            if(VarType.compareTo("float") == 0)
							    {
                                                               TempStack.push(new Float(sign * currentSymbolTable.getFloatValueOf(VarName)).toString());
							    }

							    else
							    {
                                                               TempStack.push(new Integer(sign * currentSymbolTable.getIntValueOf(VarName)).toString());
							    }
							 }
						      }
						   }
						}
					     }
					  }
				       }

				       else
				       {
					  if(TokenType.compareTo("boolean") == 0 ||
					     TokenType.compareTo("char") == 0)
					  {
					     error = true;
					     errcode = 11;
					     System.out.println("\nCannot perform mathematical operations on type " + TokenType);
					  }

					  else
					  {
					     if(TokenType.compareTo(ResultType) != 0)
					     {
					        error = true;
						errcode = 11;
						System.out.println("\nIncompatible type for \'=\'. Cannot assign " + TokenType + " to " + ResultType);
                                             }
					  }
				       }
				    }
				 }
			      }
			   }
			}
		     }

		     else
		     {
                        if(Token.compareTo("+") == 0 ||
			   Token.compareTo("-") == 0 ||
			   Token.compareTo("*") == 0 ||
			   Token.compareTo("/") == 0 ||
			   Token.compareTo("%") == 0 ||
			   Token.compareTo("^") == 0 ||
			   Token.compareTo(")") == 0)
			{
			   TempStack.push(Token);
			}

			else
			{
			   TokenType = currentSymbolTable.typeOf(Token);

                           if(ResultType.compareTo("undefined") == 0)
                           {
                              ResultType = TokenType.toString();
                              currentSymbolTable.setType(ResultName, ResultType);
                           }

			   if(TokenType.compareTo("invalid") == 0)
			   {
                              error = true;
			      errcode = 11;
			      System.out.println("\nIllegal symbol in Expression: " + Token);
			   }

			   else
			   {
                              if(TokenType.compareTo("boolean") == 0 ||
			         TokenType.compareTo("char") == 0)
			      {
                                 System.out.println("\nCannot perform mathematical operations on type " + TokenType);
			      }

			      else
			      {
                                 if(ResultType.compareTo("double") == 0 &&
				    (TokenType.compareTo("double") == 0 ||
				     TokenType.compareTo("float") == 0))
				 {
 				    if(TokenType.compareTo("double") == 0)
				    {
                                       TempStack.push(new Double(new Double(Token).doubleValue()).toString());
				    }

				    else
				    {
				       TempStack.push(new Float(new Float(Token).floatValue()).toString());
				    }
				 }

				 else
				 {
                                    if(ResultType.compareTo("float") == 0 &&
				       TokenType.compareTo("float") == 0)
				    {
				       TempStack.push(new Float(new Float(Token).floatValue()).toString());
				    }

				    else
				    {
				       if(ResultType.compareTo("int") == 0 &&
				          TokenType.compareTo("int") == 0)
				       {
				          TempStack.push(new Integer(Integer.parseInt(Token)).toString());
				       }

				       else
				       {
                                          if(TokenType.compareTo("Identifier") == 0)
                                          {
					     VarName = Token;

                                             if(!currentSymbolTable.doesVariableExist(VarName))
					     {
					        error = true;
					        errcode = 9;
					        System.out.print("\n" + VarName + " ");
					     }

					     else
					     {
                                                VarValue = currentSymbolTable.getStringValueOf(VarName);

					        if(VarValue == null)
					        {
					           error = true;
						   errcode = 8;
						   System.out.print("\n" + VarName + " ");
					        }

					        else
					        {
                                                   if(VarValue.compareTo("null") == 0)
						   {
						      error = true;
						      errcode = 8;
						      System.out.print("\n" + VarName + " ");
						   }

						   else
						   {
						      VarType = currentSymbolTable.getTypeOf(VarName);

                                                      if(VarType.compareTo("boolean") == 0 ||
						         VarType.compareTo("char") == 0)
						      {
                                                         error = true;
						         errcode = 11;
						         System.out.println("\nCannot perform mathematical operations on type " + VarType);
						      } 

						      else
						      {
                                                         if(VarType.compareTo(ResultType) != 0)
						         {
						            error = true;
							    errcode = 11;
							    System.out.println("\nIncompatible type for \'=\'. Cannot assign " + VarType + " to " + ResultType);
						         }

						         else
						         {
                                                           if(VarType.compareTo("double") == 0)
							    {
                                                              TempStack.push(new Double(currentSymbolTable.getDoubleValueOf(VarName)).toString());
							    }

							    else
							    {
                                                               if(VarType.compareTo("float") == 0)
							       {
                                                                  TempStack.push(new Float(currentSymbolTable.getFloatValueOf(VarName)).toString());
							       }

							       else
							       {
                                                                  TempStack.push(new Integer(currentSymbolTable.getIntValueOf(VarName)).toString());
							       }
							    }
						         }
						      }
						   }
					        }
					     }
					  }

					  else
					  {
                                             if(TokenType.compareTo(ResultType) != 0)
					     {
                                                error = true;
						errcode = 11;
						System.out.println("\nIncompatible type for \'=\'. Cannot assign " + TokenType + " to " + ResultType);
					     }
					  }
				       }
                                    }
				 }
			      }
			   }
			}
		     }
		  }
	    }

	    if(!error)
	    {
	       while(!TempStack.isEmpty())
	       {
	             ExprStack.push(TempStack.pop());
	       }
	    }

            /*ObjectStack stk = (ObjectStack) ExprStack.clone();

	    while(!stk.isEmpty())
	    {
	          System.out.print("|" + (String) stk.pop() + "|");
            }*/

	    return errcode;

    }

    private void makePostFix()
    {
	    String element = "";
	    ObjectStack InfixStack = (ObjectStack) ExprStack.clone();
	    ObjectStack TempStack = new ObjectStack(ExprStack.getCapacity());
	    ExprStack = new ObjectStack(TempStack.getCapacity() - countParens((ObjectStack) TempStack.clone()));

            while(!InfixStack.isEmpty())
	    {
	          element = (String) InfixStack.pop();

		  if(element.compareTo("+") == 0 ||
		     element.compareTo("-") == 0 ||
		     element.compareTo("*") == 0 ||
		     element.compareTo("/") == 0 ||
		     element.compareTo("%") == 0 ||
		     element.compareTo("^") == 0)
		  {
		     TempStack.push(element);
                  }

		  else
		  {
		     if(element.compareTo("(") != 0 && element.compareTo(")") != 0)
		     {
		        ExprStack.push(element);
		     }

		     else
		     {
                        if(element.compareTo(")") == 0)
			{
			   ExprStack.push(TempStack.pop());
                        }
		     }
		  } 
            }	

	    if(!TempStack.isEmpty())
	    {
	       ExprStack.push(TempStack.pop());
	    } 	     

            while(!ExprStack.isEmpty())
	    {
	          element = (String) ExprStack.pop();

		  if(element.trim().compareTo("") != 0)
		  {
	             TempStack.push(element);
		  }
            }

	    ExprStack = TempStack;
    }

    private String calculate()
    {
            ObjectStack TempStack = new ObjectStack();
	    ObjectStack HoldStack = new ObjectStack(ExprStack.getCapacity());
	    TempStack = (ObjectStack) ExprStack.clone();

	    String element = "";
	    String opr = "";
	    String op1 = "";
	    String op2 = "";
	    String result = "";
	    String FinalResult = "";

	    boolean UnaryExpression = false;

	    if(TempStack.size() == 1)
	    {
	       FinalResult = (String) TempStack.pop();
	       UnaryExpression = true;
	    }

            while(!TempStack.isEmpty() && !UnaryExpression)
	    {
	          element = (String) TempStack.pop();

		  if(element.compareTo("+") == 0 ||
		     element.compareTo("-") == 0 ||
		     element.compareTo("*") == 0 ||
		     element.compareTo("/") == 0 ||
		     element.compareTo("%") == 0 ||
		     element.compareTo("^") == 0)
		  {
		     op2 = (String) HoldStack.pop();
		     op1 = (String) HoldStack.pop();
                     opr = element;

		     result = compute(op1, opr, op2);
		     FinalResult = result;

		     TempStack.push(result);
		  }

		  else
		  {
		     HoldStack.push(element);
		  }
            }

	    return FinalResult;
    }

    private String compute(String op1, String opr, String op2)
    {
            String result = "";
	    String VarType = "";

	    VarType = currentSymbolTable.typeOf(op1);

	    if(VarType.compareTo("double") == 0)
	    {
	       if(opr.compareTo("+") == 0)
	       {
	          result = new Double(new Double(op1).doubleValue() + new Double(op2).doubleValue()).toString();
               }

	       else
	       {
                  if(opr.compareTo("-") == 0)
		  {
		     result = new Double(new Double(op1).doubleValue() - new Double(op2).doubleValue()).toString();
                  }

		  else
		  {
                     if(opr.compareTo("*") == 0)
		     {
		        result = new Double(new Double(op1).doubleValue() * new Double(op2).doubleValue()).toString();
                     }

		     else
		     {
		        if(opr.compareTo("/") == 0)
			{
			   result = new Double(new Double(op1).doubleValue() / new Double(op2).doubleValue()).toString();
                        }

			else
			{
                           if(opr.compareTo("%") == 0)
			   {
			      result = new Double(new Double(op1).doubleValue() % new Double(op2).doubleValue()).toString();
                           }

			   else
			   {
			      if(opr.compareTo("^") == 0)
			      {
                                 result = new Double(Math.pow(new Double(op1).doubleValue(), new Double(op2).doubleValue())).toString();
			      }
			   }
			}
                     }
		  }
               }
	    }

	    else
	    {
               if(VarType.compareTo("float") == 0)
	       {
                  if(opr.compareTo("+") == 0)
		  {
                     result = new Float(new Float(op1).floatValue() + new Float(op2).floatValue()).toString();
		  }

		  else
		  {
                     if(opr.compareTo("-") == 0)
		     {
                        result = new Float(new Float(op1).floatValue() - new Float(op2).floatValue()).toString();
		     }

		     else
		     {
                        if(opr.compareTo("*") == 0)
			{
			   result = new Float(new Float(op1).floatValue() * new Float(op2).floatValue()).toString();
                        }

			else
			{
			   if(opr.compareTo("/") == 0)
			   {
			      result = new Float(new Float(op1).floatValue() / new Float(op2).floatValue()).toString();
                           }

			   else
			   {
                              if(opr.compareTo("%") == 0)
			      {
			         result = new Float(new Float(op1).floatValue() % new Float(op2).floatValue()).toString();
                              }

			      else
			      {
                                 if(opr.compareTo("^") == 0)
				 {
				    result = new Float(Math.pow(new Float(op1).floatValue(), new Float(op2).floatValue())).toString();
                                 }
			      }
			   }
			}
		     }
		  }
	       }

	       else
	       {
                  if(VarType.compareTo("int") == 0)
		  {
                     if(opr.compareTo("+") == 0)
		     {
		        result = new Integer(new Integer(op1).intValue() + new Integer(op2).intValue()).toString();
                     }

		     else
		     {
                        if(opr.compareTo("-") == 0)
			{
                           result = new Integer(new Integer(op1).intValue() - new Integer(op2).intValue()).toString();
			}

			else
			{
                           if(opr.compareTo("*") == 0)
			   {
                              result = new Integer(new Integer(op1).intValue() * new Integer(op2).intValue()).toString();
			   }

			   else
			   {
                              if(opr.compareTo("/") == 0)
			      {
                                 result = new Integer(new Integer(op1).intValue() / new Integer(op2).intValue()).toString();
			      }

			      else
			      {
                                 if(opr.compareTo("%") == 0)
				 {
                                    result = new Integer(new Integer(op1).intValue() % new Integer(op2).intValue()).toString();
				 }

				 else
				 {
                                    if(opr.compareTo("^") == 0)
				    {
				       result = new Integer((int) Math.pow(new Integer(op1).intValue(), new Integer(op2).intValue())).toString();
                                    }
				 }
			      }
			   }
			}
		     }
		  }
	       }
	    }

	    return result;
    }
}

