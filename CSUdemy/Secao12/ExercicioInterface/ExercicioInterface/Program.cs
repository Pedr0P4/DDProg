using System.Globalization;

using ExercicioInterface.Entities;
using ExercicioInterface.Services;

namespace ExercicioInterface
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Contract contract;

            Console.WriteLine("Enter contract data");
            Console.Write("Number: ");
            int number = int.Parse(Console.ReadLine());
            Console.Write("Date (dd/MM/yyyy): ");
            DateTime date = DateTime.Parse(Console.ReadLine());
            Console.Write("Contract value: ");
            double contractValue = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            Console.Write("Enter number of installments: ");
            int installmentsAmount = int.Parse(Console.ReadLine());

            contract = new Contract(number, date, contractValue);
            ContractService contractService = new ContractService(new PaypalService());

            contractService.ProcessContract(contract, installmentsAmount);

            Console.WriteLine("Installments:");
            foreach(Installment i in contract.Installments)
            {
                Console.WriteLine(i);
            }
        }
    }
}
