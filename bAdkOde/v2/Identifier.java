import java.io.IOException;

class Identifier
{
      private String IdentifierType;
      private String IdentifierName;
      private String IdentifierScope;
      private Object IdentifierReference;
      private int    NestingDepth;

      Identifier()
      {
               IdentifierType = "void";
               IdentifierName = "uninitialized";
	       IdentifierReference = null;
	       IdentifierScope = "global";
	       NestingDepth = 0;
      }

      //Identifier types are Variable, Array, Function

      Identifier(String Type, String Name, String Scope, Object Reference, int nd)
      {
               IdentifierType = Type;
               IdentifierName = Name;
               IdentifierReference = Reference;
	       IdentifierScope = Scope;
	       NestingDepth = nd;
      }

      public String returnName()
      {
             return IdentifierName;
      }

      public String returnType()
      {
             return IdentifierType;
      }

      public String returnScope()
      {
             return IdentifierScope;
      }

      public Object returnReference()
      {
             return IdentifierReference;
      }

      public int returnNestingDepth()
      {
             return NestingDepth;
      }

      public void increaseNestingDepth()
      {
             NestingDepth++;
      }
}
