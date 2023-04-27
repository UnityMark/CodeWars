public static class TimeFormat
{
    public static string GetReadableTime(int seconds)
    {
            int minuts = 0;
            int hours = 0;
            string time = "";
            hours = (seconds / 60) / 60;
            minuts = (seconds / 60) - (hours * 60);
            seconds = seconds - (hours * 60 * 60) - (minuts * 60);
            if(hours.ToString().Length < 2)
            {
                time += "0" + hours.ToString() + ":";
            }
            else
            {
                time += hours.ToString() + ":";
            }
            if (minuts.ToString().Length < 2)
            {
                time += "0" + minuts.ToString() + ":";
            }
            else
            {
                time += minuts.ToString() + ":";
            }
            if (seconds.ToString().Length < 2)
            {
                time += "0" + seconds.ToString();
            }
            else
            {
                time += seconds.ToString();
            }

            return time;
    }

    public static string GetReadableTime(int seconds)
    {
        return string.Format("{0:d2}:{1:d2}:{2:d2}", seconds / 3600, seconds / 60 % 60, seconds % 60);
    }
}