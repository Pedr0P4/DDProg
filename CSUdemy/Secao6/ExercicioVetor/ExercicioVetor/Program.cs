namespace ExercicioVetor
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("How many rooms will be rented? ");
            int rents = int.Parse(Console.ReadLine());

            Student[] rooms = new Student[10];

            for (int i = 0; i < rents; i++)
            {
                Console.WriteLine("Rent #" + (i+1) + ":");
                Console.Write("Name: ");
                string name = Console.ReadLine();
                Console.Write("E-mail: ");
                string email = Console.ReadLine();
                Console.Write("Room: ");
                int room = int.Parse(Console.ReadLine());

                if(room >= 0 && room <= 9)
                {
                    rooms[room] = new Student(name, email, room);
                }
                else
                {
                    Console.WriteLine("Quarto " + room + " indisponível (0-9)");
                }
            }

            for (int i = 0; i < 10; i++)
            {
                if(rooms[i] != null)
                {
                    Console.WriteLine(rooms[i]);
                }
            } 
        }
    }
}
