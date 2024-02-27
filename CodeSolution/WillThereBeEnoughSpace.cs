public static class Kata
{
  public static int Enough(int cap, int on, int wait)
  {
      if(cap > on + wait){
          return 0;
        }
      return Math.Abs(on+wait - cap);
  }
}
