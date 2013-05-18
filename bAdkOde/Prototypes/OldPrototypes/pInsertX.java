import java.io.*;

public class pInsertX
{
       static void main(String[] args) throws IOException
       {
              BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

              String Exp = "";

              int i = 0;
              int j = 0;
              int parens = 0;
              int inparens = 0;
              int finalidx = 0;
              boolean done = false;

              System.out.print("Enter an expression in infix:");
              Exp = stdin.readLine();

              System.out.println("Exp: " + Exp);

              i = Exp.length() - 1;

              while(i >= 0)
              {
                    if(Exp.charAt(i) == ')')
                    {
                       parens++;
                    }

                    else
                    {
                       if(Exp.charAt(i) == '(')
                       {
                          parens--;
                       }
                    }

//System.out.println("p: " + parens + " echaratI: " + Exp.charAt(i));
                    if(parens == 0 && Exp.charAt(i) == '/')
                    {
                       j = i + 1;

                       while(!done && j < Exp.length())
                       {
System.out.println("We are here...");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

System.out.println("ip: " + inparens + " echaratJ: " + Exp.charAt(j) + " j: " + j);

                             if(inparens == 0 && j == Exp.length() - 1)
                             {
                                Exp = new StringBuffer(Exp).append(')').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j, ')').toString();
                                   done = true;
                                }
                             }

                             j++;
                       }

                       j = i - 1;
                       done = false;
                       inparens = 0;

                       while(!done && j >= 0)
                       {
System.out.println("We are here...2");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

                             if(inparens == 0 && j == 0)
                             {
                                Exp = new StringBuffer(Exp).insert(0, '(').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j + 1, '(').toString();
                                   done = true;
                                   finalidx = j;
                                }
                             }
                           
                             j--;
                       }

                       i = finalidx;
                    }


                    done = false;
                    i--;
              }

              parens = 0;
              inparens = 0;
              done = false;
              finalidx = 0;
              i = Exp.length() - 1;
              j = 0;

              while(i >= 0)
              {
                    if(Exp.charAt(i) == ')')
                    {
                       parens++;
                    }

                    else
                    {
                       if(Exp.charAt(i) == '(')
                       {
                          parens--;
                       }
                    }

System.out.println("p: " + parens + " echaratI: " + Exp.charAt(i));
                    if(parens == 0 && Exp.charAt(i) == '*')
                    {
                       j = i + 1;

                       while(!done && j < Exp.length())
                       {
System.out.println("We are here...");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

System.out.println("ip: " + inparens + " echaratJ: " + Exp.charAt(j) + " j: " + j);

                             if(inparens == 0 && j == Exp.length() - 1)
                             {
                                Exp = new StringBuffer(Exp).append(')').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j, ')').toString();
                                   done = true;
                                }
                             }

                             j++;
                       }

                       j = i - 1;
                       done = false;
                       inparens = 0;

                       while(!done && j >= 0)
                       {
System.out.println("We are here...2");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

                             if(inparens == 0 && j == 0)
                             {
                                Exp = new StringBuffer(Exp).insert(0, '(').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j + 1, '(').toString();
                                   done = true;
                                   finalidx = j;
                                }
                             }
                           
                             j--;
                       }

                       i = finalidx;
                    }


                    done = false;
                    i--;
              }

              parens = 0;
              inparens = 0;
              done = false;
              finalidx = 0;
              i = Exp.length() - 1;
              j = 0;

              while(i >= 0)
              {
                    if(Exp.charAt(i) == ')')
                    {
                       parens++;
                    }

                    else
                    {
                       if(Exp.charAt(i) == '(')
                       {
                          parens--;
                       }
                    }

System.out.println("p: " + parens + " echaratI: " + Exp.charAt(i));
                    if(parens == 0 && Exp.charAt(i) == '+')
                    {
                       j = i + 1;

                       while(!done && j < Exp.length())
                       {
System.out.println("We are here...");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

System.out.println("ip: " + inparens + " echaratJ: " + Exp.charAt(j) + " j: " + j);

                             if(inparens == 0 && j == Exp.length() - 1)
                             {
                                Exp = new StringBuffer(Exp).append(')').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j, ')').toString();
                                   done = true;
                                }
                             }

                             j++;
                       }

                       j = i - 1;
                       done = false;
                       inparens = 0;

                       while(!done && j >= 0)
                       {
System.out.println("We are here...2");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

                             if(inparens == 0 && j == 0)
                             {
                                Exp = new StringBuffer(Exp).insert(0, '(').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j + 1, '(').toString();
                                   done = true;
                                   finalidx = j;
                                }
                             }
                           
                             j--;
                       }

                       i = finalidx;
                    }


                    done = false;
                    i--;
              }

              parens = 0;
              inparens = 0;
              done = false;
              finalidx = 0;
              i = Exp.length() - 1;
              j = 0;

              while(i >= 0)
              {
                    if(Exp.charAt(i) == ')')
                    {
                       parens++;
                    }

                    else
                    {
                       if(Exp.charAt(i) == '(')
                       {
                          parens--;
                       }
                    }

System.out.println("p: " + parens + " echaratI: " + Exp.charAt(i));
                    if(parens == 0 && Exp.charAt(i) == '-')
                    {
                       j = i + 1;

                       while(!done && j < Exp.length())
                       {
System.out.println("We are here...");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

System.out.println("ip: " + inparens + " echaratJ: " + Exp.charAt(j) + " j: " + j);

                             if(inparens == 0 && j == Exp.length() - 1)
                             {
                                Exp = new StringBuffer(Exp).append(')').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j, ')').toString();
                                   done = true;
                                }
                             }

                             j++;
                       }

                       j = i - 1;
                       done = false;
                       inparens = 0;

                       while(!done && j >= 0)
                       {
System.out.println("We are here...2");
                             if(Exp.charAt(j) == ')')
                             {
                                inparens++;
                             }

                             else
                             {
                                if(Exp.charAt(j) == '(')
                                {
                                   inparens--;
                                }
                             }

                             if(inparens == 0 && j == 0)
                             {
                                Exp = new StringBuffer(Exp).insert(0, '(').toString();
                             }

                             else
                             {
                                if(inparens == 0 && (Exp.charAt(j) == '/' || Exp.charAt(j) == '*' || Exp.charAt(j) == '+' || Exp.charAt(j) == '-'))
                                {
                                   Exp = new StringBuffer(Exp).insert(j + 1, '(').toString();
                                   done = true;
                                   finalidx = j;
                                }
                             }
                           
                             j--;
                       }

                       i = finalidx;
                    }


                    done = false;
                    i--;
              }

              System.out.println("Exp: " + Exp);
       }
}