using System;
using System.Linq;

public static class Kata
{
    public static int GetVowelCount(string str)
    {
        char[] chars = { 'a', 'e', 'i', 'o', 'u' };
        return str.Where(x => chars.Contains(x)).Count();
    }
}
