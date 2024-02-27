public static class Kata
{
  public static string Likes(string[] name)
  {
    int count = name.Count();
    int counter = count - 2;
    if (count == 0) {
      return "no one likes this";
    }
    
    else if (count == 1) {
      return $"{name[0]} likes this";
    }
    
    else if (count == 2) {
      return $"{name[0]} and {name[1]} like this";
    }
    
    else if (count == 3) {
      return $"{name[0]}, {name[1]} and {name[2]} like this";
    }
    else{
      return $"{name[0]}, {name[1]} and {counter} others like this";
    }
  }
}
