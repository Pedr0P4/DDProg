using System.Globalization;
using System.Security.Cryptography;

namespace Exercicio6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double cotacaoDolar;
            double quantidadeDolar;

            Console.Write("Qual a cotação do dólar? ");
            cotacaoDolar = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            Console.Write("Quantos dólares você vai comprar? ");
            quantidadeDolar = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

            Console.WriteLine("Valor a ser pago em reais = " + ConversorDeMoeda.Converter(cotacaoDolar, quantidadeDolar).ToString("F2", CultureInfo.InvariantCulture));
        }
    }
}
