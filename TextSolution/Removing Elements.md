# Removing Elements

**My Solution**
```C#
public static class Kata
    {
        public static object[] RemoveEveryOther(object[] arr)
        {

            int sizeOfArray = 0;

            if ((double)arr.Length % 2 != 0)
                sizeOfArray = (arr.Length / 2) + 1;

            else
                sizeOfArray = arr.Length / 2;


            object[] objects = new object[sizeOfArray];

            int count = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                if (i % 2 == 0)
                {
                    objects[count] = arr[i];
                    count++;
                }
            }
          
          return objects;

        }
    }
```
**Best Solution**
```C#
public static class Kata
{
    public static object[] RemoveEveryOther(object[] arr)
    {
        return arr.Where((e, i) => i%2 == 0).ToArray();
    }
}
```
