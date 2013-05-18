import java.io.*;
import java.util.StringTokenizer;

public class bAdkOde
{
       static symbolTable currentSymbolTable = new symbolTable();
 
       public static void main(String[] args) throws IOException
       {
              String LanguageTokens = " \\<>\";#{}[],()+-/*^=%";
              StringTokenizer tokens = new StringTokenizer("", LanguageTokens, true);

              Interpreter ScriptInterpreter = new Interpreter();

              BufferedReader ReadFile = null;
              String[] commandLineArgs = {""};
              String InputString = "";
              String KeyWord = "";
              String DoCommand = "";
              String sc = "";
              int error = 0;
              int i = 0;
              boolean fatal = false;
	      boolean fatal_error = false;
              
              commandLineArgs = (String[]) args;

              if(commandLineArgs.length == 0)
              {
                 System.out.println("No File specified.");
                 System.out.println("Syntax: java bAdkOde filename[.bad]");
                 fatal_error = true;
              }

              else
              {
                 sc = commandLineArgs[0];
              }

              if(!fatal_error)
              {
                 if(!commandLineArgs[0].endsWith(".bad"))
                 {
		    try
		    {
                      ReadFile = new BufferedReader(new FileReader(commandLineArgs[0] + ".bad"));
                    }

		    catch(Exception e)
		    {
			  System.out.println("Could not open " + commandLineArgs[0] + ".bad");
			  fatal_error = true;
                    }
                 }

                 else
                 {
		    try
		    {
                      ReadFile = new BufferedReader(new FileReader(commandLineArgs[0]));
                    }

		    catch(Exception e)
		    {
			  System.out.println("Could not open " + commandLineArgs[0]);
			  fatal_error = true;
                    }
                 }
             
		 if(!fatal_error)
		 {
                    try
                    {
                      InputString = ReadFile.readLine().trim();

                      if(InputString == null)
                      {
                         System.out.println("File is empty. Cannot interpret.\n");
                         fatal_error = true;
                      }
                    }

                    catch(Exception Ex)
                    {
		          System.out.println("Error reading from file");
                          System.out.println("[ " + Ex + "]\n");
                          fatal_error = true;
                    }
		 }
              }

              if(!fatal || !fatal_error)
              {           
                 tokens = new StringTokenizer(InputString, " \r><;\"+#", true);
              }

              while(InputString != null && !fatal && !fatal_error)
              {
                    fatal = ScriptInterpreter.Interpret(tokens);

                    if(!fatal)
                    {
                       try
                       {
                         InputString = ReadFile.readLine().trim();
                       }
  
                       catch(NullPointerException NPR)
                       {
                             InputString = null;
                       }

                       catch(Exception Fatal)
                       {
                             System.out.println("A " + Fatal + " exception ocurred.\n");
                       }

                       if(InputString != null && !fatal)
                       {
                          tokens = new StringTokenizer(InputString, LanguageTokens, true);
                       }
                    }                    
              }

              if(fatal && !fatal_error)
              {
                 System.out.println("\nThe statement in question: ");
                 System.out.println(InputString);
                 System.out.println("\n<Script terminated with an error>\n");
              }
       }
}
