using System.Globalization;
using System.IO;

using ExercicioArquivos.Entities;

namespace ExercicioArquivos
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the full file path:");
            string sourceFilePath = Console.ReadLine();

            try
            {
                string[] lines = File.ReadAllLines(sourceFilePath);

                string sourceFolderPath = Path.GetDirectoryName(sourceFilePath);
                string targetFolderPath = sourceFolderPath + @"\out";
                string targetFilePath = targetFolderPath + @"\summary.csv";

                Directory.CreateDirectory(targetFolderPath);

                using(StreamWriter sw = File.CreateText(targetFilePath))
                {
                    foreach(string line in lines)
                    {
                        string[] fields = line.Split(',');
                        string name = fields[0];
                        double price = double.Parse(fields[1], CultureInfo.InvariantCulture);
                        int amount = int.Parse(fields[2]);

                        Order order = new Order(name, price, amount);
                        sw.WriteLine($"{order.Name},{order.TotalPrice().ToString("F2", CultureInfo.InvariantCulture)}");
                    }
                }
            }
            catch(IOException e)
            {
                Console.WriteLine("An error ocurred:");
                Console.WriteLine(e.Message);
            }
        }
    }
}
