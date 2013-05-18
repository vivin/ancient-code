import java.io.*;
import java.util.*;

class IO
{
      symbolTable currentSymbolTable;

      public IO()
      {
             symbolTable currentSymbolTable = new symbolTable();
      }

      public IO(symbolTable thisSymbolTable)
      {
             currentSymbolTable = thisSymbolTable;
      }

      public int PrintCommand(StringTokenizer tokens) throws Exception
      {
             boolean error = false;
             boolean endofstring = false;
             boolean endofcommand = false;
             boolean slashfound = false;
             boolean escWasSlash = false;
             char escapechar;
             int errcode = 0;
             int i = 0;
             int j = 0;
             int k = 0;
             int quotecount = 0;
             int initindex = 0;
             int plusesFound = 0;
             int quotesFound = 0;
             int tokensFound = 0;
             String DoCommand = "";
             String lastToken = "";
             String OriginalString = "";
             StringBuffer OutputString = new StringBuffer("");

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

             OriginalString = DoCommand;

             i = 0;

             for(k = 0; k < DoCommand.length(); k++)
             {
                 if(k < DoCommand.length() - 2 && DoCommand.charAt(k) == '\\' && DoCommand.charAt(k + 1) == '\\' && DoCommand.charAt(k + 2) == '\\')
                 {
                    k += 1;
                    slashfound = true;
                 }

                 else
                 {
                    if(k < DoCommand.length() - 2 && DoCommand.charAt(k) == '\\' && DoCommand.charAt(k + 1) == '\\' && DoCommand.charAt(k + 2) != '\\')
                    {
                       k += 2;
                       slashfound = true;
                    }
                 }

                 if(k > 0 && DoCommand.charAt(k) == '\"' && DoCommand.charAt(k - 1) == '\\' && slashfound)
                 {
                    quotecount++;
                 }

                 else
                 {
                    if(k > 0 && DoCommand.charAt(k) == '\"' && DoCommand.charAt(k - 1) != '\\')
                    {
                       quotecount++;
                    }

                    else
                    {
                       if(k == 0 && DoCommand.charAt(k) == '\"')
                       {
                          quotecount++;
                       }
                    }
                 }                 
            
                 slashfound = false;
             }

             if(quotecount % 2 != 0)
             {
                errcode = 3;
                error = true;
             }
             
             quotesFound = 0;

             tokens = new StringTokenizer(DoCommand, ">+\\;\"", true);

             lastToken = "";

             DoCommand = tokens.nextToken();

             if(DoCommand.compareTo("+") == 0)
             {
                errcode = 7;
                error = true;
             }

             while(tokens.hasMoreTokens() && !error && !endofcommand)
             {
                   endofstring = false;
                   escWasSlash = false;

                   if(DoCommand.trim().compareTo("\"") == 0 && lastToken.trim().compareTo("\\") != 0)
                   {
                      tokensFound++;
 
                      lastToken = DoCommand;
                      DoCommand = tokens.nextToken();

                      if(DoCommand.trim().compareTo("\"") == 0 && lastToken.trim().compareTo("\\") != 0)
                      {
                         endofstring = true;
                      }

                      while(!endofstring && !error)
                      {
                            if(DoCommand.compareTo("+") == 0)
                            {
                               OutputString.append('+');
                               lastToken = DoCommand;
                               DoCommand = tokens.nextToken();
                            }

                            else
                            {  
                               if(DoCommand.compareTo(";") == 0)
                               {
                                  OutputString.append(';');
                                  lastToken = DoCommand;
                                  DoCommand = tokens.nextToken();
                               }

                               else
                               {
                                  initindex = 0;

                                  if(DoCommand.compareTo("\\") == 0)
                                  {
                                     lastToken = DoCommand;
                                     DoCommand = tokens.nextToken();

                                     escapechar = DoCommand.charAt(0);

                                     initindex = 1;

                                     switch(escapechar)
                                     {
                                            case '\"' : OutputString.append("\"");
                                                        break;

                                            case '\\' : OutputString.append("\\");
                                                        escWasSlash = true;
                                                        break;

                                            case 'n'  : OutputString.append("\n");
                                                        break;

                                            case 'r'  : OutputString.append("\r");
                                                        break;

                                            case 't'  : OutputString.append("\t");
                                                        break;

                                            case 'b'  : OutputString.append("\b");
                                                        break;

                                            default   : errcode = 4;
                                                        error = true;
                                                        break;
                                     }
                                  }

                                  OutputString.append(DoCommand.substring(initindex));

                                  if(!escWasSlash)
                                  {
                                     lastToken = DoCommand;
                                  }

                                  else
                                  {
                                     lastToken = "";
                                  }

                                  DoCommand = tokens.nextToken();                                 

                                  escWasSlash = false;                                  
                               }
                            }

                            if(DoCommand.compareTo("\"") == 0 && lastToken.compareTo("\\") != 0)
                            {
                               endofstring = true;
                            }
                      }
                   }

                   else
                   {
                      if(DoCommand.compareTo(";") == 0)
                      {
                         endofcommand = true;
                      }

                      else
                      {
                         if(DoCommand.compareTo("\\") == 0)
                         {
                            error = true;
                            errcode = 2;
                         }

                         else
                         {
                            if(DoCommand.compareTo("+") == 0)
                            {
                               plusesFound++;
                            }

                            else
                            {
                               DoCommand = DoCommand.trim();

                               if(DoCommand.length() > 0 && DoCommand.compareTo("+") != 0)
                               {
                                  if(currentSymbolTable.doesVariableExist(DoCommand))
                                  {
                                     if(currentSymbolTable.getVariable(DoCommand) == null)
                                     {
                                        error = true;
                                        errcode = 8;
                                        System.out.print("\n" + DoCommand + " ");
                                     }

                                     else
                                     {
                                        OutputString.append(currentSymbolTable.getVariable(DoCommand));
                                        tokensFound++;
                                     }
                                  }
  
                                  else
                                  {
                                     if(currentSymbolTable.typeOfArgument(DoCommand).compareTo("int") == 0 ||
                                        currentSymbolTable.typeOfArgument(DoCommand).compareTo("float") == 0 || 
                                        currentSymbolTable.typeOfArgument(DoCommand).compareTo("double") == 0 || 
                                        currentSymbolTable.typeOfArgument(DoCommand).compareTo("boolean") == 0)
                                     {
                                        OutputString.append(DoCommand);
                                        tokensFound++;
                                     }

                                     else
                                     {
                                        if(currentSymbolTable.typeOfArgument(DoCommand).compareTo("char") == 0)
                                        {
                                           OutputString.append(DoCommand.charAt(1));
                                           tokensFound++;
                                        }

                                        else
                                        {
                                           if(currentSymbolTable.typeOfArgument(DoCommand).compareTo("invalid") == 0)
                                           {
                                              errcode = 12;
                                              error = true;
                                              System.out.print("\n" + DoCommand + " ");
                                           }

                                           else
                                           {
                                              errcode = 9;
                                              error = true;
                                              System.out.print("\n" + DoCommand + " ");
                                           }
                                        }
                                     }                          
                                  }
                               }
                            }
                         }
                      }                       
                   }

                   if(!error && !endofcommand)
                   {
                      lastToken = DoCommand;
                      DoCommand = tokens.nextToken();                    
                   }
             }

             if(!error)
             {
                if(plusesFound != tokensFound - 1)
                {
                   errcode = 6;
                   error = true;
                }
             }
             
             if(!error)
             {
                System.out.print(OutputString);                          
             }

             return errcode;
      }

      public int InputCommand(StringTokenizer tokens) throws Exception
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
               temp = currentSymbolTable.getTypeOf(varName);
             }

             catch(Exception e)
             {
                   temp = "doesnotexist";
             }

             if(!error && currentSymbolTable.doesVariableExist(varName) && temp.compareTo("undefined") != 0)
             {
                varType = currentSymbolTable.getTypeOf(varName);

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
                    inputValueType = currentSymbolTable.getTypeOf(varName);
                }

                if(!varIsNull)
                {
                   inputValueType = currentSymbolTable.typeOfArgument(inputValue);
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
                   //The typeOfArgument method defines 'c' as a character and c as an identifier
                   //since the input has been entered as c, it qualifies as an identifier according to the
                   //typeOfArgument method.
                } 


                if(varType.compareTo("double") == 0 && 
                  (inputValueType.compareTo("double") == 0 || 
                   inputValueType.compareTo("float") == 0 || 
                   inputValueType.compareTo("int") == 0))
                {
                   currentSymbolTable.setNewValue(varName, varType, inputValue);
                }

                else
                {
                   if(varType.compareTo("float") == 0 && (inputValueType.compareTo("float") == 0 && inputValueType.compareTo("int") == 0))
                   {
                      currentSymbolTable.setNewValue(varName, varType, inputValue);
                   }

                   else
                   {
                      if(varType.compareTo("int") == 0 && inputValueType.compareTo("int") == 0)
                      {
                         currentSymbolTable.setNewValue(varName, varType, inputValue);
                      }

                      else
                      {
                         if(varType.compareTo("char") == 0 && inputValueType.compareTo("char") == 0 || 
                           (varType.compareTo("char") == 0 && inputValueType.compareTo("int") == 0 && inputValue.length() == 1))
                         {
                            currentSymbolTable.setNewValue(varName, varType, inputValue);
                         }

                         else
                         {
                            if(varType.compareTo("boolean") == 0 && inputValueType.compareTo("boolean") == 0)
                            {
                               currentSymbolTable.setNewValue(varName, varType, inputValue);
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
                     oldType = currentSymbolTable.getTypeOf(varName);
                   }

                   catch(Exception e)
                   {
                   }
     
                   if(!varIsNull)
                   {
                      inputValueType = currentSymbolTable.typeOfArgument(inputValue);

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
                      currentSymbolTable.addVariable(varName, inputValueType, inputValue);
                   }

                   else
                   {
                      if(oldType.compareTo("undefined") == 0)
                      {
                         currentSymbolTable.setNewValue(varName, inputValueType, inputValue);
                         currentSymbolTable.setType(varName, inputValueType);
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
      }
}

