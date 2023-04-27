using System;
using System.Collections.Generic;
using System.Linq;


namespace Kata_8Kuy
{
    internal static class RemovingElements
    {
        
        public static object[] RemoveEveryOther(object[] arr) // My Solution
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

        public static object[] RemoveEveryOther(object[] arr) // Best Solution 
        {
            return arr.Where((e, i) => i % 2 == 0).ToArray();
        }
        
    }
}
