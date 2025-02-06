namespace Exercicio6
{
    class ConversorDeMoeda
    {
        public static double Converter(double cotacao, double quantidade)
        {
            double bruto = cotacao * quantidade;
            double IOF = bruto * 0.06;
            return bruto + IOF;
        }
    }
}
