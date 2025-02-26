namespace ExceptionExercise.Exceptions
{
    class NotEnoughBalanceException : ApplicationException
    {
        public NotEnoughBalanceException(string message) : base(message) { }
    }
}
