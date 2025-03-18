let altura = 0;
let largura = 0;
let vidas = 3;
let tempo = 15;
let dificuldade = window.location.search.replace("?", "");
let cria_mosquito_tempo = 0;

switch(dificuldade){
	case "normal":
		cria_mosquito_tempo = 1500;
		break;

	case "dificil":
		cria_mosquito_tempo = 1000;
		break;

	case "chucknorris":
		cria_mosquito_tempo = 750;
		break;

	default:
		cria_mosquito_tempo = 0;
		break;
}

function UpdateSize() {
    altura = window.innerHeight;
    largura = window.innerWidth;
    console.log(largura, altura);
}

UpdateSize();

function DrawMosquito(){
	
	if(document.getElementById("mosquito")){
		document.getElementById("mosquito").remove();
		if(vidas > 0){
			document.getElementById("v" + vidas--).src = "../imagens/coracao_vazio.png";
		} else {
			window.location.href = "../game_over.html";
		}
	}

    let positionX = Math.abs(Math.floor(Math.random() * largura) - 90);
    let positionY = Math.abs(Math.floor(Math.random() * altura) - 90);

    let mosquito = document.createElement("img");
    mosquito.src = "imagens/mosquito.png";
    mosquito.className = RandomizarClasse() + " " + RandomizarLado();
	mosquito.id = "mosquito";
    mosquito.style.position = "absolute";
    mosquito.style.left = positionX + "px";
    mosquito.style.top = positionY + "px";
	mosquito.onclick = function() {
		this.remove();
	}

    document.body.appendChild(mosquito);
    console.log(positionX, positionY);
}

function RandomizarClasse() {
    let classe = Math.floor(Math.random() * 3)+1;
    return "mosquito" + classe;
}

function RandomizarLado() {
    let lado = (Math.floor(Math.random() * 2)) === 0 ? "ladoA" : "ladoB";
    return lado;
}

document.getElementById("tempo").innerHTML = tempo;

let cronometro = setInterval(function() {
	document.getElementById("tempo").innerHTML = tempo;

	if(tempo > 0){
		tempo--;
	} else{
		clearInterval(cronometro);
		clearInterval(criaMosquito);
		window.location.href = "vitoria.html";
	}
}, 1000)

let criaMosquito = setInterval(function() {
	DrawMosquito();
}, cria_mosquito_tempo);
