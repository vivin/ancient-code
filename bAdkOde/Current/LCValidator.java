/*

#
# Vivin Suresh Paliath
# 993-26-8942
# CSE 340
# 1240pm Section
# Fall 2001
# Project 1: LCValidator.java
# Due September 18th, 2001
# Language: Java
#
# EBNF
#
# <exp>    ::= '(' <factor> ')' | CONST | VAR
# <factor> ::= <appl> | <abstr>
# <appl>   ::= <exp> <exp>
# <abstr>  ::= l VAR '.' <exp>
#

*/

import java.io.*;

/*

#
# This is the declaration of the main class
#

*/

public class LCValidator
{
       public static void main(String[] Args) throws Exception
       {
              Validator ValidatorObj = new Validator("input1");
              ValidatorObj.validateInputFile();
       }
}


/*

#
# This is the declaration of the Validator class.
# 

*/

class Validator
{
      /*

      #
      # Declaration of Class Attributes
      #
      # TokenizerObj is the Tokenizer Object that handles the tokens from the input file
      # ParserObj is the Parser Object that handles the parsing of expressions
      # InputFileName is the name of the input file that contains the expressions
      #

      */

      Tokenizer TokenizerObj;
      Parser    ParserObj;
      String    InputFileName;

      /*

      #
      # Parameterized Constructor
      #
      # Precondition: none
      # 
      # Postcondition: Returns a Validator Object associated with the file InputFile
      #

      */

      public Validator(String InputFile)
      {
             InputFileName = InputFile;
             TokenizerObj = new Tokenizer(InputFileName, "().labcdefuvwxyz");
             ParserObj = new Parser(TokenizerObj);
      }

      /*

      #
      # public void validateInputFile(void)
      #
      # Precondition: none
      #
      # Postcondition: Parses InputFileName
      #

      */

      public void validateInputFile()
      {
             ParserObj.parse();
      }
}


/*

#
# This is the declaration of the Tokenizer class
#

*/

class Tokenizer
{
      /*

      #
      # Declaration of Class Attributes
      #
      # ReadFile is a FileInputStream object that is used to access data from the input file
      # CurrentToken is a String that holds the current token
      # CurrentExpression is a String that holds the current expression
      # InputFileName is a String that holds the name of the input file
      # ValidTokenList is a String that holds the list of valid tokens in the language
      # ExprLocation is an integer that holds the current index in ExpressionString
      # EOF is a boolean that is set to true when the file pointer goes past end of file
      #

      */

      private FileInputStream ReadFile;
      private String          CurrentToken;
      private String          CurrentExpression;
      private String          InputFileName;
      private String          ValidTokenList;
      private int             ExprLocation;
      private boolean         EOF;

      /*

      #
      # Parameterized Constructor
      #
      # Precondition: none
      #
      # Postcondition: Creates a Tokenizer object associated with InputFile and containing ValidTokens as list of valid tokens
      #                File InputFileName is opened
      #

      */

      public Tokenizer(String InputFile, String ValidTokens)
      {
             InputFileName = InputFile;
             ValidTokenList = ValidTokens;
             ExprLocation = 0;
             CurrentExpression = "";
             CurrentToken = "";
             EOF = false;

             try
             {
               ReadFile = new FileInputStream(InputFileName);
             }

             catch(Exception e)
             {
                   System.out.println("Could not open file");
             }
      }

      /*

      #
      # private void getExpression(void)
      #
      # Precondition: File InputFileName is opened
      #
      # Postcondition: CurrentExpression contains the current expression read in
      #                EOF set to true if input is past end of file
      #

      */

      private void getExpression()
      {
              char    InputCharacter;
              int     EOFFlag = 0;
              boolean done = false;
              CurrentExpression = "";

              try
              {
                EOFFlag = ReadFile.read();
              }

              catch(Exception e)
              {  
                    System.out.println("Error reading from file");
              }

              done = (EOFFlag == -1);
              EOF = done;
              InputCharacter = (char) EOFFlag;
              
              while(!done && InputCharacter != '$')
              {
                    if(InputCharacter != ' ' &&
                       InputCharacter != '\n' &&
                       InputCharacter != '\t' &&
                       InputCharacter != '\r')
                    {
                       CurrentExpression += new Character(InputCharacter).toString();
                    }
                          
                    try
                    {
                      EOFFlag = ReadFile.read();
                    }
                    
                    catch(Exception e)
                    {
                          System.out.println("Error reading from file");
                    }

                    done = (EOFFlag == -1);
                    EOF = done;
                    InputCharacter = (char) EOFFlag;
              }

              if(CurrentExpression.trim().length() != 0)
              {
                 System.out.println("Expression: " + CurrentExpression);
              }
      }

      /*

      #
      # public String getToken(void)
      #
      # Precondition: CurrentExpression is not null 
      #
      # Postcondition: Returns the next token
      #

      */


      public String getToken()
      {
             CurrentToken = new Character(CurrentExpression.charAt(ExprLocation)).toString();
             ExprLocation++;
             return CurrentToken;
      }

      /*

      #
      # private boolean isValidExpression(String)
      #
      # Precondition: CurrentExpression is not null
      #
      # Postcondition: Returns false if the Expression contains any invalid tokens
      #

      */

      private boolean isValidExpression(String Expression)
      {
              int i = 0;
              int sum = 0;

              while(i < CurrentExpression.length())
              {
                    if(!isValidToken(CurrentExpression.charAt(i)))
                    {
                       System.out.println("Illegal Token: " + CurrentExpression.charAt(i) + "\n");
                    }

                    else
                    {
                       sum++;
                    }

                    i++;
              }

              return (sum == CurrentExpression.length());
      }

      /*

      #
      # public boolean isValidToken(char)
      #
      # Precondition: ValidTokenList is not null
      #
      # Postcondition: Returns true if the character is valid token
      #

      */

      public boolean isValidToken(char character)
      {
             int i = 0;
             int sum = 0;

             while(i < ValidTokenList.length())
             {
                   if(character == ValidTokenList.charAt(i))
                   {
                      sum++;
                   }

                   i++;
             }

             return (sum > 0);
      }

      /*

      #
      # public void getNextExpression(void)
      #
      # Precondition: CurrentExpression is not null
      #
      # Postcondition: Sets CurrentExpression to the next expression in the input file
      #

      */

      public void getNextExpression()
      {
             if(!EOF)
             {
                CurrentToken = "";
                ExprLocation = 0;

                getExpression();

                if(!isValidExpression(CurrentExpression))
                {
                   getExpression();
                }
             }

             else
             {
                CurrentExpression = null;
             }
      }

      /*

      #
      # public boolean empty(void)
      #
      # Precondition: CurrentExpression is not null
      #
      # Postcondition: Returns true if ExprLocation is past the end of CurrentExpression, meaning no tokens are left
      #

      */

      public boolean empty()
      {
             return (ExprLocation == CurrentExpression.length());
      }

      /*

      #
      # public boolean eof(void)
      #
      # Precondition: none
      #
      # Postcondition: Returns true if EOF is true and CurrentExpression is null
      #

      */

      public boolean eof()
      {
             return (EOF && (CurrentExpression == null));
      }
}


/*

#
# This is the declaration for the Parser class
#

*/

class Parser
{
      /*

      #
      # Declaration of class attributes
      #
      # TokenizerObj is a Tokenizer Object that handles the tokens
      # CurrentToken is a String that holds the current token
      # ParseStreeString is a String representation of the parse tree
      # fatal is a boolean that is set to true if an Illegal Syntax Error is encountered
      #

      */

      Tokenizer TokenizerObj;
      String    CurrentToken;
      String    ParseTreeString;
      boolean   fatal;

      /*

      #
      # Parameterized Constructor
      #
      # Precondition: none
      #
      # Postcondition: Creates a Parser object associated with Tokenizer Object TokObject
      #

      */

      public Parser(Tokenizer TokObject)
      {
             TokenizerObj = TokObject;
             ParseTreeString = new String();
             fatal = false;
      }

      /*

      #
      # public void parse(void)
      #
      # Precondition: TokenizerObj is not null
      #
      # Postcondition: Expression is parsed and validated
      #

      */

      public void parse()
      {
             TokenizerObj.getNextExpression();

             while(!TokenizerObj.eof())
             {
                if(!TokenizerObj.empty())
                {
                   CurrentToken = TokenizerObj.getToken();
                   exp("");
                }

                if(!TokenizerObj.empty())
                {
                   error();
                }

                System.out.println(ParseTreeString + "\n----------------------------------------------------------------------");
                ParseTreeString = "";
                TokenizerObj.getNextExpression();
                fatal = false;
             }
      }

      /*

      #
      # private void exp(String)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: Validates CurrentToken for exp
      #

      */

      private void exp(String Indent)
      {
              if(CurrentToken.compareTo("(") == 0)
              {
                 CurrentToken = TokenizerObj.getToken();
                 factor(Indent);
              }

              else
              {
                 if((isCONST() || isVAR()))
                 {
                    ParseTreeString = ParseTreeString + Indent + CurrentToken + "\n";
                 }

                 else
                 {
                    error();
                 }
              }
      }

      /*

      #
      # private void factor(String)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: Validates CurrentToken for factor
      #

      */

      private void factor(String Indent)
      {
              if(CurrentToken.compareTo("l") == 0)
              {
                 ParseTreeString  = ParseTreeString + Indent + "abstr" + "\n";
                 CurrentToken = TokenizerObj.getToken();
                 abstr(Indent + " ");
              }

              else
              {
                 ParseTreeString  = ParseTreeString + Indent + "appl" + "\n";
                 appl(Indent);
              }

              if(!fatal)
              {
                 try
                 {
                   CurrentToken = TokenizerObj.getToken();
                 }

                 catch(Exception e)
                 {
                       error();
                 }

                 if(!fatal)
                 {
                    if(CurrentToken.compareTo(")") != 0)
                    {
                       error();
                    }
                 }
              }
      }

      /*

      #
      # private void abstr(String)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: Validates CurrentToken for abstr
      #

      */

      private void abstr(String Indent)
      {
              if(isVAR())
              {
                 ParseTreeString = ParseTreeString + Indent + CurrentToken + "\n";
                 CurrentToken = TokenizerObj.getToken();

                 if(CurrentToken.compareTo(".") == 0)
                 {
                    CurrentToken = TokenizerObj.getToken();
                    exp(Indent);
                 }

                 else
                 {
                    error();
                 }
              }

              else
              {
                 error();
              }
      }

      /*

      #
      # private void appl(String)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: Validates CurrentToken for appl
      #

      */

      private void appl(String Indent)
      {
              exp(Indent + " ");
              CurrentToken = TokenizerObj.getToken();
              exp(Indent + " ");
      }

      /*

      #
      # private void error(void)
      #
      # Precondition: none
      #
      # Postcondition: fatal is set to true
      #                CurrentToken is empty
      #                ParseTreeString is empty
      #

      */

      private void error()
      {
              if(CurrentToken.trim().length() != 0)
              {
                 System.out.println("Illegal Syntax");
              }

              CurrentToken = "";
              ParseTreeString = "";
              fatal = true;
      }

      /*

      #
      # public boolean isCONST(void)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: returns true is CurrentToken is a valid CONST
      #

      */

      public boolean isCONST()
      {
             return (CurrentToken.compareTo("a") == 0 ||
                     CurrentToken.compareTo("b") == 0 ||
                     CurrentToken.compareTo("c") == 0 ||
                     CurrentToken.compareTo("d") == 0 ||
                     CurrentToken.compareTo("e") == 0 ||
                     CurrentToken.compareTo("f") == 0);

      }

      /*

      #
      # public boolean isVAR(void)
      #
      # Precondition: CurrentToken is not null
      #
      # Postcondition: returns true if CurrentToken is a valid VAR
      #

      */

      public boolean isVAR()
      {
             return (CurrentToken.compareTo("u") == 0 ||
                     CurrentToken.compareTo("v") == 0 ||
                     CurrentToken.compareTo("w") == 0 ||
                     CurrentToken.compareTo("x") == 0 ||
                     CurrentToken.compareTo("y") == 0 ||
                     CurrentToken.compareTo("z") == 0);
      }
}
