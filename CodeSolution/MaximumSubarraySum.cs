public static class Kata
{
  public static int MaxSequence(int[] arr) 
  { 
       int result = 0;
            int max = 0;
            if (arr.Count() == 0 || arr.Max() < 0 )
            {
                return 0;
            }
            else if(arr.Min() > 0)
            {
                for (int i = 0; i < arr.Length; i++)
                {
                    result += arr[i];
                }
                return result;
            }
            else
            {
                for (int i = 0; i < arr.Length; i++)
                {
                    result = 0;
                    for(int j = i; j < arr.Length; j++)
                    {
                        result += arr[j];

                        if(max < result)
                        {
                            max = result;
                        }
                    }
                }

                return max;
            }
    }
    
    public static int MaxSequence(int[] arr)
    {
        int max = 0, res = 0, sum = 0;
        foreach(var item in arr)
        {
            sum += item;
            max = sum > max ? max : sum;
            res = res > sum - max ? res : sum - max;
        }
        return res;
    }

}