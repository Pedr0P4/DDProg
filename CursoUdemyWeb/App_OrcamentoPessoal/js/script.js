class Despesa {
	constructor(ano, mes, dia, tipo, descricao, valor){
		if(dia.length == 1) this.dia = "0" + dia;
		else this.dia = dia;

		this.ano = ano;
		this.mes = mes;
		this.tipo = tipo;
		this.descricao = descricao;
		this.valor = valor;
	}

	validarDados(){
		for(let i in this){
			if(this[i] === undefined || this[i].trim() === "" || this[i] === null){
				return false;
			}
		}

		return true;
	}
}

class Bd {
	constructor() {
		let id = localStorage.getItem("id");
		console.log(id);
		if(id === null) localStorage.setItem("id", 0);
	}

	getProximoId() {
		let proximoId = localStorage.getItem("id");
		return parseInt(proximoId)+1;
	}

	gravar(d) {
		let id = this.getProximoId();

		localStorage.setItem("id", id);
		localStorage.setItem(id, JSON.stringify(d));
	}

	recuperarTodosRegistros() {
		let id = localStorage.getItem("id");
		let despesas = Array();

		for(let i = 1; i <= id; i++){
			let despesa = JSON.parse(localStorage.getItem(i));
			if(despesa === null) continue;

			despesa.id = i;
			despesas.push(despesa);
		}

		return despesas;
	}

	pesquisar(d) {
		let despesasFiltradas = Array();
		despesasFiltradas = this.recuperarTodosRegistros();

		if(d.ano != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => despesa.ano == d.ano);
		}

		if(d.mes != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => despesa.mes == d.mes);
		}

		if(d.dia != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => parseInt(despesa.dia) == parseInt(d.dia));
		}

		if(d.tipo != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => despesa.tipo == d.tipo);
		}

		if(d.descricao != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => despesa.descricao == d.descricao);
		}

		if(d.valor != ""){
			despesasFiltradas = despesasFiltradas.filter(despesa => despesa.valor == d.valor);
		}

		return despesasFiltradas;
	}
}

let bd = new Bd();

function cadastrarDespesa() {
	let ano = document.getElementById("ano");
	let mes = document.getElementById("mes");
	let dia = document.getElementById("dia");
	let tipo = document.getElementById("tipo");
	let descricao = document.getElementById("descricao");
	let valor = document.getElementById("valor");

	let despesa = new Despesa(
		ano.value,
		mes.value,
		dia.value,
		tipo.value,
		descricao.value,
		valor.value
	);
	
	let modalTitle = document.getElementById("ModalLabel");
	let modalText = document.getElementById("ModalText");
	let modalBackButton = document.getElementById("ModalBackButton");
	if(despesa.validarDados()){
		bd.gravar(despesa);
		modalTitle.innerHTML = "Sucesso na gravação";
		modalTitle.className = "modal-title text-success";
		modalText.innerHTML = "Sucesso no registro da despesa!";
		modalBackButton.className = "btn btn-secondary btn-success";
		//Modal de sucesso
		$("#modalDeGravacao").modal("show");

		ano.value = "";
		mes.value = "";
		dia.value = "";
		tipo.value = "";
		descricao.value = "";
		valor.value = "";
	} else{
		modalTitle.innerHTML = "Erro na gravação";
		modalTitle.className = "modal-title text-danger";
		modalText.innerHTML = "Há campos obrigatórios que não foram preenchidos...";
		modalBackButton.className = "btn btn-secondary btn-danger";
		//Modal de erro
		$("#modalDeGravacao").modal("show");
	}
}

function carregarListaDespesas(despesas = Array(), filter = false){
	
	if(despesas.length == 0 && filter == false) despesas = bd.recuperarTodosRegistros();

	let listaDespesas = document.getElementById("dados");
	listaDespesas.innerHTML = '';
	
	despesas.forEach(function(d) {
		let linha = listaDespesas.insertRow();
		linha.insertCell(0).innerHTML = `${d.dia}/${d.mes}/${d.ano}`;

		switch(parseInt(d.tipo)){
			case 1:
				d.tipo = "Alimentação";
				break;
			case 2:
				d.tipo = "Educação";
				break;
			case 3:
				d.tipo = "Lazer";
				break;
			case 4:
				d.tipo = "Saúde";
				break;
			case 5:
				d.tipo = "Transporte";
				break;
			default:
				d.tipo = undefined;
				break;
		}

		linha.insertCell(1).innerHTML = d.tipo;
		linha.insertCell(2).innerHTML = d.descricao;
		linha.insertCell(3).innerHTML = d.valor;

		//Botão de excluir
		let btn = document.createElement("button");
		btn.className = "btn btn-danger";
		btn.innerHTML = "<i class='fas fa-times'></i>";
		btn.id = "id_despesa_" + d.id;
		btn.onclick = function() {
			id = btn.id.replace("id_despesa_", "");
			localStorage.removeItem(id);
			window.location.reload();
		}
		linha.insertCell(4).append(btn);
	});
}

function pesquisarDespesas(){
	let ano = document.getElementById("ano");
	let mes = document.getElementById("mes");
	let dia = document.getElementById("dia");
	let tipo = document.getElementById("tipo");
	let descricao = document.getElementById("descricao");
	let valor = document.getElementById("valor");

	let despesa = new Despesa(
		ano.value,
		mes.value,
		dia.value,
		tipo.value,
		descricao.value,
		valor.value
	);

	let filtro = bd.pesquisar(despesa);
	carregarListaDespesas(filtro, true);
}
