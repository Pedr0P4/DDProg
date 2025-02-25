namespace MetodosAbstratos1.Entities
{
    abstract class TaxPayer
    {
        public string Name { get; set; }
        public double AnnualIncome { get; set; }

        protected TaxPayer(string name, double annualIncome)
        {
            Name = name;
            AnnualIncome = annualIncome;
        }

        public abstract double Tax();
    }
}
