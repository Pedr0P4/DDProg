namespace ExercicioArquivos.Entities
{
    class Order
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public int Amount { get; set; }

        public Order(string name, double price, int amount)
        {
            Name = name;
            Price = price;
            Amount = amount;
        }

        public double TotalPrice()
        {
            return (double)Price * Amount;
        }
    }
}
