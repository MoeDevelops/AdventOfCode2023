using System.Text.RegularExpressions;
using AdventOfCodeCSharp;
using Microsoft.VisualBasic;

public class Day1Part2
{
    public static void Run()
    {
        var numsAsStrings = new Dictionary<string, int>()
        {
            { "one", 1},
            { "two", 2},
            { "three", 3},
            { "four", 4},
            { "five", 5},
            { "six", 6},
            { "seven", 7},
            { "eight", 8},
            { "nine", 9}
        };

        var lines = File.ReadAllLines("Day1.txt");

        var totalNum = 0;

        foreach (var line in lines)
        {
            var lineCharArray = line.ToCharArray();

            var lineNum = string.Empty;

            for (var i = 0; i < lineCharArray.Length; i++)
            {
                var keyValuePair = numsAsStrings.FirstOrDefault(x => line[i..].StartsWith(x.Key));

                if (!keyValuePair.Equals(default(KeyValuePair<string, int>)))
                {
                    lineNum += keyValuePair.Value.ToString();
                    break;
                }

                char c = lineCharArray[i];

                if (int.TryParse(c.ToString(), out var num))
                {
                    lineNum += num;
                    break;
                }
            }

            for (var i = lineCharArray.Length - 1; i > -1; i--)
            {
                var keyValuePair = numsAsStrings.FirstOrDefault(x => line[i..].StartsWith(x.Key));

                if (!keyValuePair.Equals(default(KeyValuePair<string, int>)))
                {
                    lineNum += keyValuePair.Value.ToString();
                    break;
                }

                var c = lineCharArray[i];

                if (int.TryParse(c.ToString(), out var num))
                {
                    lineNum += num;
                    break;
                }
            }

            totalNum += Convert.ToInt32(lineNum);
        }

        Console.WriteLine(totalNum);
    }
}