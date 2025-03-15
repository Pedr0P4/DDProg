let campo = document.getElementById("inp");

function focused() {
	campo.style.backgroundColor = "yellow";
}

function unfocused() {
	if(campo.value.length < 3) campo.style.backgroundColor = "red";
	else campo.style.backgroundColor = "green";
}
