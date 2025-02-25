using System.Globalization;

namespace MetodosAbstratos1.Entities
{
    class CompanyTaxPayer : TaxPayer
    {
        public int NumberOfEmployees { get; set; }

        public CompanyTaxPayer(string name, double annualIncome, int numberOfEmployees) : base(name, annualIncome)
        {
            NumberOfEmployees = numberOfEmployees;
        }

        public override double Tax()
        {
            double tax = 0.0;

            if(NumberOfEmployees <= 10)
            {
                tax += AnnualIncome * 0.16;
            }
            else
            {
                tax += AnnualIncome * 0.14;
            }

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
