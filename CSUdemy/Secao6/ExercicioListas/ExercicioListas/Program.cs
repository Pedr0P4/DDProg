using System.Globalization;
using System.Collections.Generic;

namespace ExercicioListas
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Employee> employees = new List<Employee>();
            Employee employee;

            Console.WriteLine("-----------------------------------");
            Console.Write("How many employees will be registered? ");
            int employeesAmount = int.Parse(Console.ReadLine());
            Console.WriteLine("-----------------------------------");

            for (int i = 0; i < employeesAmount; i++)
            {
                Console.WriteLine("Employee #" + (i+1) + ":");

                Console.Write("Id: ");
                int id = int.Parse(Console.ReadLine());
                Console.Write("Name: ");
                string name = Console.ReadLine();
                Console.Write("Salary: ");
                double salary = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
                Console.WriteLine("-----------------------------------");

                employee = new Employee(id, name, salary);
                employees.Add(employee);
            }

            Console.Write("Enter the employee id that will have salary increase: ");
            int selectedId = int.Parse(Console.ReadLine());

            Employee selectedEmployee = employees.Find(x => x.Id == selectedId);
            if(selectedEmployee != null)
            {
                Console.Write("Enter the percentage: ");
                double percentage = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
                selectedEmployee.IncreaseSalary(percentage);

                Console.WriteLine("Updated list of employees:");
                foreach(Employee emp in employees)
                {
                    Console.WriteLine(emp);
                }
            }
            else
            {
                Console.WriteLine("This id does not exist!");
                Console.WriteLine("-----------------------------------");
                Console.WriteLine("Updated list of employees:");
                foreach (Employee emp in employees)
                {
                    Console.WriteLine(emp);
                }
            }
            Console.WriteLine("-----------------------------------");
        }
    }
}
