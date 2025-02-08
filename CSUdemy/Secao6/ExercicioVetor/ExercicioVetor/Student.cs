namespace ExercicioVetor
{
    class Student
    {
        private string _name;
        private string _email;
        public int Room { get; set; }

        public Student(string name, string email, int room)
        {
            _name = name;
            _email = email;
            Room = room;
        }

        public string Name
        {
            get { return _name; }
            set
            {
                if (value != null && value.Length > 0)
                {
                    _name = value;
                }
            }
        }

        public string Email
        {
            get { return _email; }
            set
            {
                if (value != null && value.Length > 0)
                {
                    _email = value;
                }
            }
        }

        public override string ToString()
        {
            return Room + ": " + Name + ", " + Email;
        }
    }
}
