public class Kata
{
    public static IEnumerable<string> OpenOrSenior(int[][] data)
    {
        string[] output = new string[data.Length];
          for(int i = 0; i < data.Length;i++)
          {
              if(data[i][0] > 54 && data[i][1] > 7)
              {
                  output[i] = "Senior";
              }
              else
              {
                  output[i] = "Open";
              }
          }

          return output;
    }

    public static IEnumerable<string> OpenOrSenior(int[][] data)
    {
        return data.Select(member => member[0] >= 55 && member[1] > 7 ? "Senior" : "Open").ToList();
    }
}