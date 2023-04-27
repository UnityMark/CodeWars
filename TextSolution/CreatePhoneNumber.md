# Create Phone Number

**My Solution**
```C#
public class Kata
{
  public static string CreatePhoneNumber(int[] numbers)
  {
      string phoneNumber = "";
            for (int i = 0; i < numbers.Length; i++)
            {
                phoneNumber += numbers[i].ToString();
            }
            if(phoneNumber.Length < 10)
            {
                string temp = "";
                for(int i = 0; i < 10 - numbers.Length; i++)
                {
                    temp += "0";
                }
                phoneNumber = temp + phoneNumber;
            }
            phoneNumber = phoneNumber.Insert( 0, "(" );
            phoneNumber = phoneNumber.Insert( 4, ")" );
            phoneNumber = phoneNumber.Insert( 5, " " );
            phoneNumber = phoneNumber.Insert( 9, "-" );
            return phoneNumber;
  }
}
```
**Best Solution**
```C#
public class Kata
{
  public static string CreatePhoneNumber(int[] numbers)
  {
    return long.Parse(string.Concat(numbers)).ToString("(000) 000-0000");
  }
}
```
