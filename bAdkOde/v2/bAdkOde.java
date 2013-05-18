import java.io.*;
import java.util.StringTokenizer;

public class bAdkOde
{
       public static void main(String[] args) throws IOException
       {
              Script bAdkOdeScript = new Script();
	      boolean fatal_error = false;

              String[] CommandLineArgs = {""};
              
              CommandLineArgs = (String[]) args;

              if(CommandLineArgs.length == 0)
              {
                 System.out.println("No File specified.");
                 System.out.println("Syntax: java bAdkOde filename[.bad]");
                 fatal_error = true;
              }

	      if(!fatal_error)
	      {
	         bAdkOdeScript = new Script(CommandLineArgs[0], ".bad");
	         bAdkOdeScript.open();
	      }
       }
}
