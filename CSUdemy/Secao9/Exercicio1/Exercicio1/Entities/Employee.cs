using System.Text;
using System.Globalization;

namespace Exercicio1.Entities
{
    class Employee
    {
        public string Name { get; protected set; }
        public int Hours { get; protected set; }
        public double ValuePerHour { get; protected set; }

        public Employee(string name, int hours, double valuePerHour)
        {
            Name = name;
            Hours = hours;
            ValuePerHour = valuePerHour;
        }

        public virtual double Payment()
        {
            return ValuePerHour * Hours;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Name);
            sb.Append(" - $ ");
            sb.Append(Payment().ToString("F2", CultureInfo.InvariantCulture));

            return sb.ToString();
        }
    }
}
