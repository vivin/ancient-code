import java.io.*;
import java.util.*;

public class pInsertNew
{
       static void main(String[] args) throws IOException
       {
              ObjectSeq Expr;

              StringTokenizer tokens;

              BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
              
              String input = "";

              int i = -1;
              int pos = 0;
              int index = 0;

              input = stdin.readLine();

              tokens = new StringTokenizer(input, "%/*+-()", true);

              Expr = new ObjectSeq(tokens.countTokens());

              while(tokens.hasMoreTokens())
              {
                    Expr.insert(Expr.returnCount(), tokens.nextToken());
              }

              for(i = 0; i < Expr.returnCount(); i++)
              {
                  System.out.print((String) Expr.elementAt(i));
              }

              System.out.println();

              if(((String) Expr.elementAt(0)).compareTo("+") == 0 || ((String) Expr.elementAt(0)).compareTo("-") == 0)
              {
                 Expr.insert(0, "(");
                 Expr.insert(3, ")");
              }

              while(index >= 0 && index < Expr.returnCount())
              {
                    try
                    {
                      if((((String) Expr.elementAt(pos - 1)).compareTo("%") == 0 ||
                          ((String) Expr.elementAt(pos - 1)).compareTo("/") == 0 ||
                          ((String) Expr.elementAt(pos - 1)).compareTo("*") == 0 ||
                          ((String) Expr.elementAt(pos - 1)).compareTo("+") == 0 ||
                          ((String) Expr.elementAt(pos - 1)).compareTo("-") == 0))
                      {
                         Expr.insert(pos, "(");
                         Expr.insert(pos + 3, ")");
                      }
                    }

                    catch(Exception e)
                    {
                    }

                    index = pos + 1;
             }

             for(i = 0; i < Expr.returnCount(); i++)
             {
                 System.out.print((String) Expr.elementAt(i));
             }

             System.out.println();
        }
}


