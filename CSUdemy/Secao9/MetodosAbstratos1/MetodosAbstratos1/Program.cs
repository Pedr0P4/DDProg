using System.Globalization;
using System.Net.Http.Headers;
using MetodosAbstratos1.Entities;

namespace MetodosAbstratos1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<TaxPayer> taxPayers = new List<TaxPayer>();

            Console.Write("Enter the number of tax payers: ");
            int taxPayerAmount = int.Parse(Console.ReadLine());

            for(int i = 0; i < taxPayerAmount; i++)
            {
                Console.WriteLine($"Tax Payer #{i+1} data:");
                Console.Write("Individual or company (i/c)? ");
                char answer = char.Parse(Console.ReadLine());
                Console.Write("Name: ");
                string name = Console.ReadLine();
                Console.Write("Annual income: ");
                double annualIncome = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                if(answer == 'i')
                {
                    Console.Write("Health expenditures: ");
                    double healthExpenditures = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                    TaxPayer taxPayer = new IndividualTaxPayer(name, annualIncome, healthExpenditures);
                    taxPayers.Add(taxPayer);
                }
                else if(answer == 'c')
                {
                    Console.Write("Number of employees: ");
                    int numberOfEmployees = int.Parse(Console.ReadLine());

                    TaxPayer taxPayer = new CompanyTaxPayer(name, annualIncome, numberOfEmployees);
                    taxPayers.Add(taxPayer);
                }
            }

            Console.WriteLine();
            Console.WriteLine("TAXES PAID:");
            double totalTaxes = 0.0;

            foreach(TaxPayer tp in taxPayers)
            {
                totalTaxes += tp.Tax();
                Console.WriteLine(tp);
            }

            Console.WriteLine();
            Console.WriteLine("TOTAL TAXES: $ " + totalTaxes.ToString("F2", CultureInfo.InvariantCulture));
        }
    }
}
