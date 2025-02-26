namespace ExceptionExercise.Exceptions
{
    class WithdrawLimitExceededException : ApplicationException
    {
        public WithdrawLimitExceededException(string message) : base(message) { }
    }
}
