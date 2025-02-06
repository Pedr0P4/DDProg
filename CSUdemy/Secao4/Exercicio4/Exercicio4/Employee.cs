namespace Exercicio4
{
    internal class Employee
    {
        public string Name;
        public double Payment;
        public double Tax;

        public double SalarioLiquido()
        {
            return Payment - Tax;
        }

        public void AumentarSalario(double porcentagem)
        {
            double porcentagemOperacao = porcentagem / 100;
            Payment = Payment * porcentagemOperacao + Payment;
        }

        public override string ToString()
        {
            return Name + ", $ " + SalarioLiquido();
        }
    }
}
