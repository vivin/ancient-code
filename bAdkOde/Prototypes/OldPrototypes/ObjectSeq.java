class ObjectSeq
{
      Object[] Data;
      int count;

      public ObjectSeq()
      {
             Data = new Object[10];
             count = 0;
      }

      public ObjectSeq(int InitialSize)
      {
             Data = new Object[InitialSize];
             count = 0;
      }

      public void insert(int pos, Object element)
      {
             if(pos < 0)
             {
                throw new ArrayIndexOutOfBoundsException(": " + pos);
             }

             grow((count * 2) + 1);

             for(int i = count; i > pos; i--)
             {
                 Data[i] = Data[i - 1];
             }

             Data[pos] = element;
       
             count++;
      }

      public void deleteFrom(int pos)
      {
             if(pos < 0 || pos >= count)
             {
                throw new ArrayIndexOutOfBoundsException(": " + pos);
             }

             for(int i = pos; i > count - 1; i++)
             {
                 Data[i] = Data[i + 1];
             }
       
             count--;
      }

      public void grow(int NewSize)
      {
             Object[] biggerSeq;

             if(NewSize > Data.length)
             {
                biggerSeq = new Object[NewSize];
                System.arraycopy(Data, 0, biggerSeq, 0, count);
                Data = biggerSeq;
             }
      }

      public Object elementAt(int pos)
      {
             if(pos < 0 || pos >= count)
             {
                throw new ArrayIndexOutOfBoundsException(": " + pos);
             }

             return Data[pos];
      }

      public int returnCount()
      {
             return count;
      }


      //I know this is bad, but I'm currently assuming it is a String coz I'm using it just for that.
      public int subscriptOf(Object element)
      {
             boolean found = false;
             int i = 0;

             while(!found && i < count) 
             {
                 found = ((String) element).compareTo((String) Data[i]) == 0;
                 i++;
             }

             if(!found)
             {
                return -1;
             }

             else
             {
                return (i - 1);
             }
      }

      public int subscriptOf(int pos, Object element) 
      {
             boolean found = false;
             int i = pos;

             if(pos < 0 || pos >= count)
             {
                throw new ArrayIndexOutOfBoundsException(": " + pos);
             }

             while(!found && i < count)
             {
                   found = ((String) element).compareTo((String) Data[i]) == 0;
                   i++;
             }

             if(!found)
             {
                return -1;
             }

             else
             {
                return (i - 1);
             }
      }
}
