import java.util.*;
import java.io.*;
import java.io.IOException;

class symbolTable
{
      Vector variableList;
      Variable newVariable;
      Array newArray;
      Evaluator ExpressionEvaluator;
      int variableCount;
      MyException UndefinedVariableException;
      MyException TypeCastException;

      symbolTable()
      {
                  variableList = new Vector();           
                  newVariable = new Variable();
                  newArray = new Array();
                  UndefinedVariableException = new MyException("UndefinedVariableException");
                  TypeCastException = new MyException("TypeCastException");
      }

      public void setEvaluatorObject(Evaluator ExprEvaluator)
      {
                  ExpressionEvaluator = ExprEvaluator;
      }

      public void addVariable(String varName, String varType, String varValue)
      {
             newVariable = new Variable(varType, varName, varValue);
             variableList.addElement(newVariable);
             variableCount++;
      }

      public void addArray(String ArrayName, String ArrayType, String ArraySize)
      {
             newArray = new Array(ArrayName, ArrayType, ArraySize);
             variableList.addElement(newArray);
             variableCount++;
      }

      public void addArray(String ArrayName, String ArrayType, String ArraySize, String[] ArrayVals)
      {
             newArray = new Array(ArrayName, ArrayType, ArraySize);
             
             for(int i = 0; i < new Integer(ArraySize).intValue(); i++)
             {
                 newArray.setValueAsStringAt(ArrayVals[i], i);
             }

             variableList.addElement(newArray);
             variableCount++;
      }

      public int directAssignmentFromVarResult(String varType, String castType, String expressionType, String varName, String Expression) throws Exception
      {
             int errcode = 0;

             if(varType.compareTo("double") == 0)
             {
                addVariable(varName, varType, getStringValueOf(Expression));
             }

             else
             {
                if(varType.compareTo("float") == 0 && expressionType.compareTo("double") != 0)
                {
                   addVariable(varName, varType, getStringValueOf(Expression));                                                
                }

                else
                {
                   if(varType.compareTo("int") == 0 && expressionType.compareTo("float") != 0 && expressionType.compareTo("double") != 0)
                   {
                      addVariable(varName, varType, getStringValueOf(Expression));
                   }

                   else
                   {
                      if(varType.compareTo("char") == 0 && expressionType.compareTo("int") != 0 && expressionType.compareTo("float") != 0 && expressionType.compareTo("double") != 0)
                      {
                         addVariable(varName, varType, getStringValueOf(Expression));
                      }

                      else
                      {
                         if(varType.compareTo("boolean") == 0 && expressionType.compareTo("boolean") == 0)
                         {
                            addVariable(varName, varType, getStringValueOf(Expression));
                         }

                         else
                         {
                            if(varType.compareTo("boolean") == 0 && expressionType.compareTo("boolean") != 0)
                            {
                               errcode = 5;
                               System.out.println("\nIncompatible type for declaration. Cannot convert " + expressionType + " to " + varType);
                            }

                            else
                            {
                               errcode = 5;
                               System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + expressionType + " to " + varType);
                            }
                         }
                      }
                   }
                }
             }

             return errcode;
      }

      public int directAssignmentResult(String varType, String castType, String expressionType, String varName, String Expression) throws Exception
      {
             int errcode = 0;

             if(varType.compareTo("double") == 0  && expressionType.compareTo("boolean") != 0)
             {
                if(expressionType.compareTo("char") == 0)
                {
                   addVariable(varName, varType, new Double((double) Expression.charAt(1)).toString());
                }

                else
                {
                   addVariable(varName, varType, new Double(Expression).toString());
                } 
             }

             else
             {
                if(varType.compareTo("float") == 0 && expressionType.compareTo("double") != 0  && expressionType.compareTo("boolean") != 0)
                {
                   if(expressionType.compareTo("char") == 0)
                   {
                      addVariable(varName, varType, new Float((float) Expression.charAt(1)).toString());
                   }
 
                   else
                   {
                      addVariable(varName, varType, new Float(Expression).toString());
                   } 
                }

                else
                {
                   if(varType.compareTo("int") == 0 && expressionType.compareTo("float") != 0 && expressionType.compareTo("double") != 0 && expressionType.compareTo("boolean") != 0)
                   {
                      if(expressionType.compareTo("char") == 0)
                      {
                         addVariable(varName, varType, new Integer((int) Expression.charAt(1)).toString());
                      }

                      else
                      {
                         addVariable(varName, varType, new Integer(Expression).toString());
                      } 
                   }

                   else
                   {
                      if(varType.compareTo("char") == 0 && expressionType.compareTo("int") != 0 && expressionType.compareTo("float") != 0 && expressionType.compareTo("double") != 0 && expressionType.compareTo("boolean") != 0)
                      {
                         addVariable(varName, varType, new StringBuffer("").append(Expression.charAt(1)).toString());
                      }

                      else
                      {
                         if(varType.compareTo("boolean") == 0 && expressionType.compareTo("boolean") == 0)
                         {
                            addVariable(varName, varType, new Boolean(Expression).toString());
                         }

                         else
                         {
                            if(varType.compareTo("boolean") == 0 && expressionType.compareTo("boolean") != 0)
                            {
                               errcode = 5;
                               System.out.println("\nIncompatible type for declaration. Cannot convert " + expressionType + " to " + varType);
                            }

                            else
                            {
                               if(varType.compareTo("boolean") != 0 && expressionType.compareTo("boolean") == 0)
                               {
                                  errcode = 5;
                                  System.out.println("\nIncompatible type for declaration. Cannot convert " + expressionType + " to " + varType);
                               }

                               else
                               {
                                  errcode = 5;
                                  System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + expressionType + " to " + varType);
                               }
                            }
                         }
                      }
                   }
                }
             }

             return errcode;
      }

      public int explicitCastResult(String varType, String castType, String expressionType, String varName, String Expression)
      {
             int errcode = 0;

             if(varType.compareTo("double") == 0)
             {
                if(castType.compareTo("int") == 0 && expressionType.compareTo("char") == 0)
                {
                   addVariable(varName, varType, new Double(new Integer((int) Expression.charAt(1)).toString()).toString());
                }
                                                     
                else
                {
                   if(castType.compareTo("int") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                   {
                      addVariable(varName, varType, new Double((int) new Double(Expression).doubleValue()).toString());
                   }

                   else
                   {
                      if(castType.compareTo("float") == 0 && expressionType.compareTo("char") == 0)
                      {
                         addVariable(varName, varType, new Double(new Float((float) Expression.charAt(1)).toString()).toString());
                      }

                      else
                      {
                         if(castType.compareTo("float") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                         {
                            addVariable(varName, varType, new Double(new Float(Expression).toString()).toString());
                         }

                         else
                         {
                            if(castType.compareTo("char") == 0 && expressionType.compareTo("char") == 0)
                            {
                               addVariable(varName, varType, new Double((double) Expression.charAt(1)).toString());
                            }

                            else
                            {
                               if(castType.compareTo("char") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                               {
                                  addVariable(varName, varType, new Double((int) new Double(Expression).doubleValue()).toString());
                               }

                               else
                               {
                                  if(castType.compareTo("double") == 0 && expressionType.compareTo("char") == 0)
                                  {
                                     addVariable(varName, varType, new Double((double) Expression.charAt(1)).toString());
                                  }

                                  else
                                  {
                                     if(castType.compareTo("double") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                                     {
                                        addVariable(varName, varType, new Double(Expression).toString());
                                     }
  
                                     else
                                     {
                                        errcode = 5;
                                        System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + castType + " to " + varType);
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
                if(varType.compareTo("float") == 0)
                {
                   if(castType.compareTo("int") == 0 && expressionType.compareTo("char") == 0)
                   {
                      addVariable(varName, varType, new Float(new Integer ((int) Expression.charAt(1)).toString()).toString());
                   }

                   else
                   {
                      if(castType.compareTo("int") == 0 && (expressionType.compareTo("int") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("double") == 0))
                      {
                         addVariable(varName, varType, new Float((int) new Double(Expression).doubleValue()).toString());
                      }

                      else
                      {
                         if(castType.compareTo("char") == 0 && expressionType.compareTo("char") == 0)
                         {
                            addVariable(varName, varType, new Float(new Integer((int) Expression.charAt(1)).toString()).toString());
                         }

                         else
                         {
                            if(castType.compareTo("char") == 0 && (expressionType.compareTo("int") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("double") == 0))
                            {
                               addVariable(varName, varType, new Float((int) new Float(Expression).floatValue()).toString());
                            }

                            else
                            {
                               if(castType.compareTo("float") == 0 && expressionType.compareTo("char") == 0)
                               {
                                  addVariable(varName, varType, new Float((float) Expression.charAt(1)).toString());
                               }

                               else
                               {
                                  if(castType.compareTo("float") == 0 && (expressionType.compareTo("int") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("double") == 0))
                                  {
                                     addVariable(varName, varType, new Float(Expression).toString());
                                  }
   
                                  else
                                  {
                                     errcode = 5;
                                     System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + castType + " to " + varType);
                                  }
                               }
                            }
                         }
                      }
                   }
                }
                                                     
                else
                {
                   if(varType.compareTo("int") == 0)
                   {
                      if(castType.compareTo("int") == 0 && expressionType.compareTo("char") == 0)
                      {
                         addVariable(varName, varType, new Integer((int) Expression.charAt(1)).toString());
                      }

                      else
                      {
                         if(castType.compareTo("int") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                         {
                            addVariable(varName, varType, new Integer((int) new Double(Expression).doubleValue()).toString());
                         }

                         else
                         {
                            if(castType.compareTo("char") == 0 && expressionType.compareTo("char") == 0)
                            {
                               addVariable(varName, varType, new Integer((int) Expression.charAt(1)).toString());
                            }

                            else
                            {
                               if(castType.compareTo("char") == 0 && (expressionType.compareTo("double") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("int") == 0))
                               {
                                  addVariable(varName, varType, new Integer((int) new Double(Expression).doubleValue()).toString());
                               }

                               else
                               {
                                  errcode = 5;
                                  System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + castType + " to " + varType);
                               }
                            }
                         }
                      }
                   }

                   else
                   {
                      if(varType.compareTo("char") == 0)
                      {
                         if(castType.compareTo("char") == 0 && expressionType.compareTo("char") == 0)
                         {
                            addVariable(varName, varType, new StringBuffer("").append(Expression.charAt(1)).toString());
                         }

                         else
                         {
                            if(castType.compareTo("char") == 0 && (expressionType.compareTo("int") == 0 || expressionType.compareTo("float") == 0 || expressionType.compareTo("double") == 0))
                            {
                               addVariable(varName, varType, new StringBuffer("").append((char) new Double(Expression).doubleValue()).toString());
                            }

                            else
                            {
                               errcode = 5;
                               System.out.println("\nIncompatible type for declaration. Explicit cast required to convert " + castType + " to " + varType);
                            }
                         }
                      }

                      else
                      {
                         if(varType.compareTo("boolean") == 0)
                         {
                            if(castType.compareTo("boolean") == 0 && expressionType.compareTo("boolean") == 0)
                            {
                               addVariable(varName, varType, new Boolean(Expression).toString());
                            }

                            else
                            {
                               errcode = 5;
                               System.out.println("\nIncompatible type for declaration. Cannot convert " + expressionType + " to " + varType);
                            }
                         }
                      }
                   }
                }         
             }

             return errcode;
      }

      public int addNewIdentifier(StringTokenizer tokens, String KeyWord) throws Exception
      {
             int errcode = 0;

             if(KeyWord.indexOf("@") >= 0)
             {
                errcode = addNewArray(tokens, KeyWord);
             }

             else
             {
                errcode = addNewVariable(tokens, KeyWord);
             }

             return errcode;
      }

      //some things to remember here addNewArray will truncate an array argument if it contains more than the assigned size eg:
      //int stuff{5} = (1, 2, 3, 4, 5, 6); will have only 1, 2, 3, 4, 5 assigned to it. Arrays run from 0 to n - 1 like
      //C/C++/Java. In the case int stuff{5} = arr; where arr is an array, they have to be of equal sizes and types.

      public int addNewArray(StringTokenizer tokens, String KeyWord) throws Exception
      {
             String[] ArrayVals;
             String RValue = "";
             String RValType = "";
             String ValidateResult = "";
             String ArrayType = KeyWord.substring(0, KeyWord.length() - 1);
             String ArrayName = "";
             String ArraySize = "";
             String initArr = "";
             String token = "";
             String type = "";
             int errcode = 0;
             int lb_idx = 0;
             int rb_idx = 0;
             boolean error = false;
             boolean done = false;

             if(!tokens.hasMoreTokens())
             {
                 error = true;
                 errcode = 1;
             }

             while(tokens.hasMoreTokens())
             {
                   initArr += tokens.nextToken();
             }

             initArr = initArr.trim();

             if(!initArr.endsWith(";"))
             {
                errcode = 1;
                error = true;
             }

             tokens = new StringTokenizer(initArr, "=; ,", true);

             token = tokens.nextToken().trim();

             if(token.compareTo(";") == 0)
             {
                System.out.println("\nMissing Identifier");
                error = true;
             }

             while(!error && !done)
             {
                   if(token.compareTo(";") == 0)
                   {
                      done = true;
                      //this is when we loop back up after we are done with the case:
                      //int arr{5} = (1, 2, 3, 4, 5); and we need to check for the ;
                   }

                   else
                   {
                      if(token.compareTo(",") == 0)
                      {
                         token = tokens.nextToken().trim();
                         //if there is a comma here, it means that we have to look for the next token which is
                         //an identifier name.
                      }

                      lb_idx = token.indexOf("{");
                      rb_idx = token.lastIndexOf("}");

                      if((lb_idx == 0) || (rb_idx == 0))
                      {
                         System.out.println("\nMissing Identifier");
                         error = true;
                         errcode = 5;
                      }

                      else
                      {
                         if((lb_idx == -1) || (rb_idx == -1))
                         {
                            System.out.println("\nUnbalanced braces");
                            error = true;
                            errcode = 5;
                         }

                         else
                         {
                            if(lb_idx > rb_idx)
                            {
                               System.out.println("\nIncorrect ordering of braces");
                               error = true;
                               errcode = 5;
                            }

                            else
                            {
                               if(rb_idx - lb_idx == 1)
                               {
                                  ArraySize = "0";
                                  type = "dynamic";
                               }

                               else
                               {
                                  ArraySize = token.substring((lb_idx + 1), rb_idx);
                                  type = typeOfArgument(ArraySize);
                               }


                               //there are two type functions. One looks at types of arguments during interpretation
                               //the other looks at the type of input provided the to < command. This call uses the
                               //typeOfArgument function that looks at values during interpretation type and determines
                               //their types. Eg: 'c' is a character during interpretation time and c is an indetifier.
                               //c is a character when given as an input to < and 'c' is a string (not yet implemented) 
                               //when supplied to <.

                               if(type.compareTo("expression") == 0)
                               {
                                  ExpressionEvaluator.makePostFix();
                                  ArraySize = ExpressionEvaluator.calculate();

				  type = typeOfArgument(ArraySize);

				  if(type.compareTo("double") == 0 ||
				     type.compareTo("float") == 0 ||
				     type.compareTo("char") == 0 ||
				     type.compareTo("boolean") == 0)
				  {
				     System.out.println("Invalid Array Size type. Expression evaluates to " + type);
				     error = true;
				     errcode = 5;
				  }

				  //check expression type here
                               }

                               else
                               {
                                  if(type.compareTo("double") == 0 ||
                                     type.compareTo("float") == 0 ||
                                     type.compareTo("char") == 0 ||
                                     type.compareTo("boolean") == 0)
                                  {
                                     System.out.println("\nArray Size cannot be of type " + type);
                                     error = true;
                                     errcode = 5;
                                  }

                                  else
                                  {
                                     if(type.compareTo("invalid") == 0)
                                     {
                                        System.out.println("\nInvalid Array Size argument");
                                        error = true;
                                        errcode = 5;
                                     }

                                     else
                                     {
                                        if(type.compareTo("Identifier") == 0)
                                        {
					   try
					   {
					     if(getVariable(ArraySize) == null)
					     {
					        errcode = 8;
						error = true;
						System.out.println("\n" + ArraySize + " ");
                                             }

					     else
                                             {
					        if(getVariable(ArraySize).compareTo("null") == 0)
						{
						   errcode = 8;
						   error = true;
						   System.out.println("\n" + ArraySize + " ");
						}

						else
						{
						   ArraySize = getVariable(ArraySize);
						}
				             }
					   }

					   catch(Exception VarException)
					   {
					         System.out.println(VarException.getMessage());
						 error = true;
						 errcode = 5;
				           }

					   if(!error)
					   {
					      type = typeOfArgument(ArraySize);

					      if(type.compareTo("double") == 0 ||
					         type.compareTo("float") == 0 ||
					         type.compareTo("char") == 0 ||
					         type.compareTo("boolean") ==0)
					      {
					         System.out.println("\nReference returns invalid Array Size type: " + type);
					         error = true;
					         errcode = 5;
					      }
					   }
                                        }

                                        else
                                        {
                                           if(type.compareTo("function") == 0)
                                           {
                                              //evaluate function - and see if it is valid
                                              //i plan to implement this sometime WAY in the future!
                                           }

                                           else
                                           {
                                              if(new Integer(ArraySize).intValue() < 0)
                                              {
                                                 System.out.println("\nArray Size cannot be negative");
                                                 error = true;
                                                 errcode = 5;
                                              }
                                           }
                                        }
                                     }
                                  }
                               }
                               
                               if(!error) 
                               {
                                  ArrayName = token.substring(0, lb_idx);

                                  ValidateResult = validateNameResult(ArrayName);
                                  //do a check here for a valid name and also check whether the name exists
                                  //already

                                  if(ValidateResult.length() != 0)
                                  {
                                     System.out.println("\n" + ValidateResult);
                                     error = true;
                                     errcode = 5;
                                  }

                                  else
                                  {
                                     token = tokens.nextToken().trim();

                                     if(token.compareTo(";") == 0)
                                     {
                                        addArray(ArrayName, ArrayType, ArraySize);
                                        done = true;
                                     }

                                     else
                                     {
                                        if(token.compareTo("=") != 0)
                                        {
                                           System.out.println("\nAssignment symbol \'=\' expected");
                                           error = true;
                                           errcode = 5;
                                        }

                                        else
                                        {
                                           token = tokens.nextToken().trim();

                                           if(token.compareTo(";") == 0)
                                           {
                                              System.out.println("\nRvalue required");
                                           }

                                           else
                                           {
                                              RValue = token;

                                              RValType = typeOfArgument(RValue);

                                              if(RValType.compareTo("valuelist") == 0)
                                              {
                                                 //validateValueList checks to see if it is a valid array list
                                                 //first of all, and then it checks to see if each argument
                                                 //in the list is valid. The values have to have the same type
                                                 //as ArrayType. ArraySize is included here because I plan to
                                                 //issue a warning to the user when an array will get
                                                 //truncated. This method also checks to see if each item in
                                                 //the list is valid. It will use the typeOfArgument(String) 
                                                 //method to do this. It will also check if the list itself is
                                                 //valid, that is, it checks if it is messed up or not... stuff
                                                 //like that.

                                                 errcode = validateValueList(RValue, ArrayType, ArraySize);
                                                 error = (errcode != 0);

                                                 if(!error)
                                                 {
                                                    //parseList works on the assumption that the list is proper
                                                    //and that all conditions are met for it to be valid.

                                                    ArrayVals = parseList(RValue);

                                                    addArray(ArrayName, ArrayType, ArraySize, ArrayVals);

                                                    token = tokens.nextToken().trim();
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
             }

             return errcode;
      }

      public int addNewVariable(StringTokenizer tokens, String KeyWord) throws Exception
      {
             String varType = KeyWord;
             int errcode = 0;
             int asciival = 0;
             boolean error = false;
             boolean done = false;
             String initVar = "";
             String Expression = "";
             String currentToken = "";
             String expressionType = "";
             String castType = "";

             if(!tokens.hasMoreTokens())
             {
                error = true;
                errcode = 1;
             }

             while(tokens.hasMoreTokens())
             {
                   initVar += tokens.nextToken();
             }

             initVar = initVar.trim();

             if(!initVar.endsWith(";"))
             {
                errcode = 1;
                error = true;
             }

             tokens = new StringTokenizer(initVar, "()=\r\\>\"; ,", true);

             while(!error && !done)
             {
                 if(tokens.hasMoreTokens() && !done && !error)
                 {
                    String varName = tokens.nextToken().trim();

                    while(varName.length() == 0)
                    {
                          varName = tokens.nextToken().trim();
                    }

                    if(varName.compareTo(";") == 0)
                    {
                       errcode = 5;
                       error = true;
                       System.out.println("\nNo identifier specified");
                    }

                    else
                    {
                       if(varName.compareTo(",") == 0)
                       {
                          varName = tokens.nextToken().trim();

                          while(varName.length() == 0)
                          {
                                varName = tokens.nextToken().trim();
                          }
                       }

                       if(varName.compareTo(";") == 0)
                       {
                          errcode = 5;
                          error = true;
                          System.out.println("\nNo identifier specified");
                       }
                    }

                    if(validateNameResult(varName).length() != 0)
                    {
                       errcode = 5;
                       error = true;
                       System.out.println("\n" + validateNameResult(varName));
                    }

                    if(varName.compareTo("=") == 0)
                    {
                       errcode = 5;
                       error = true;
                       System.out.println("\nIdentifier missing");
                    }
                    
                    else
                    {
                       currentToken = tokens.nextToken().trim();

                       while(currentToken.length() == 0)
                       {
                          currentToken = tokens.nextToken().trim();
                       }

                       if(currentToken.compareTo(";") == 0)
                       {
                          addVariable(varName, varType, null);
                          done = true;
                       }

                       else
                       {
                          if(currentToken.compareTo(",") == 0)
                          {
                             addVariable(varName, varType, null); 
                          }

                          else
                          {
                             if(currentToken.compareTo("=") != 0)
                             {
                                errcode = 5;
                                error = true;
                                System.out.println("\nAssignment symbol \'=\' missing");
                             }

                             else
                             {
                                if(currentToken.compareTo(";") == 0)
                                {
                                   errcode = 5;
                                   error = true;
                                   System.out.println("\nRvalue required");
                                }

                                else
                                {
                                   Expression = tokens.nextToken().trim();

                                   if(Expression.compareTo(";") == 0)
                                   {
                                      errcode = 5;
                                      error = true;
                                      System.out.println("\nRValue required");
                                   }

                                   else
                                   {
                                      while(Expression.length() == 0)
                                      {
                                         Expression = tokens.nextToken().trim();
                                      }

                                      if(Expression.compareTo("(") == 0)
                                      {
                                         castType = tokens.nextToken().trim();

                                         while(castType.length() == 0)
                                         {
                                            castType = tokens.nextToken().trim();
                                         }

                                         Expression =  tokens.nextToken().trim();

                                         while(Expression.length() == 0)
                                         {
                                            Expression = tokens.nextToken().trim();
                                         }

                                         if(Expression.compareTo(")") != 0)
                                         {
                                            errcode = 5;
                                            error = true;
                                            System.out.println("\n) missing");
                                         }

                                         else
                                         {
                                            Expression = tokens.nextToken().trim();

                                            while(Expression.length() == 0)
                                            {
                                               Expression = tokens.nextToken().trim();
                                            }

                                            expressionType = typeOfArgument(Expression);

                                            if(expressionType.compareTo("Identifier") == 0)
                                            {
                                               if(Expression.compareTo(varName) == 0)
                                               {
                                                  errcode = 5;
                                                  error = true;
                                                  System.out.println("\nForward reference");
                                               }
                                               
                                               else
                                               {
                                                  if(doesVariableExist(Expression))
                                                  {
                                                     expressionType = getTypeOf(Expression);
                                                     Expression = getStringValueOf(Expression);
                                                  }

                                                  else
                                                  {
                                                     errcode = 5;
                                                     error = true;
                                                     System.out.println("\nAttempt to reference " + Expression + ", an undefined symbol");
                                                  }
                                               }
                                           }

                                           if(!error)
                                           {
                                               if(expressionType.compareTo("invalid") == 0)
                                               {
                                                  errcode = 5;
                                                  error = true;
                                                  System.out.println("\nInvalid RValue expression");
                                               }

                                               else
                                               {
                                                  errcode = explicitCastResult(varType, castType, expressionType, varName, Expression);
                                                  error = (errcode != 0);
                                               }
                                            }
                                         }                                         
                                      }
                                      
                                      else
                                      {
                                         expressionType = typeOfArgument(Expression);

                                         if(expressionType.compareTo("Identifier") != 0)
                                         {
                                            if(expressionType.compareTo("invalid") == 0)
                                            {
                                               errcode = 5;
                                               error = true;
                                               System.out.println("\nInvalid RValue expression");
                                            }

                                            else
                                            {
                                               errcode = directAssignmentResult(varType, castType, expressionType, varName, Expression);
                                               error = (errcode != 0);
                                            }
                                         }

                                         else
                                         {
                                            if(doesVariableExist(Expression))
                                            {
                                               expressionType = getTypeOf(Expression);

                                               errcode = directAssignmentFromVarResult(varType, castType, expressionType, varName, Expression);
                                               error = (errcode != 0);
                                            }

                                            else
                                            {
                                               errcode = 5;
                                               error = true;
                                               System.out.println("\nAttempt to reference " + Expression + ", an undefined symbol");
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

                 if(!error && tokens.countTokens() <= 1)
                 {
                    done = true;
                 }
             }

             return errcode;
      }

      public String[] parseList(String RValue)
      {
             String[] x = {"a", "b"};

             return x;
      }

      public int validateValueList(String RValue, String ArrayType, String ArraySize)
      {
             StringTokenizer tokens = new StringTokenizer(RValue, ",()<>", true);
	     String token = "";
	     String Value = "";
	     String ValueType = "";
	     int errcode = 0;
             boolean error = false;
	     boolean done = false;
	     
             token = tokens.nextToken(); //get rid of (

             while(!error && !done && tokens.hasMoreTokens())
	     {
	           if(token.compareTo(")") == 0)
		   {
		      done = true;
		   }

		   else
		   {
		      if(token.compareTo("<") == 0)
		      {
		         token = tokens.nextToken();

			 if(token.compareTo(">") == 0)
			 {
			    errcode = 5;
			    error = true;
			    System.out.println("\nCannot parse empty list");
			 }

			 else
			 {
			    if(token.compareTo(")") == 0)
			    {
			       errcode = 5;
			       error = true;
			       System.out.println("\nIncorrectly formed list: > expected");
			    }

			    else
			    {
			       Value = token.toString();

			       token = tokens.nextToken();

			       if(token.compareTo(")") == 0)
			       {
			         errcode = 5;
				 error = true;
				 System.out.println("\nIncorrectly formed list: > expected");
			       }

			       else
			       {
                                  ValueType = typeOfArgument(Value);

				  if(ValueType.compareTo("invalid") == 0)
				  {
				     errcode = 5;
				     error = true;
				     System.out.println("\nInvalid list argument");
				  }

				  else
				  {
		                     if(ValueType.compareTo("expression") == 0)
				     {
				        ExpressionEvaluator.makePostFix();
					Value = ExpressionEvaluator.calculate();

					ValueType = typeOfArgument(Value);
			             }
                                     
				     if(ValueType.compareTo("Identifier") == 0)
				     {
				        ValueType = getTypeOf(Value);
				        Value = getVariable(Value);
				     }
				  }
			       }
			    }   
			 }
		      }
		   }
             }

	     return errcode;
	           
      }

      public String validateNameResult(String varName)
      {
             String result = "";
             int asciival = 0;

             asciival = (int) varName.charAt(0);

             if((asciival >= 48 && asciival <= 57) ||
                 varName.indexOf("~") >= 0 || 
                 varName.indexOf("`") >= 0 || 
                 varName.indexOf("!") >= 0 ||
                 varName.indexOf("@") >= 0 ||
                 varName.indexOf("#") >= 0 ||
                 varName.indexOf("%") >= 0 || 
                 varName.indexOf("^") >= 0 || 
                 varName.indexOf("&") >= 0 || 
                 varName.indexOf("*") >= 0 || 
                 varName.indexOf("(") >= 0 || 
                 varName.indexOf(")") >= 0 || 
                 varName.indexOf("|") >= 0 || 
                 varName.indexOf("\\") >= 0 || 
                 varName.indexOf("/") >= 0 || 
                 varName.indexOf(".") >= 0 || 
                 varName.indexOf("?") >= 0 || 
                 varName.indexOf("-") >= 0 ||
                 varName.indexOf(";") >= 0 || 
                 varName.indexOf(":") >= 0 || 
                 varName.indexOf("\"") >= 0 || 
                 varName.indexOf("{") >= 0 ||
                 varName.indexOf("}") >= 0 ||
                 varName.indexOf("<") >= 0 || 
                 varName.indexOf(">") >= 0 ||
                 varName.indexOf("[") >= 0 || 
                 varName.indexOf("]") >= 0)
             {
                 result = "Invalid identifier name";
             }

             else
             {
                if(varName.compareTo("char") == 0 ||
                   varName.compareTo("int") == 0 || 
                   varName.compareTo("float") == 0 ||
                   varName.compareTo("double") == 0 ||
                   varName.compareTo("boolean") == 0)
                {

                   result = "Invalid identifier name. " + varName + " is a reserved word";
                }

                else
                {
                   if(doesVariableExist(varName))
                   {
                      result = "Variable " + varName + "  has already been defined";
                   }
                }
            }

            return result;
      }

      public String typeOfArgument(String varValue) throws Exception
      {
             String varType = "invalid";
             int varIntValue = 0;
             double varFloatingPointValue = 0;
             boolean isIdentifier = false;
             boolean done = false;
             int indexOfDecimal = 0;

             if(varValue.indexOf("~") >= 0 || 
                varValue.indexOf("`") >= 0 || 
                varValue.indexOf("!") >= 0 ||
                varValue.indexOf("@") >= 0 ||
                varValue.indexOf("#") >= 0 ||
                varValue.indexOf("%") >= 0 || 
                varValue.indexOf("^") >= 0 || 
                varValue.indexOf("&") >= 0 || 
                varValue.indexOf("*") >= 0 || 
                varValue.indexOf("|") >= 0 || 
                varValue.indexOf("\\") >= 0 || 
                varValue.indexOf("/") >= 0 || 
                varValue.indexOf("?") >= 0 || 
                (varValue.indexOf("-") >= 0 && varValue.length() == 1) ||
                (varValue.indexOf(".") >= 0 && varValue.length() == 1) ||
                (varValue.indexOf("+") >= 0 && varValue.length() == 1) ||
                varValue.indexOf(";") >= 0 || 
                varValue.indexOf(":") >= 0 || 
                varValue.indexOf("\"") >= 0 || 
                varValue.indexOf("[") >= 0 || 
                varValue.indexOf("]") >= 0)
             {
                done = true; //warning: a legitimate - appears as invalid

             }
             if(!done && varValue.compareTo("true") == 0 || varValue.compareTo("false") == 0)
             {
                varType = "boolean";
             }

             else
             {
                //This ugly if statment is used to check if it is a normal identifier or an array reference
                if(!done &&
                   (((int) varValue.charAt(0) != 39 && ((int) varValue.charAt(0) < 48  || (int) varValue.charAt(0) > 57)) &&
                   !((int) varValue.charAt(0) == 45 && (int) varValue.charAt(1) >= 48 && (int) varValue.charAt(1) <= 57)) ||
                   (((int) varValue.charAt(0) != 39 && ((int) varValue.charAt(0) < 48  || (int) varValue.charAt(0) > 57)) &&
                   !((int) varValue.charAt(0) == 45 && (int) varValue.charAt(1) >= 48 && (int) varValue.charAt(1) <= 57) &&
                   varValue.indexOf("{") >= 0 && varValue.indexOf("}") >= 0 && (varValue.indexOf("{") < varValue.indexOf("}"))))
                {
                   varType = "Identifier";                
                   isIdentifier = true;
                }

                else
                {
                   if(!done && (int) varValue.charAt(0) == 39 && varValue.charAt(2) == 39 && varValue.length() == 3)
                   {
                      varType = "char";
                   }

                   else
                   {
                      if(!done)
                      {
                         try
                         {
                           varIntValue = Integer.parseInt(varValue);
                           varType = "int";
                         }

                         catch(Exception Fatal)
                         {
                               try
                               {
                                 varFloatingPointValue = new Double(varValue).doubleValue();
                
                                 indexOfDecimal = varValue.indexOf(".");

                                 if(varValue.substring(indexOfDecimal + 1, varValue.length()).length() > 4)
                                 {
                                    varType = "double";
                                 }

                                 else
                                 {
                                    varType = "float";
                                 }
                               }

                               catch(Exception MoreFatal)
                               {
                                     int err_result = 0;

                                     err_result = ExpressionEvaluator.validateExpression(new StringTokenizer(varValue), "all");
                                     if(err_result == 0)
				     {
				        varType = "expression";
			             }

                                     else
                                     {
				        if(varValue.charAt(0) == '(' && varValue.charAt(varValue.length() - 1) == ')')
					{
					   varValue = "valuelist";
					}
				     }
                               }
                         }
                     }
                  }
               }
            }

            return varType;
      }

      public int getIntValueOf(String varName) throws Exception
      {
             int intValue = 0;

             intValue = Integer.parseInt(getVariable(varName));

             return intValue;
      }

      public double getDoubleValueOf(String varName) throws Exception
      {
             double doubleValue = 0;

             doubleValue = new Double(getVariable(varName)).doubleValue();

             return doubleValue;
      }
             
      public float getFloatValueOf(String varName) throws Exception
      {
             float floatValue = 0;

             floatValue = new Float(getVariable(varName)).floatValue();

             return floatValue;
      }

      public String getStringValueOf(String varName) throws Exception
      {
             String stringValue = "";

             stringValue = getVariable(varName);

             return stringValue;
      }

      public char getCharValue(String varName) throws Exception
      {
             char charValue = getVariable(varName).charAt(0);

             return charValue;
      }

      public void display()
      {
             System.out.println("These are the variables currently in the symbol table:");
             System.out.println("Type\tName\tValue");
             Variable thisVariable = new Variable();
	     Array thisArray = new Array();

             int i = 0;

             for(i = 0; i < variableCount; i++)
             {
	         if(variableList.elementAt(i) instanceof Variable)
		 {
                    thisVariable = (Variable) variableList.elementAt(i);
                    thisVariable.display();
		 }

		 else
		 {
		    if(variableList.elementAt(i) instanceof Array)
		    {
		       thisArray = (Array) variableList.elementAt(i);
		       thisArray.display();
		    }
		 }
             }
      }             

      public String getTypeOf(String varName) throws MyException
      {
             String varType = "";
             int i = 0;
             boolean found = false;
             Variable thisVariable = new Variable();
	     Array thisArray = new Array();

             while(i < variableCount && !found)
             {
	           if(variableList.elementAt(i) instanceof Variable)
		   {
                     thisVariable = (Variable) variableList.elementAt(i);

                     if(thisVariable.returnName().compareTo(varName) == 0)
                     {
                        varType = thisVariable.returnType();
                        found = true;
                     }
		   }

		   else
		   {
                      if(variableList.elementAt(i) instanceof Array)
		      {
                         thisArray = (Array) variableList.elementAt(i);

			 if(thisArray.returnName().compareTo(varName) == 0)
			 {
			    varType = thisArray.returnType();
			    found = true;
			 }
		      }
		   }
 
                   i++;
             }

             if(found)
             {
                return varType;
             }

             else
             {
                 throw UndefinedVariableException;
             }
      }

      public String getVariable(String varName) throws Exception
      {
             String varValue = "";
             String Index = "";
             String type = "";
             int i = 0;
             boolean found = false;
             Variable thisVariable = new Variable();
             Array thisArray = new Array();

             if(varName.indexOf("{") < 0)
             {
                while(i < variableCount && !found)
                {
		      if(variableList.elementAt(i) instanceof Array && ((Array) variableList.elementAt(i)).returnName().compareTo("varName") == 0)
		      {
		         throw new IllegalArgumentException("Cannot access value of an Array reference: " + varName);
		      }

                      thisVariable = (Variable) variableList.elementAt(i);

                      if(thisVariable.returnName().compareTo(varName) == 0)
                      {
                         varValue = thisVariable.returnValue();
                         found = true;
                      }
 
                      i++;
                }

                if(found)
                {
                   return varValue;
                }

                else
                {
                   throw UndefinedVariableException;
                }
             }

             else
             {
                varName = varName.substring(0, varName.indexOf("{"));

                while(i < variableCount && !found)
                {
                      thisArray = (Array) variableList.elementAt(i);

                      if(thisArray.returnName().compareTo(varName) == 0)
                      {
                         varValue = thisVariable.returnValue();
                         found = true;
                      }

                      i++;
                }

                if(found)
                {
                   Index = varName.substring(varName.indexOf("{") + 1, varName.lastIndexOf("}"));

                   if(Index.trim().length() == 0)
                   {
		      throw new IllegalArgumentException("Array subscript required");
                   }

                   else
                   {
                      type = typeOfArgument(Index);

                      if(type.compareTo("double") == 0 ||
                         type.compareTo("float") == 0 ||
                         type.compareTo("char") == 0 ||
                         type.compareTo("char") == 0)
                      {
                         throw new IllegalArgumentException("Array subscript cannot be of type " + type);
                      }

                      else
                      {
                         if(type.compareTo("invalid") == 0)
                         {
                            throw new IllegalArgumentException("Invalid array subscript");
                         }
                         
                         else
                         {
                            if(type.compareTo("expression") == 0)
                            {
                               ExpressionEvaluator.makePostFix();
                               varValue = ExpressionEvaluator.calculate();
                            }

                            else
                            {
                               if(type.compareTo("Identifier") == 0)
                               {
                                  varValue = getVariable(Index);
                               }

                               else
                               {
                                  if(type.compareTo("function") == 0)
                                  {
                                     //run function
                                  }

                                  else
                                  {
                                     if((new Integer(Index).intValue() < 0) || new Integer(Index).intValue() >= (thisArray.returnSize()))
                                     {
                                        throw new IllegalArgumentException("Array index out of bounds: " + Index);
                                     }

				     else
				     {
				        varValue = thisArray.returnValueAt(new Integer(Index).intValue());
				     }
                                  }
                               }
                            }
                         }
                      }

                      return varValue;
                   }
                }

		else
		{
		   throw UndefinedVariableException;
		}
             }
     }

     public boolean doesVariableExist(String varName)
     {
            int i = 0;
            boolean found = false;
            String ObjectType = "";

            Variable thisVariable = new Variable();
            Array thisArray = new Array();

	    if(varName.indexOf("{") >= 0)
	    {
	       varName = varName.substring(0, varName.indexOf("{"));
	    }

            while(i < variableCount && !found)
            {
                  if(variableList.elementAt(i) instanceof Variable)
                  {
                     thisVariable = (Variable) variableList.elementAt(i);

                     if(thisVariable.returnName().compareTo(varName) == 0)
                     {
                        found = true;
                     }
                  }

                  else
                  {
                     if(variableList.elementAt(i) instanceof Array)
                     {
                        thisArray = (Array) variableList.elementAt(i);

                        if(thisArray.returnName().compareTo(varName) == 0)
                        {
                           found = true;
                        }
                     }
                  }
 
                  i++;
            }

            return found;            
    }

    public void setType(String varName, String varType) throws MyException
    {
           int i = 0;
           boolean found = false;
           Variable thisVariable = new Variable();
     
           while(i < variableCount && !found)
           {
                 thisVariable = (Variable) variableList.elementAt(i);

                 if(thisVariable.returnName().compareTo(varName) == 0)
                 {
                    found = true;
                 }
 
                 i++;
           }

           if(found)
           {
              thisVariable.setType(varType);
           }

           else
           {
              throw UndefinedVariableException;
           }
    }

    public int setNewValue(String varName, String varType, String varValue) throws MyException
    {
           int i = 0;
           boolean found = false;
           boolean varIsNull = false;
           Variable thisVariable = new Variable();
           int storeResult = 0;

           while(i < variableCount && !found)
           {
                 thisVariable = (Variable) variableList.elementAt(i);

                 if(thisVariable.returnName().compareTo(varName) == 0)
                 {
                    found = true;
                 }
 
                 i++;
           }

           if(found)
           {
              if(varValue.compareTo("null") == 0)
              {
                 storeResult = thisVariable.setValueAsString(varValue);
                 varIsNull = true;
              }

              if(varType.compareTo("int") == 0 && !varIsNull)
              {
                 storeResult = thisVariable.setValueAsInt(new Integer(varValue).intValue());
              }

              else
              {
                 if(varType.compareTo("double") == 0 && !varIsNull)
                 {
                    storeResult = thisVariable.setValueAsDouble(new Double(varValue).doubleValue());
                 }

                 else
                 {
                    if(varType.compareTo("float") == 0 && !varIsNull)
                    {
                       storeResult = thisVariable.setValueAsFloat(new Float(varValue).floatValue());
                    }

                    else
                    {
                       if(varType.compareTo("String") == 0 && !varIsNull)
                       {
                          storeResult = thisVariable.setValueAsString(varValue);
                       }

                       else
                       {
                          if(varType.compareTo("char") == 0 && !varIsNull)
                          {
                             storeResult = thisVariable.setValueAsChar(varValue.charAt(0));
                          }                          
                       }
                    }
                 }
              }
           }

           else
           {
              throw UndefinedVariableException;
           }

           return storeResult;
    }
}
