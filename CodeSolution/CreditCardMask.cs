public static class Kata
{
  // return masked string
  public static string Maskify(string cc)
  {
    return cc.Length > 4 ? "".PadLeft(cc.Length-4, '#') + cc.Substring(cc.Length - 4, 4) : cc;
  }
}
