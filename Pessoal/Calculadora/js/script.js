let visor = document.getElementById("visor");
let conteudo_visor = visor.value;

let canOperate = false;
let canDot = true;

let bracketsOpen = 0;

function MidAppend(str, posToAdd, strToAdd) {
	if(str === undefined || str.trim() === "") return null;
	if(posToAdd > str.length) return null;

	let pt1 = str.slice(0, posToAdd+1);
	let pt2 = str.slice(posToAdd+1, str.length);

	return pt1 + strToAdd + pt2;
}

function MidRemove(str, pos1, pos2) {
	if(str === undefined || str.trim() === "") return null;
	if(pos1 > pos2 && pos1 > str.length) return null;
	if(pos2 > str.length) return null;

	let pt1 = str.slice(0, pos1+1);
	let pt2 = str.slice(pos2, str.length);
	
	return pt1 + pt2;
}

function digitar(digito) {
	visor.value += digito;
	canOperate = true;
}

function digitarOperador(operador) {
	if(canOperate){
		if(visor.value[visor.value.length-1] === ","){
			visor.value += "0";
		}
		visor.value += ` ${operador} `;
		canOperate = false;
		canDot = true;
	}	
}

function invertSignal() {
	let valor = visor.value;

	if(valor.trim() == "") return;

	if(canOperate){
		for(let i = valor.length-1; i > 0; i--){
			
			if(valor[i] === " "){
				visor.value = MidAppend(valor, i, "(-");
				bracketsOpen++;
				break;
			}
			
			if(bracketsOpen > 0 && valor[i] === "-" && valor[i-1] === "(") {
				visor.value = MidRemove(valor, i-1, i+1);
				break;
			} else if(bracketsOpen > 0 && valor[i] === "("){
				visor.value = MidAppend(valor, i, "-");
				break;
			} 
		}
	}
}

function openCloseBracket() {
	if(!canOperate){
		visor.value += "(";
		bracketsOpen++;
	} else if(bracketsOpen > 0){
		visor.value += ")";
		bracketsOpen--;
	}
}

function dot() {
	if(visor.value.trim() === "") return;

	if(canDot && canOperate){
		visor.value += ",";
		canDot = false;
	}
}

function sqrtBt() {
	if(!canOperate){
		visor.value += "Sqrt(";
		bracketsOpen++;
	}
}

function apagar() {
	let valor = visor.value;
	if(valor[valor.length-1] === " "){
		visor.value = valor.slice(0, -3);
		canOperate = true;
	}else if(valor[valor.length-1] === "(" && valor[valor.length-2] === "t"){
		visor.value = valor.slice(0, -5);
		bracketsOpen--;
	}else{
		if(valor[valor.length-1] === "(") bracketsOpen--;
		else if(valor[valor.length-1] === ")") bracketsOpen++;
		visor.value = valor.slice(0, -1);	
	}

	if(visor.value[visor.value.length-1] === " ") canOperate = false;
}

function clearBt() {
	visor.value = "";
	bracketsOpen = 0;
	canOperate = false;
}
