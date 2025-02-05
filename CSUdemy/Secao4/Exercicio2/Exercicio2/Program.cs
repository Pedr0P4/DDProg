using System.Net.Http.Headers;

namespace Exercicio2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string name;
            double payment;

            Employee employee1 = new Employee();
            Employee employee2 = new Employee();

            Console.WriteLine("Dados do primeiro funcionário:");
            Console.Write("Nome: ");
            name = Console.ReadLine();
            Console.Write("Salário: ");
            payment = int.Parse(Console.ReadLine());

            employee1.Name = name;
            employee1.Payment = payment;

            Console.WriteLine("Dados do segundo funcionário:");
            Console.Write("Nome: ");
            name = Console.ReadLine();
            Console.Write("Salário: ");
            payment = int.Parse(Console.ReadLine());

            employee2.Name = name;
            employee2.Payment = payment;

            Console.WriteLine("Salário médio = " + (employee1.Payment + employee2.Payment) / 2.0);
        }
    }
}
