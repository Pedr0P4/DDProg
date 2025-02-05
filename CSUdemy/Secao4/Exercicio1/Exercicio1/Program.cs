using System;

namespace Exercicio1
{
    class Program
    {
        static void Main(string[] args)
        {
            string name;
            int age;

            Person pessoa1 = new Person();
            Person pessoa2 = new Person();

            Console.WriteLine("Dados da primeira pessoa:");
            Console.Write("Nome: ");
            name = Console.ReadLine();
            Console.Write("Idade: ");
            age = int.Parse(Console.ReadLine());

            pessoa1.Name = name;
            pessoa1.Age = age;

            Console.WriteLine("Dados da segunda pessoa:");
            Console.Write("Nome: ");
            name = Console.ReadLine();
            Console.Write("Idade: ");
            age = int.Parse(Console.ReadLine());

            pessoa2.Name = name;
            pessoa2.Age = age;

            if (pessoa1.Age > pessoa2.Age)
            {
                Console.WriteLine("Pessoa mais velha: " + pessoa1.Name);
            }
            else 
            {
                Console.WriteLine("Pessoa mais velha: " + pessoa2.Name);
            }
        }
    }
}