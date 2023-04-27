public class Kata
{
  public static Dictionary<char, int> Count(string str)
  {
        Dictionary<char, int> dictionary = new Dictionary<char, int>();
        for (int i = 0; i < str.Length; i++)
        {
            if (!dictionary.ContainsKey(str[i]))
            {
                int temp = str.Count(f => f == str[i]);
                dictionary.Add(str[i], temp);
            }
        }
        return dictionary;
  }

  public static Dictionary<char, int> Count(string str)
  {
    return str.GroupBy(c => c).ToDictionary(g => g.Key, g => g.Count());
  }
}