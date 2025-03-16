let input = document.getElementById("word-input"); 
let array = Array();
let isSorted = true;

let elementos = document.getElementById("elementos"); 

function adicionar() {
	let value = input.value;
	if(value === "" || !value.trim()){
		window.alert("O campo está vazio!");
	} else if(array.indexOf(value) != -1){
		window.alert("Já existe esse valor no array!");
	} else{
		array.push(value);
		elementos.innerHTML += `<h3>${value}</h3>`;
		if(array.length > 1 && array[array.length - 2] > value){
			isSorted = false;
		}
	}
}

function ordenar() {
	if(array.length <= 0){
		window.alert("Não há elementos para ordenar!");
	} else if(isSorted === true){
		window.alert("Já está ordenado!");
	} else{
		array.sort();
		elementos.innerHTML = "";
		for(let i in array){
			elementos.innerHTML += `<h3>${array[i]}</h3>`;
		}
		isSorted = true;
	}
}
