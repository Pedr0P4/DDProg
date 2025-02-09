using System.Globalization;

namespace ExercicioListas
{
    internal class Employee
    {
        public int Id {  get; private set; }
        public string Name { get; set; }
        public double Salary { get; set; }

        public Employee(int id, string name)
        {
            Id = id;
            Name = name;
            Salary = 0.0;
        }

        public Employee(int id, string name, double salary) : this(id, name) 
        {
            Salary = salary;
        }

        public void IncreaseSalary(double percentage)
        {
            double adjustedPercentage = percentage / 100;
            double amountToAdd = Salary * adjustedPercentage;
            Salary += amountToAdd;
        }

        public override string ToString()
        {
            return Id 
                + ", " 
                + Name 
                + ", "  
                + Salary.ToString("F2", CultureInfo.InvariantCulture);
        }
    }
}
