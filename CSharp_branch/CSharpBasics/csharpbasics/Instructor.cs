using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace csharpbasics2
{
    internal class Instructor
    {
        //fields
        public string Name;
        public DateTime HiringDate;
        public FacultyLevel FacultyLevel;
        public bool IsTenured;

        //methods
        public void ChangeName(string Name)
        {
            this.Name = Name;
        }

        public int YearsSinceHired()
        {
            return (int)(DateTime.Now.Subtract(HiringDate).Days / 365.25);
        }
    }
}
