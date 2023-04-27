public class Kata
{
  public static int Find(int[] integers)
  {
      string even = "";
      string notEven = "";
      for (int i = 0; i < integers.Length; i++)
      {
          if (integers[i] % 2 == 0)
          {
              even += integers[i].ToString();
          }
          else
          {
              notEven += integers[i].ToString();
          }
      }
      if (even.Length > notEven.Length)
      {
          return int.Parse(notEven);
      }
      return int.Parse(even);
  }

  public static int Find(int[] integers)
  {
    var evenNumbers = integers.Where(integer => integer % 2 == 0);
    var oddNumbers = integers.Where(integer => integer % 2 == 1);
    return evenNumbers.Count() == 1 ? evenNumbers.First() : oddNumbers.First();
  }
}