using System;
using System.Linq;

public class Kata
{
  public static int ConsonantCount(string str)
  {
      char[] chars = { 'a', 'e', 'i', 'o', 'u'};
      str = str.ToLower();
      char[] words = str.ToCharArray();

      return words.Where(x => chars.Contains(x) == false && char.IsLetter(x)).Count();
  }
}
