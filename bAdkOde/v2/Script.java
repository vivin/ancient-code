import java.io.*;
import java.util.*;

class Script
{
      private String Scope;
      private SymbolTable CurrentSymbolTable;
      private String LanguageTokens;
      private String ScriptFileName;
      private String Extension;
      
      public Script()
      {
	      Scope = "global";
	      CurrentSymbolTable = new SymbolTable();
              LanguageTokens = " \\<>\";#{}[],()+-/*^=%";
	      ScriptFileName = "unknown.bad";
	      Extension = "bad";
      }

      public Script(String ScriptScope, SymbolTable ThisSymbolTable, String LangTokens, String ScriptFN, String Ext)
      {
	     Scope = ScriptScope;
	     CurrentSymbolTable = ThisSymbolTable;
	     LanguageTokens = LangTokens;
	     ScriptFileName = ScriptFN;
	     Extension = Ext;
      }

      public Script(String ScriptFN, String Ext)
      {
	     Scope = "global";
	     ScriptFileName = ScriptFN;
	     CurrentSymbolTable = new SymbolTable();
             LanguageTokens = " \\<>\";#{}[],()+-/*^=%";
	     Extension = Ext;
      }
 
      public boolean open() throws IOException
      {
             StringTokenizer tokens = new StringTokenizer("", LanguageTokens, true);
             Vector BadScript = new Vector();

             Interpreter ScriptInterpreter = new Interpreter();

             BufferedReader ReadFile = null;
             String InputString = "";
             String KeyWord = "";
             String DoCommand = "";
             String sc = "";
             int error = 0;
             int i = 0;
             boolean fatal = false;
             boolean fatal_error = false;
              
             if(!ScriptFileName.endsWith(Extension))
             {
                try
                {
                  ReadFile = new BufferedReader(new FileReader(ScriptFileName + Extension));
                }

                catch(Exception e)
                {
                      System.out.println("Could not open " + ScriptFileName + Extension);
                      fatal_error = true;
                }
             }

             else
             {
                try
                {
                  ReadFile = new BufferedReader(new FileReader(ScriptFileName));
                }

                catch(Exception e)
                {
		      if(!ScriptFileName.endsWith(Extension))
		      {
                         System.out.println("Could not open " + ScriptFileName + Extension);
		      }

		      else
		      {
			 System.out.println("Could not open " + ScriptFileName);
		      }

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

             if(!fatal_error)
             {           
                BadScript.addElement(InputString);
             }

             while(InputString != null && !fatal_error)
             {
                   try
                   {
                     InputString = ReadFile.readLine().trim();
                     BadScript.addElement(InputString);
                   }
 
                   catch(NullPointerException NPR)
                   {
                         InputString = null;
                   }

                   catch(Exception Fatal)
                   {
                         System.out.println("A " + Fatal + " exception ocurred.\n");
                         fatal_error = true;
                   }
             }

             if(!fatal_error)
             {
		if(!ScriptFileName.endsWith(Extension))
		{
                   ScriptInterpreter = new Interpreter(tokens, 
				                       LanguageTokens, 
						       Scope, 
						       ScriptFileName + Extension,
						       BadScript, 
						       CurrentSymbolTable);
		}

		else
	        {
                   ScriptInterpreter = new Interpreter(tokens, 
				                       LanguageTokens, 
						       Scope, 
						       ScriptFileName,
						       BadScript, 
						       CurrentSymbolTable);
		}
	           
                fatal = ScriptInterpreter.parse();
             }

	     if(!(fatal || fatal_error))
	     {
		ScriptInterpreter.run();
	     }
      }
}
