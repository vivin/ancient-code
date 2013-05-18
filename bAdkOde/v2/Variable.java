import java.io.IOException;

class Variable
{
      private String VariableType;
      private String VariableName;
      private String VariableValue;

      Variable()
      {
               VariableType = "void";
               VariableName = "uninitialized";
               VariableValue = null;
      }

      Variable(String Type, String Name, String Value)
      {
               VariableType = Type;
               VariableName = Name;
               VariableValue = Value;
      }

      public int intValue() throws NullPointerException
      {
             return new Integer(VariableValue).intValue();
      }

      public double doubleValue() throws NullPointerException
      {
             return new Double(VariableValue).doubleValue();
      }

      public float floatValue() throws NullPointerException
      {
             return new Float(VariableValue).floatValue();
      }

      public char charValue() throws NullPointerException
      {
             char returnvalue;

             if(VariableType.compareTo("int") == 0)
	     {
	        returnvalue = new Character((char) intValue()).charValue();
	     }

	     else
	     {
                if(VariableType.compareTo("float") == 0)
		{
		   returnvalue = new Character((char) floatValue()).charValue();
		}

		else
		{
                   returnvalue = new Character((char) doubleValue()).charValue();
		}
	     }

	     return returnvalue;
      }

      public String intRep() throws NullPointerException
      {
             return new Integer(VariableValue).toString();
      }

      public String doubleRep() throws NullPointerException
      {
             return new Double(VariableValue).toString();
      }

      public String floatRep() throws NullPointerException
      {
             return new Float(VariableValue).toString();
      }

      public String charRep() throws NullPointerException
      {
             return new Character(charValue()).toString(); 
      }

      public String toString() throws NullPointerException
      {
             return VariableValue;
      }

      public String returnName()
      {
             return VariableName;
      }

      public String returnType()
      {
             return VariableType;
      }

      public String returnValue()
      {
             return VariableValue;
      }

      public int setDoubleValue(double doubleValue)
      {
             int storeResult = 0;

             try
             {
               VariableValue = new Double(doubleValue).toString();
             }

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setFloatValue(float floatValue)
      {
             int storeResult = 0;

             try
             {
               VariableValue = new Float(floatValue).toString();
             }  

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setIntValue(int intValue)
      {
             int storeResult = 0;

             try
             {
               VariableValue = new Integer(intValue).toString();
             }

             catch(Exception fatal)
             {
                   System.out.println("Exception " + fatal + " ocurred while storing value.");
                   storeResult = 6;
             }

             return storeResult;
      }

      public int setCharValue(char charValue)
      {
             VariableValue = new StringBuffer("").append(charValue).toString();

             return 0;
      }

      public int setStringValue(String stringValue)
      {
             VariableValue = stringValue;

             return 0;
      }

      public int setBooleanValue(boolean boolValue)
      {
	     VariableValue = new Boolean(boolValue).toString();

	     return 0;
      }

      public void display()
      {
             System.out.println(VariableType + "\t" + VariableName + "\t" + VariableValue);
      }

      public void setType(String newType)
      {
             VariableType = newType;
      }
}
