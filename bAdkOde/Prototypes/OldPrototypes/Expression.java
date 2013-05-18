import java.util.*;
import java.io.*;

public class Expression implements Cloneable
{
    ObjectStack ExprStack;
    symbolTable currentSymbolTable;

    public Expression()
    {
           currentSymbolTable = new symbolTable();
    }

    public Expression(symbolTable thisSymbolTable)
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

    public int Evaluate(StringTokenizer tokens)
    {
           int errcode = 0;
           boolean error = false;
           String Expr = "";
           String VarName = "";
           String Token = "";

           while(tokens.hasMoreTokens())
           {
                 Expr += tokens.nextToken().trim();
           }

           if(!Expr.endsWith(";"))
           {
              error = true;
              errcode = 1;
           }

           else
           {
              if(!parensCheck(Expr))
              {
                 System.out.println("Unbalanced parenthesis");
                 error = true;
                 errcode = 11;
              }
           }

           if(!error)
           {
              tokens = new StringTokenizer(Expr, "=()+-/*%");
              
              Expr = "";

              while(tokens.hasMoreTokens())
              {
                    Expr += tokens.nextToken().trim();
              }

              tokens = new StringTokenizer(Expr, "=()+-/*%");

              VarName = tokens.nextToken();

              if(!currentSymbolTable.doesVariableExist(VarName))
              {
                 error = true;
                 errcode = 9;
              }

              else
              {
                 Token = tokens.nextToken();

                 if(Token.compareTo("=") != 0)
                 {
                    

                 

               




