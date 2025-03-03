using System.Globalization;

namespace ExercicioInterface.Entities
{
    class Installment
    {
        public DateTime DueDate { get; set; }
        public double amount { get; set; }

        public Installment(DateTime dueDate, double amount)
        {
            DueDate = dueDate;
            this.amount = amount;
        }

        public override string ToString()
        {
            return DueDate.ToString("dd/MM/yyyy")
                + " - "
                + amount.ToString("F2", CultureInfo.InvariantCulture);
        }
    }
}
