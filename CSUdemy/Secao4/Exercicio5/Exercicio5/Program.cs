using System.Globalization;

namespace Exercicio5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Student student = new Student();

            Console.Write("Nome do aluno: ");
            student.Name = Console.ReadLine();
            Console.WriteLine("Digite as 3 notas do aluno:");
            student.N1 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            student.N2 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);
            student.N3 = double.Parse(Console.ReadLine(), CultureInfo.InvariantCulture);

            Console.WriteLine("NOTA FINAL = " + student.GradeSum());
            if(student.MissingGrade() <= 0)
            {
                Console.WriteLine("APROVADO");
            }
            else
            {
                Console.WriteLine("REPROVADO");
                Console.WriteLine("FALTARAM " + student.MissingGrade().ToString("F2", CultureInfo.InvariantCulture) + " PONTOS");
            }
        }
    }
}
