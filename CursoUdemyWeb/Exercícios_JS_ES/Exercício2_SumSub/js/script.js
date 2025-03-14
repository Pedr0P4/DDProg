function calcular() {
	let val1 = document.getElementById("val1").value;
	val1 = val1 === 0 ? 0 : val1;

	let val2 = document.getElementById("val2").value;
	val2 = val2 === 0 ? 0 : val2;

	let operacao = document.getElementById("operacoes").value;

	let resultado = calculoBinario(val1, val2, operacao);

	document.getElementById("resultado").innerHTML = `<h3>Resultado de ${val1} ${operacao} ${val2} é ${resultado}</h3>`;
}

function calculoBinario(v1, v2, op) {
	return eval(`${v1} ${op} ${v2}`);
}
