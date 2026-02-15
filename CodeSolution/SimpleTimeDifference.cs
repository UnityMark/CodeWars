// https://www.codewars.com/kata/5b76a34ff71e5de9db0000f2/train/csharp

using System;

public class Solution
{
    public static string solve(string [] arr)
    {
      
        string[] timeArray = arr;

        int[] minutes = new int[timeArray.Length];

        for(int i = 0; i < timeArray.Length; i++)
        {
            DateTime time = DateTime.Parse(timeArray[i]);
            minutes[i] = TimeToMinutes(time);
        }

        Sorting(minutes);

        Console.WriteLine(string.Join(",", timeArray));

        int[] waitMinutes = new int[timeArray.Length];

        for (int i = 1; i < minutes.Length; i++)
        {
            int result = minutes[i] - minutes[i - 1];
            waitMinutes[i-1] = result;
        }

        waitMinutes[timeArray.Length - 1] = (1440 - minutes[minutes.Length - 1]) + minutes[0];

        return GetTime(Max(waitMinutes));
    }
    
    static string GetTime(int valueMinute) 
    {
        valueMinute = valueMinute - 1;
        int hour = valueMinute / 60;
        int minute = valueMinute % 60;

        string hourString = "";
        string minuteString = "";

        hourString = $"{hour}";
        minuteString = $"{minute}";

        if (hour < 10) hourString = $"0{hour}";
        if (minute < 10) minuteString = $"0{minute}";

        return $"{hourString}:{minuteString}";
    }

    static int Max(int[] array)
    {
        int max = 0;
        foreach(var item in array)
        {
            if(item > max)
            {
                max = item;
            }
        }

        return max;
    }

    static void Sorting(int[] array)
    {
        for (int i = 0; i < array.Length; i++)
        {
            for(int j = 0; j < array.Length; j++)
            {
                if (array[i] < array[j])
                {
                    int temp = array[j];
                    array[j] = array[i];
                    array[i] = temp;
                }
            }
        }
    }
  
    static int TimeToMinutes(DateTime dateTime)
    {
        int minutes = dateTime.Hour * 60 + dateTime.Minute;
        return minutes;
    }
}
