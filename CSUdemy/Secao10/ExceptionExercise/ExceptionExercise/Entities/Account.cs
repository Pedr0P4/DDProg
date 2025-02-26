using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

using ExceptionExercise.Exceptions;

namespace ExceptionExercise.Entities
{
    class Account
    {
        public int Number { get; set; }
        public string Holder { get; set; }
        public double Balance { get; set; }
        public double WithdrawLimit { get; set; }

        public Account(int number, string holder, double balance, double withdrawLimit)
        {
            Number = number;
            Holder = holder;
            Balance = balance;
            WithdrawLimit = withdrawLimit;
        }

        public void deposit(double amount)
        {
            Balance += amount;
        }

        public void withdraw(double amount)
        {
            if(amount > Balance)
            {
                throw new NotEnoughBalanceException("Not Enough Balance!");
            }

            if(amount > WithdrawLimit)
            {
                throw new WithdrawLimitExceededException("Withdraw Limit Exceeded!");
            }

            Balance -= amount;
        }
    }
}
