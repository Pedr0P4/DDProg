let altura = 0;
let largura = 0;

function UpdateSize() {
    altura = window.innerHeight;
    largura = window.innerWidth;
    console.log(largura, altura);
}

UpdateSize();

function DrawMosquito(){
    let positionX = Math.abs(Math.floor(Math.random() * largura) - 90);
    let positionY = Math.abs(Math.floor(Math.random() * altura) - 90);

    let mosquito = document.createElement("img");
    mosquito.src = "imagens/mosquito.png";
    mosquito.className = RandomizarClasse() + " " + RandomizarLado();
    mosquito.style.position = "absolute";
    mosquito.style.left = positionX + "px";
    mosquito.style.top = positionY + "px";

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

DrawMosquito();