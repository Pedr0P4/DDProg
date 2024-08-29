using System.Runtime.InteropServices;
using csharpbasics2;
namespace csharpbasics
{
    internal class Program
    {
        static void Main(string[] args){
            int YearsOfExperience = 12;
            double Salary = 100000;
            bool IsVeteran = false;
            string FullName = "Razvan A. Mezei";
            DateTime HiringDate = DateTime.Parse("15/08/2018 8:00:00 AM");
            DateTime CurrentDateTime = DateTime.Now;

            Console.WriteLine($"Years of experience: {YearsOfExperience};");
            Console.WriteLine($"Salary: {Salary:c};");
            Console.WriteLine($"Full name: {FullName};");
            Console.WriteLine($"Is {IsVeteran} that {FullName} is veteran;");
            Console.WriteLine($"Was hired at: {HiringDate};");
            Console.WriteLine($"The current date and time is: {CurrentDateTime};");

            FacultyLevel CurrentLevel = FacultyLevel.ASSISTANT;
            Console.WriteLine($"Faculty level: {CurrentLevel}.");

            Instructor myself;
        }
    }
}