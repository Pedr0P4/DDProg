function limpar() {
	document.getElementById("mensagem-erro-nome").innerHTML = "";
	document.getElementById("mensagem-erro-altura").innerHTML = "";
	document.getElementById("mensagem-erro-peso").innerHTML = "";
	document.getElementById("resultado").innerHTML = "";
}

function calcular() {
	let name = document.getElementById("name").value;
	let altura = parseFloat(document.getElementById("altura").value);
	let peso = parseFloat(document.getElementById("peso").value);
	let IMC = 0.0;

	let errorCount = 0;

	limpar();

	if(!name.trim()){
		document.getElementById("mensagem-erro-nome").innerHTML = "<h4>Tu não escreveu teu <span class='danger'>Nome</span></h4>"
		errorCount++;
	}

	if(!altura || isNaN(altura)){
		document.getElementById("mensagem-erro-altura").innerHTML = "<h4>Tu não escreveu tua <span class='danger'>Altura</span></h4>"
		errorCount++;
	}
	
	if(isNaN(peso) || peso <= 0){
		document.getElementById("mensagem-erro-peso").innerHTML = "<h4>Tu não escreveu teu <span class='danger'>Peso</span></h4>"
		errorCount++;
	}

	if(errorCount == 0){
		altura /= 100;
		IMC = peso / Math.pow(altura, 2);

		if(IMC < 16) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="grave">Baixo peso muito grave</span></h4>`;
		else if(IMC <= 16.99) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="grave">Baixo peso grave</span></h4>`;
		else if(IMC <= 18.49) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="moderado">Baixo peso</span></h4`;
		else if(IMC <= 24.99) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="normal">Peso normal</span></h4>`;
		else if(IMC <= 29.99) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="moderado">Sobrepeso</span></h4>`;
		else if(IMC <= 34.99) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="grave">Obesidade grau I</span></h4>`;
		else if(IMC <= 39.99) document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="grave">Obesidade grau II</span></h4>`;
		else document.getElementById("resultado").innerHTML = `<h4>${name}, seu IMC é ${IMC.toFixed(2)} e indica <span class="grave">Obesidade grau III</span></h4>`;
	}
}
