class Kata
{
    public static int StrCount(string str, char letter)
    {
        return str.ToCharArray().Where(c => c == letter).Count(); 
    }
}
