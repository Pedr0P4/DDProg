/**
 * Função para pesquisar e exibir os resultados em uma seção HTML.
 *
 * Itera sobre um conjunto de dados (assumido como um array de objetos) e
 * para cada objeto, cria um elemento HTML representando um resultado da pesquisa.
 * O resultado final é inserido na seção HTML com o ID "resultados-pesquisa".
 */
function pesquisar() {
    // Seleciona a seção HTML onde os resultados serão exibidos.
    let section = document.getElementById("resultados-pesquisa");
  
    // Seleciona o valor do campo de pesquisa (input);
    let campoPesquisa = document.getElementById("campo-pesquisa").value;

    // Inicializa uma string vazia para armazenar o HTML dos resultados.
    let resultados = "";
  
    if(!campoPesquisa){
        section.innerHTML = "<p>Nada encontrado. Por favor, digite algo!<p>"
        return;
    }

    // Itera sobre os dados e constrói o HTML para cada resultado.
    for (let dado of dados) {
        if(dado.titulo.toLowerCase().includes(campoPesquisa.toLowerCase()) || dado.tags.toLowerCase().includes(campoPesquisa.toLowerCase())){
            resultados += `
                <div class="item-resultado">
                <h2>${dado.titulo}</h2>
                <p class="descricao-meta">${dado.descricao}</p> <br>
                <a href="${dado.steam}" target="_blank"><img src="steam-logo.png" alt="Logo Steam"></a>
                </div>
            `;
        }
    }
  
    if(!resultados) resultados = "<p>Nada encontrado...</p>"
    
    // Atualiza o conteúdo HTML da seção com os resultados construídos.
    section.innerHTML = resultados;
  }