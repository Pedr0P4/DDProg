import tkinter as tk
from tkinter import ttk
import sqlite3

root = tk.Tk()

class Funcs():
    def limpa_tela(self):
        self.codigo_entry.delete(0, tk.END)
        self.nome_entry.delete(0, tk.END)
        self.telefone_entry.delete(0, tk.END)
        self.cidade_entry.delete(0, tk.END)
    def conectar_bd(self):
        self.conn = sqlite3.connect('clientes.db')
        self.cursor = self.conn.cursor(); print("Conectando ao banco de dados")
    def desconectar_bd(self):
        self.conn.close(); print("Desconectando ao banco de dados")
    def montar_tabelas(self):
        self.conectar_bd()
        ### Criar tabela
        self.cursor.execute(
            """
            CREATE TABLE IF NOT EXISTS clientes (
                cod INTEGER PRIMARY KEY,
                nome_cliente CHAR(40) NOT NULL,
                telefone NUMERIC(20),
                cidade CHAR(40)
            );
            """
        )
        self.conn.commit(); print("Banco de dados criado")
        self.desconectar_bd()
    def entrys(self):
        self.codigo = self.codigo_entry.get()
        self.nome = self.nome_entry.get()
        self.telefone = self.telefone_entry.get()
        self.cidade = self.cidade_entry.get()

        if (self.telefone == ''):
            self.telefone = "Não especificado"
        if (self.cidade == ''):
            self.cidade = "Não especificado"
    def add_cliente(self):
        self.entrys()
        self.conectar_bd()
        self.cursor.execute("""INSERT INTO clientes(nome_cliente, telefone, cidade)
            VALUES (?, ?, ?)""", (self.nome, self.telefone, self.cidade))
        self.conn.commit()
        self.desconectar_bd()
        self.select_lista()
        self.limpa_tela()
    def select_lista(self):
        self.listaCli.delete(*self.listaCli.get_children())
        self.conectar_bd()
        lista = self.cursor.execute("""SELECT cod, nome_cliente, telefone, cidade FROM clientes
            ORDER BY nome_cliente ASC;""")
        for i in lista:
            self.listaCli.insert("", tk.END, values=i)
        self.desconectar_bd()
    def on_double_click(self, event):
        self.limpa_tela()
        self.listaCli.selection()

        for n in self.listaCli.selection():
            col1, col2, col3, col4 = self.listaCli.item(n, 'values')
            self.codigo_entry.insert(tk.END, col1)
            self.nome_entry.insert(tk.END, col2)
            self.telefone_entry.insert(tk.END, col3)
            self.cidade_entry.insert(tk.END, col4)
    def deleta_cliente(self):
        self.entrys()
        self.conectar_bd()
        self.cursor.execute("""DELETE FROM clientes WHERE cod = ? """, (self.codigo))
        self.conn.commit()
        self.desconectar_bd()
        self.limpa_tela()
        self.select_lista()
    def alterar_cliente(self):
        self.entrys()
        self.conectar_bd()
        self.cursor.execute("""UPDATE clientes SET nome_cliente = ?, telefone = ?, cidade = ? 
            WHERE cod = ?""", (self.nome, self.telefone, self.cidade, self.codigo))
        self.conn.commit()
        self.desconectar_bd()
        self.select_lista()
        self.limpa_tela()


class Application(Funcs):
    def __init__(self):
        self.root = root
        self.tela()
        self.frames_da_tela()
        self.widgets_frame1()
        self.lista_frame2()
        self.montar_tabelas()
        self.select_lista()
        self.Menus()
        root.mainloop()
    def tela(self):
        self.root.title("Cadastro de clientes")
        self.root.configure(background="#b0c4de")
        self.root.geometry("700x500")
        self.root.resizable(True, True)
        self.root.maxsize(width=900, height=700)
        self.root.minsize(width=700, height=500)
    def frames_da_tela(self):
        self.frame_1 = tk.Frame(self.root, bd=4, bg="#ebfaf8", highlightbackground="#aab3b2", highlightthickness=3)
        self.frame_1.place(relx=0.025, rely=0.025, relwidth=0.95, relheight=0.45)

        self.frame_2 = tk.Frame(self.root, bd=4, bg="#ebfaf8", highlightbackground="#aab3b2", highlightthickness=3)
        self.frame_2.place(relx=0.025, rely=0.5, relwidth=0.95, relheight=0.45)
    def widgets_frame1(self):
        ### Criação do botão limpar
        self.bt_limpar = tk.Button(self.frame_1, text="Limpar", bd=0, bg="#32b1e3", fg="white", font=("verdana", 10, "bold"), command=self.limpa_tela)
        self.bt_limpar.place(relx=0.2, rely=0.1, relwidth=0.1, relheight=0.15)
        ### Criação do botão buscar
        self.bt_buscar = tk.Button(self.frame_1, text="Buscar", bd=0, bg="#32b1e3", fg="white", font=("verdana", 10, "bold"))
        self.bt_buscar.place(relx=0.3, rely=0.1, relwidth=0.1, relheight=0.15)
        ### Criação do botão novo
        self.bt_novo = tk.Button(self.frame_1, text="Novo", bd=0, bg="#32b1e3", fg="white", font=("verdana", 10, "bold"), command=self.add_cliente)
        self.bt_novo.place(relx=0.6, rely=0.1, relwidth=0.1, relheight=0.15)
        ### Criação do botão alterar
        self.bt_alterar = tk.Button(self.frame_1, text="Alterar", bd=0, bg="#32b1e3", fg="white", font=("verdana", 10, "bold"), command=self.alterar_cliente)
        self.bt_alterar.place(relx=0.7, rely=0.1, relwidth=0.1, relheight=0.15)
        ### Criação do botão apagar
        self.bt_apagar = tk.Button(self.frame_1, text="Apagar", bd=0, bg="#32b1e3", fg="white", font=("verdana", 10, "bold"), command=self.deleta_cliente)
        self.bt_apagar.place(relx=0.8, rely=0.1, relwidth=0.1, relheight=0.15)

        ### Criação da label e entrada do código
        self.lb_codigo = tk.Label(self.frame_1, text="Código", bg="#ebfaf8", fg="#5a6473", font=("verdana", 10, "bold"))
        self.lb_codigo.place(relx=0.05, rely=0.05)

        self.codigo_entry = tk.Entry(self.frame_1, bd=0, fg="#5a6473")
        self.codigo_entry.place(relx=0.05, rely=0.15, relwidth=0.08)

        ### Criação da label e entrada do nome
        self.lb_nome = tk.Label(self.frame_1, text="Nome", bg="#ebfaf8", fg="#5a6473", font=("verdana", 10, "bold"))
        self.lb_nome.place(relx=0.05, rely=0.35)

        self.nome_entry = tk.Entry(self.frame_1, bd=0, fg="#5a6473")
        self.nome_entry.place(relx=0.05, rely=0.45, relwidth=0.85)

        ### Criação da label e entrada do telefone
        self.lb_telefone = tk.Label(self.frame_1, text="Telefone", bg="#ebfaf8", fg="#5a6473", font=("verdana", 10, "bold"))
        self.lb_telefone.place(relx=0.05, rely=0.65)

        self.telefone_entry = tk.Entry(self.frame_1, bd=0, fg="#5a6473")
        self.telefone_entry.place(relx=0.05, rely=0.75, relwidth=0.4)

        ### Criação da label e entrada da cidade
        self.lb_cidade = tk.Label(self.frame_1, text="Cidade", bg="#ebfaf8", fg="#5a6473", font=("verdana", 10, "bold"))
        self.lb_cidade.place(relx=0.5, rely=0.65)

        self.cidade_entry = tk.Entry(self.frame_1, bd=0, fg="#5a6473")
        self.cidade_entry.place(relx=0.5, rely=0.75, relwidth=0.4  )
    def lista_frame2(self):
        self.listaCli = ttk.Treeview(self.frame_2, height=3, column=("col1", "col2", "col3", "col4"))

        ### Definição dos nomes das colunas
        self.listaCli.heading("#0", text="")
        self.listaCli.heading("#1", text="Código")
        self.listaCli.heading("#2", text="Nome")
        self.listaCli.heading("#3", text="Telefone")
        self.listaCli.heading("#4", text="Cidade")

        ### Definição dos tamanhos das colunas
        self.listaCli.column("#0", width=1)
        self.listaCli.column("#1", width=50)
        self.listaCli.column("#2", width=200)
        self.listaCli.column("#3", width=125)
        self.listaCli.column("#4", width=125)

        self.listaCli.place(relx=0.01, rely=0.01, relwidth=0.95, relheight=0.95)

        self.scrollLista = tk.Scrollbar(self.frame_2, orient="vertical")
        self.listaCli.configure(yscroll=self.scrollLista.set)
        self.scrollLista.place(relx=0.96, rely=0.015, relheight=0.95, relwidth=0.03)
        self.listaCli.bind("<Double-1>", self.on_double_click)
    def Menus(self):
        menubar = tk.Menu(self.root)
        self.root.config(menu=menubar)
        filemenu = tk.Menu(menubar)
        filemenu2 = tk.Menu(menubar)

        def Quit(): self.root.destroy()

        menubar.add_cascade(label="Opções", menu=filemenu)
        menubar.add_cascade(label="Sobre", menu=filemenu2)

        filemenu.add_command(label="Sair", command=Quit)
        filemenu2.add_command(label="Limpar Dados", command=self.limpa_tela)


Application()