public class Kata
{
  public static string PigIt(string str)
  {
      List<string> list = new List<string>();
            list = str.Split(' ').ToList();
            string pattern = "!@#$%^&*()_-=+.,:?";
            string result = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (!pattern.Contains(list[i].ToString()))
                {
                    for (int j = 1; j <= list[i].ToString().Length; j++)
                    {

                        if (j == list[i].ToString().Length)
                        {
                            result += list[i][0] + "ay";
                        }
                        else
                        {
                            result += list[i][j];
                        }
                    }
                }
                else
                {
                    result += list[i].ToString();
                }
                result += " ";
            }
            result = result.Trim();
            return result.Trim();
   }

  public static string PigIt(string str)
  {
    return string.Join(" ", str.Split(' ').Select(w => w.Any(char.IsPunctuation) ? w : w.Substring(1) + w[0] + "ay"));
  }
}