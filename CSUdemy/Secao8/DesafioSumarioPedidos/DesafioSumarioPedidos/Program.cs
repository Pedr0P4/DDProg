using System.Globalization;
using DesafioSumarioPedidos.Entities;
using DesafioSumarioPedidos.Entities.Enums;

namespace DesafioSumarioPedidos
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter client data:");
            Console.Write("Name: ");
            string name = Console.ReadLine();
            Console.Write("E-mail: ");
            string email = Console.ReadLine();
            Console.Write("Birth date (DD/MM/YYYY): ");
            DateTime birthDate = DateTime.Parse(Console.ReadLine());

            Client client = new Client(name, email, birthDate);

            Console.WriteLine("Enter order data:");
            Console.Write("Status: ");
            OrderStatus status = Enum.Parse<OrderStatus>(Console.ReadLine());
            Console.Write("How many items to this order? ");
            int orderAmount = int.Parse(Console.ReadLine());

            Order order = new Order(DateTime.Now, status, client);

            for(int i = 0; i < orderAmount; i++)
            {
                Console.WriteLine($"Enter #{i+1} item data:");
                Console.Write("Product name: ");
                string productName = Console.ReadLine();
                Console.Write("Product price: ");
                double productPrice = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
                Console.Write("Quantity: ");
                int productAmount = int.Parse(Console.ReadLine());

                Product item = new Product(productName, productPrice);
                OrderItem orderItem = new OrderItem(productAmount, item);
                order.AddItem(orderItem);
            }
            Console.WriteLine();

            Console.WriteLine("ORDER SUMMARY:");
            Console.WriteLine(order);
        }
    }
}
