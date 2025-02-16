using System.Globalization;

using Exercicio1.Entities;

namespace Exercicio1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of employees: ");
            int employeeAmount = int.Parse(Console.ReadLine());

            List<Employee> employees = new List<Employee>();

            for (int i = 0; i < employeeAmount; i++)
            {
                Console.WriteLine($"Employee #{i+1} data:");
                Console.Write("Outsourced (y/n)? ");
                char answer = char.Parse(Console.ReadLine());

                bool isOutsourced;
                if (answer == 'y')
                {
                    isOutsourced = true;
                }
                else if (answer == 'n')
                {
                    isOutsourced = false;
                }
                else
                {
                    Console.WriteLine("Invalid answer. Using default configuration (n)");
                    isOutsourced = false;
                }

                Console.Write("Name: ");
                string name = Console.ReadLine();
                Console.Write("Hours: ");
                int hours = int.Parse(Console.ReadLine());
                Console.Write("Value per hour: ");
                double valuePerHour = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                if (isOutsourced)
                {
                    Console.Write("Additional charge: ");
                    double additionalCharge = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                    Employee employee = new OutsourceEmployee(name, hours, valuePerHour, additionalCharge);
                    employees.Add(employee);
                }
                else
                {
                    Employee employee = new Employee(name, hours, valuePerHour);
                    employees.Add(employee);
                }
            }

            Console.WriteLine();
            Console.WriteLine("PAYMENTS:");
            foreach (Employee employee in employees)
            {
                Console.WriteLine(employee);
            }
        }
    }
}
