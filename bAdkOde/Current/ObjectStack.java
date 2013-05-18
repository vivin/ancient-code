import java.util.EmptyStackException;

public class ObjectStack implements Cloneable
{
       int count;
       Object[] data;
       int INITIAL_CAPACITY;

       public ObjectStack()
       {
              final int INITIAL_CAPACITY = 10;
              count = 0;
              data = new Object[INITIAL_CAPACITY];
       }

       public ObjectStack(int initialSize)
       {
              if(initialSize < 0)
              {
                 throw new IllegalArgumentException("Cannot have negative size: " + initialSize);
              }
      
              count = 0;

              data = new Object[initialSize];
       }
   
       public Object clone()       
       {   
              ObjectStack theclone;
      
              try
              {
                theclone = (ObjectStack) super.clone();
              }

              catch (CloneNotSupportedException e)
              { 
                     throw new RuntimeException("This class does not implement Cloneable");
              }
      
              theclone.data = (Object []) data.clone();
      
              return theclone;
       }        
 
   
       public void grow(int MinimumSize)
       {
              Object biggerArray[];
      
              if(data.length < MinimumSize)
              {
                 biggerArray = new Object[MinimumSize];
                 System.arraycopy(data, 0, biggerArray, 0, count);
                 data = biggerArray;
              }
       }

       public int getCapacity()   
       {
              return data.length;
       }

       public boolean isEmpty()
       {
              return (count == 0);
       }
   
       public Object peek()   
       {
              if(count == 0)
              {
                 throw new EmptyStackException();
              }

              return data[count - 1];
       }

       public Object pop()
       {
              if (count == 0)
              {
                  throw new EmptyStackException();
              }

              return data[--count];
       }

       public void push(Object item)
       {
              if(count == data.length)
              {
                 grow((count * 2) + 1);
              }

              data[count] = item;
              count++;
       }
              
       public int size()   
       {
              return count;
       }

       public void trimToSize()
       {
              Object trimmedArray[];
      
              if(data.length != count)
              {
                 trimmedArray = new Object[count];
                 System.arraycopy(data, 0, trimmedArray, 0, count);
                 data = trimmedArray;
              }
       } 
}
