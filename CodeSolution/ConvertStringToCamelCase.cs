public class Kata
{
  public static string ToCamelCase(string str)
  {
            string result = "";
            bool upper = false;
            for (int i = 0; i < str.Length; i++)
            {
                if(str[i] != '-' && str[i] != '_')
                {
                    if (upper)
                    {
                        result += str[i].ToString().ToUpper();
                        upper = false;
                    }
                    else
                    {
                        result += str[i].ToString();
                    }
                }
                else
                {
                    upper = true;
                }
            }
            return result;
  }

  public static string ToCamelCase(string str)
  {
    return Regex.Replace(str, @"[_-](\w)", m => m.Groups[1].Value.ToUpper());
  }
}