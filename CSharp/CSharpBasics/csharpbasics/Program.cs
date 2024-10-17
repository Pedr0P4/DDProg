using System.Runtime.InteropServices;
using csharpbasics2;
using csharpbasics3;
namespace csharpbasics
{
    internal class Program
    {
        static void Main(string[] args){
            /*
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
            */

            Instructor instructor1 = new Instructor();
            instructor1.Name = "Pedro Paulo G. G. de Oliveira";
            instructor1.HiringDate = DateTime.Parse("01/08/2022 8:00:00 AM");
            instructor1.IsTenured = false;
            instructor1.FacultyLevel = FacultyLevel.ASSISTANT;

            Instructor instructor2 = new Instructor();
            instructor2.Name = "Cecíclia Cerqueira Souza";
            instructor2.HiringDate = DateTime.Parse("05/04/2019 12:00:00 PM");
            instructor2.IsTenured = false;
            instructor2.FacultyLevel = FacultyLevel.INSTRUCTOR;

            Product product1 = new Product();
            product1.ProductName = "Monitor 27' 165hz";
            product1.Description = "A very good monitor for gaming!";
            product1.ManufacturingDate = DateTime.Now;
            product1.Weight = 7800;

            Console.WriteLine($"Instructor {instructor1.Name} is a(n) {instructor1.FacultyLevel} Professor");
            Console.WriteLine($"Instructor {instructor2.Name} is a(n) {instructor2.FacultyLevel} Professor");

            instructor1.ChangeName("Otávio Oitavo");
            Console.WriteLine($"Instructor {instructor1.Name} worked here for {instructor1.YearsSinceHired()} years");
        }
    }
}