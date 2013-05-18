import java.io.*;

public class exptest
{
       public static void main(String[] args) throws IOException
       {
              int iv1 = 0;
              int iv2 = 0;
              float fv1 = 0;
              float fv2 = 0;
              double dv1 = 0;
              double dv2 = 0;

              BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

              System.out.println("Enter iv1:");
              iv1 = Integer.parseInt(stdin.readLine());

              System.out.println("Enter iv2:");
              iv2 = Integer.parseInt(stdin.readLine());

              System.out.println("Enter fv1:");
              fv1 = new Float(stdin.readLine()).floatValue();

              System.out.println("Enter fv2:");
              fv2 = new Float(stdin.readLine()).floatValue();

              System.out.println("Enter dv1:");
              dv1 = new Double(stdin.readLine()).doubleValue();

              System.out.println("Enter dv2:");
              dv2 = new Double(stdin.readLine()).doubleValue();

              System.out.println(dv2 / dv1);
              System.out.println(dv2 / fv1);
              System.out.println(dv2 / iv1);

              System.out.println(fv2 / dv1);
              System.out.println(fv2 / fv1);
              System.out.println(fv2 / iv1);

              System.out.println(iv2 / dv1);
              System.out.println(iv2 / fv1); 
              System.out.println(iv2 / iv1);
      }
}
 
