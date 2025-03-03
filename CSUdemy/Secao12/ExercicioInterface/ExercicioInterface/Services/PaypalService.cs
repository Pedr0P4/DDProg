using ExercicioInterface.Interfaces;

namespace ExercicioInterface.Services
{
    class PaypalService : IOnlinePaymentService
    {
        private const double FEE_PERCENTAGE = 0.02;
        private const double MONTHLY_INTEREST = 0.01;

        public double PaymentFee(double amount)
        {
            return amount * FEE_PERCENTAGE;
        }

        public double Interest(double amount, int months)
        {
            return amount * MONTHLY_INTEREST * months;
        }
    }
}
