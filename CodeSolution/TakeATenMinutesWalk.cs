public class Kata
{
  public static bool IsValidWalk(string[] walks)
  {
        int horizontal = 0;
        int vertical = 0;
        int minuts = 0;
        for (int i = 0; i < walks.Count(); i++)
        {
            if (walks[i] == "n")
            {
                vertical += 1;
            }
            else if (walks[i] == "s")
            {
                vertical -= 1;
            }
            else if (walks[i] == "e")
            {
                horizontal += 1;
            }
            else
            {
                horizontal -= 1;
            }
            minuts += 1;
        }
        return vertical == 0 && horizontal == 0 && minuts == 10;
  }

  public static bool IsValidWalk(string[] walk)
  {
    if (walk.Length != 10) return false;
    var x = 0; var y = 0;
    foreach (var dir in walk)
    {
        if (dir == "n") x++;
        else if (dir == "s") x--;
        else if (dir == "e") y++;
        else if (dir == "w") y--;
    }
    return x == 0 && y == 0;
  }
}