using Exercicio1.Entities;

namespace Exercicio1.Entities
{
    internal class OutsourceEmployee : Employee
    {
        public double AdditionalCharge { get; private set; }

        public OutsourceEmployee(string name, int hours, double valuePerHour, double additionalCharge) : base(name, hours, valuePerHour)
        {
            AdditionalCharge = additionalCharge;
        }

        public sealed override double Payment()
        {
            return base.Payment() + (AdditionalCharge * 1.1);
        }
    }
}
