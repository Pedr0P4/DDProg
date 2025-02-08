using System.Globalization;

namespace ExercicioBanco
{
    class Conta
    {
        private string _numeroConta;
        private string _nomeTitularConta;
        public double Saldo { get; private set; }

        public Conta(string numeroConta, string nomeTitular)
        {
            _numeroConta = numeroConta;
            _nomeTitularConta = nomeTitular;
        }

        public Conta(string numeroConta, string nomeTitular, double depositoInicial) : this(numeroConta, nomeTitular)
        {
            Depositar(depositoInicial);
        }

        public string NumeroConta
        {
            get { return _numeroConta; }
            set
            {
                if (value != null && value.Length > 0)
                {
                    _numeroConta = value;
                }
            }
        }

        public string NomeTitularConta
        {
            get { return _nomeTitularConta; }
            set
            {
                if (value != null && value.Length > 0)
                {
                    _nomeTitularConta = value;
                }
            }
        }

        public void Depositar(double valor)
        {
            Saldo += valor;
        }

        public void Sacar(double valor)
        {
            Saldo -= valor + 5.0; //O +5 é a taxa do banco kkkk
        }

        public override string ToString()
        {
            return "Conta "
                + NumeroConta
                + ", Titular: "
                + NomeTitularConta
                + ", Saldo: $ "
                + Saldo.ToString("F2", CultureInfo.InvariantCulture);
        }
    }
}
