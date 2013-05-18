import java.io.IOException;

class Variable
{
      private String variableType;
      private String variableName;
      private String variableValue;

      Variable()
      {
               variableType = "void";
               variableName = "uninitialized";
               variableValue = null;
      }

      Variable(String Type, String Name, String Value)
      {
               variableType = Type;
               variableName = Name;
               variableValue = Value;
      }
/*
      public int intValue() throws NullPointerException
      {
             return variableValue.intValue();
      }

      public double doubleValue() throws NullPointerException
      {
             return variableValue.doubleValue();
      }

      public float floatValue() throws NullPointerException
      {
             return variableValue.floatValue();
      }

      public char charValue() throws NullPointerException
      {
             return variableValue.charAt(0);
      }

      public String toString() throws NullPointerException
      {
             return variableValue;
      }*/

      public String returnName()
      {
             return variableName;
      }

      public String returnType()
      {
             return variableType;
      }

      public String returnValue()
      {
             return variableValue;
      }

      public int setValueAsDouble(double doubleValue)
      {
             int storeResult = 0;

             try
             {
               variableValue = new Double(doubleValue).toString();
             }

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setValueAsFloat(float floatValue)
      {
             int storeResult = 0;

             try
             {
               variableValue = new Float(floatValue).toString();
             }  

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setValueAsInt(int intValue)
      {
             int storeResult = 0;

             try
             {
               variableValue = new Integer(intValue).toString();
             }

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setValueAsChar(char charValue)
      {
             variableValue = new StringBuffer("").append(charValue).toString();

             return 0;
      }

      public int setValueAsString(String stringValue)
      {
             variableValue = stringValue;

             return 0;
      }

      public int setValueAsBoolean(boolean boolValue)
      {
	     variableValue = new Boolean(boolValue).toString();

	     return 0;
      }

      public void display()
      {
             System.out.println(variableType + "\t" + variableName + "\t" + variableValue);
      }

      public void setType(String newType)
      {
             variableType = newType;
      }
}
