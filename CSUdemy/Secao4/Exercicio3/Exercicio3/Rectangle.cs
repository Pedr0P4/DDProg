namespace Exercicio3
{
    internal class Rectangle
    {
        public double Width;
        public double Height;

        public double Area()
        {
            return (Width * Height);
        }

        public double Perimeter()
        {
            return ((2 * Height) + (2 * Width));
        }

        public double Diagonal()
        {
            return Math.Sqrt(Width * Width + Height * Height);
        }
    }
}
