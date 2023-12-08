namespace AdventOfCodeCSharp;

// ReSharper disable once ClassNeverInstantiated.Global
public class Day1Part1
{
    public static void Run()
    {
        var lines = File.ReadAllLines("Day1.txt");

        var totalNum = 0;

        foreach (var line in lines)
        {
            var lineCharArray = line.ToCharArray();

            var lineNum = string.Empty;

            foreach (var c in lineCharArray)
            {
                if (!int.TryParse(c.ToString(), out var num)) continue;
                lineNum += num;
                break;
            }

            for (var i = lineCharArray.Length - 1; i > -1; i--)
            {
                var c = lineCharArray[i];

                if (!int.TryParse(c.ToString(), out var num)) continue;
                lineNum += num;
                break;
            }

            totalNum += Convert.ToInt32(lineNum);
        }

        Console.WriteLine(totalNum);
    }
}