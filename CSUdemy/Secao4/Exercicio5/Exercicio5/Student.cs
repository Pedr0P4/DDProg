namespace Exercicio5
{
    internal class Student
    {
        public string Name;
        public double N1;
        public double N2;
        public double N3;

        public double GradeSum()
        {
            return N1+N2+N3;
        }

        public double MissingGrade()
        {
            return 60 - GradeSum();
        }
    }
}
