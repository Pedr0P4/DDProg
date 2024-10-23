using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace csharpbasics3
{
    internal class Product
    {
        public string ProductName;
        public string Description;
        public double Price { get; private set; }
        public DateTime ManufacturingDate;
        public double Weight;

        public Product()
        {
            Price = 10.99;
            ManufacturingDate = DateTime.Now;
        }
    }
}
