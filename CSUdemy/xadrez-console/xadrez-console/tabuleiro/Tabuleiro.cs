namespace tabuleiro
{
    class Tabuleiro
    {
        public int linhas { get; set; }
        public int colunhas { get; set; }
        private Peca[,] pecas;

        public Tabuleiro(int linhas, int colunhas)
        {
            this.linhas = linhas;
            this.colunhas = colunhas;
            pecas = new Peca[linhas, colunhas];
        }
    }
}
