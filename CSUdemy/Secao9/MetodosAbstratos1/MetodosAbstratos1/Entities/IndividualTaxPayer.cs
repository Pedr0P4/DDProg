using System.Globalization;

namespace MetodosAbstratos1.Entities
{
    class IndividualTaxPayer : TaxPayer
    {
        public double HealthExpenditures { get; set; }

        public IndividualTaxPayer(string name, double annualIncome, double healthExpenditures) : base(name, annualIncome)
        {
            HealthExpenditures = healthExpenditures;
        }

        public override double Tax()
        {
            double tax = 0.0;

            if(AnnualIncome < 20000)
            {
                tax += AnnualIncome * 0.15;
            }
            else
            {
                tax += AnnualIncome * 0.25;
            }

            tax -= HealthExpenditures * 0.5;

            return tax;
        }

        public override string ToString()
        {
            return Name
                + ": $ "
                + Tax().ToString("F2", CultureInfo.InvariantCulture);
        }
    }
}
