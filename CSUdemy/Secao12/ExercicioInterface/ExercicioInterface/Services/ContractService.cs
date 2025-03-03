using ExercicioInterface.Entities;
using ExercicioInterface.Interfaces;

namespace ExercicioInterface.Services
{
    class ContractService
    {
        public IOnlinePaymentService OnlinePaymentService { get; set; }

        public ContractService(IOnlinePaymentService onlinePaymentService)
        {
            OnlinePaymentService = onlinePaymentService;
        }

        public void ProcessContract(Contract contract, int months)
        {
            double basicQuota = contract.ContractValue / months;

            for(int i=0; i<months; i++)
            {
                DateTime dueDate = contract.Date.AddMonths(i + 1);
                double updatedQuota = basicQuota + OnlinePaymentService.Interest(basicQuota, i + 1);
                double fullQuota = updatedQuota + OnlinePaymentService.PaymentFee(updatedQuota);

                contract.AddInstallment(new Installment(dueDate, fullQuota));
            }
        }
    }
}
