using System.Globalization;
using System.Collections.Generic;
using HerancaPolimorfismo1.Entities;

namespace HerancaPolimorfismo1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of products: ");
            int productAmount = int.Parse(Console.ReadLine());

            List<Product> products = new List<Product>();

            for(int i = 0; i < productAmount; i++)
            {
                Console.WriteLine($"Product #{i+1} data:");
                Console.Write("Common, used or imported (c/u/i)? ");
                char answer = char.Parse(Console.ReadLine());
                Console.Write("Name: ");
                string name = Console.ReadLine();
                Console.Write("Price: ");
                double price = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                if(answer == 'u')
                {
                    Console.Write("Manufacture date (DD/MM/YYYY): ");
                    DateTime date = DateTime.Parse(Console.ReadLine());

                    Product usedProduct = new UsedProduct(name, price, date);
                    products.Add(usedProduct);
                }
                else if(answer == 'i')
                {
                    Console.Write("Customs fee: ");
                    double customsFee = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

                    Product importedProduct = new ImportedProduct(name, price, customsFee);
                    products.Add(importedProduct);
                }
                else if(answer == 'c')
                {
                    Product commonProduct = new Product(name, price);
                    products.Add(commonProduct);
                }
            }

            Console.WriteLine();
            Console.WriteLine("PRICE TAGS:");

            foreach(Product p in products)
            {
                Console.WriteLine(p.PriceTag());
            }
        }
    }
}
