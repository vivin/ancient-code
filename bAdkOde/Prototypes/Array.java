import java.io.IOException;

class Array
{
      private Variable[] VarArray;
      private String ArrayType;
      private String ArrayName;
      private int ArraySize;

      Array()
      {
           ArrayType = "void";
           ArrayName = "uninitialized";
           ArraySize = 0;
           VarArray = new Variable[ArraySize];
      }

      Array(String Type, String Name, String Size)
      {
            ArrayType = Type;
            ArrayName = Name;
            ArraySize = new Integer(Size).intValue();
            VarArray = new Variable[ArraySize];
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
             return ArrayName;
      }

      public String returnType()
      {
             return ArrayType;
      }

      public int returnSize()
      {
             return ArraySize;
      }

      public String returnValueAt(int index)
      {
             return VarArray[index].returnValue();
      }

      public int setValueAsDoubleAt(double doubleValue, int index)
      {
             int storeResult = 0;

             storeResult = VarArray[index].setValueAsDouble(doubleValue);

             return storeResult;
      }

      public int setValueAsFloatAt(float floatValue, int index)
      {
             int storeResult = 0;

             storeResult = VarArray[index].setValueAsFloat(floatValue);

             return storeResult;
      }

      public int setValueAsIntAt(int intValue, int index)
      {
             int storeResult = 0;

             storeResult = VarArray[index].setValueAsInt(intValue);

             return storeResult;
      }

      public int setValueAsCharAt(char charValue, int index)
      {
             VarArray[index].setValueAsChar(charValue);

             return 0;
      }

      public int setValueAsStringAt(String stringValue, int index)
      {
             VarArray[index].setValueAsString(stringValue);

             return 0;
      }

      public void displayAt(int index)
      {
             VarArray[index].display();
      }

      public void display()
      {
             System.out.print(ArrayName + "\t" + ArrayType + "\t" + ArraySize + "\t");

             for(int i = 0; i < ArraySize - 1; i++)
             {
                 System.out.print(VarArray[i].returnValue() + ", ");
             }

             System.out.print(VarArray[ArraySize - 1].returnValue());

             System.out.println("");
      }

      public void setType(String newType, int index)
      {
             VarArray[index].setType(newType);
      }
}
