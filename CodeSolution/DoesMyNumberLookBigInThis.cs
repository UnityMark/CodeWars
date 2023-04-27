public class Kata
{
  public static bool Narcissistic(int value)
  {
        string number = value.ToString();
        long result = 0;
        for (int i = 0; i < number.Length; i++)
        {
            checked
            {
                long temp = long.Parse(number[i].ToString());
                result += Convert.ToInt64(Math.Pow(temp, number.Length));
            }
        }
        return (result == value) ? true : false;
  }
  
  public static bool Narcissistic(int value)
  {
    var str = value.ToString();
    return str.Sum(c => Math.Pow(Convert.ToInt16(c.ToString()), str.Length)) == value;
  }
}