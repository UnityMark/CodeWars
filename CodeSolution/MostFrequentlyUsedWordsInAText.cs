public class TopWords
{
    public static List<string> Top3(string str)
    {
            str = str.ToLower();
            int max = 3;
            string cheking = "qwertyuiopasdfghjklzxcvbnm'";
            Dictionary<string, int> dictionary = new Dictionary<string, int>();
            for (int i = 0; i < str.Length; i++)
            {
                for (int j = 0; j < cheking.Length; j++)
                {
                    if (!cheking.Contains(str[i]))
                    {
                        str = str.Replace(str[i], ' ');
                    }
                }
            }
            List<string> list = new List<string>();
            str = System.Text.RegularExpressions.Regex.Replace(str, @"\s+", " ");
            str = System.Text.RegularExpressions.Regex.Replace(str, @"\'+", "'");
            list = str.Split(' ').ToList();

            for (int i = 0; i < list.Count; i++)
            {
                if (!dictionary.ContainsKey(list[i]) && list[i].ToString() != String.Empty && list[i].ToString() != "'") 
                {
                    dictionary.Add(list[i], list.Where(x => x.Count() == list[i].Count()).ToList().FindAll(x => x.Contains(list[i])).Count());
                }
            }

            if(dictionary.Count() < 3)
            {
                max = dictionary.Count();
            }
            list = dictionary.OrderBy(x => x.Value).Reverse().Select(x => x.Key).ToList().GetRange(0,max);

            return list;
    }

    public static List<string> Top3(string s)
    {
        return Regex.Matches(s.ToLowerInvariant(), @"('*[a-z]'*)+")
            .GroupBy(match => match.Value)
            .OrderByDescending(g => g.Count())
            .Select(p => p.Key)
            .Take(3)
            .ToList();
    }

}