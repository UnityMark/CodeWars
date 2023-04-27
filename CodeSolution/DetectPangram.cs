public static class Kata
{
  public static bool IsPangram(string str)
  {
        str = str.ToLower();
        str = str.Trim(new char[] { ' ', '.', ',', '?', '!' });
        string strChar = "qwertyuiopasdfghjklzxcvbnm";
        char[] charList = new char[str.Length];
        for (int i = 0; i < str.Length; i++)
        {
            charList[i] = str[i];
        }
        List<char> result = charList.Distinct().ToList();
        if (result.Count() >= strChar.Length)
        {
            return true;
        }
        return false;
  }

  public static bool IsPangram(string str)
  {
    return str.Where(ch => Char.IsLetter(ch)).Select(ch => Char.ToLower(ch)).Distinct().Count() == 26;
  }
}