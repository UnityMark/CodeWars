public class Kata
{
  public static string OddOrEven(int[] array)
  {
    return array.Sum() % 2 == 0 ? "even" : "odd";
  }
}
