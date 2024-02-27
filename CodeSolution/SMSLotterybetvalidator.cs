public static class Kata
{
  public static int[] ValidateBet(int N, int M, string text)
  {
     
        char[] arr = new char[] { ' ', ',' };
        text = text.Replace(" ", ",");
        string[] split = text.Split(',');
        List<int> result = new List<int> { };
        int temp = 0;

    
        for (int i = 0; i < split.Count(); i++)
        {
            if (int.TryParse(split[i], out temp))
            {
                if (1 <= int.Parse(split[i]) && int.Parse(split[i]) <= M)
                {
                    if (!result.Contains(int.Parse(split[i].ToString())))
                    {
                        result.Add(int.Parse(split[i].ToString()));
                    }
                    else if (result.Contains(int.Parse(split[i].ToString())))
                    {
                      return null;
                    }
                }
                else
                {
                  return null;
                }
            }
            else if (split[i] != "")
            {
                return null;
            }
        }
    
        

        if (result.Count() != N)
        {
            return null;
        }

        result.Sort();

        return result.ToArray();
  }
}
